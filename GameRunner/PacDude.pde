import processing.sound.*; //<>// //<>// //<>// //<>// //<>//

public class PacDude implements Entities {
  private int xPos;
  private int yPos;
  private float trueXPos;
  private float trueYPos;
  public int radius = 11;
  public int pelletsEaten;
  private boolean specialAbility;
  private String direction;
  private String queueddir;
  private int movecounter;
  private float mouthstate = 1.0;
  public int modetimer = 0; 
  private int maxmovecounter = 8;
  int counter = 0 ; 


  public PacDude(int x, int y) {
    xPos = x;
    yPos = y;
    pelletsEaten = 0;
    specialAbility = false;
    direction = "Left";
    queueddir = "None";
  }

  public PacDude(int x, int y, int oldpellets) {
    xPos = x;
    yPos = y;
    pelletsEaten = oldpellets;
    specialAbility = false;
    direction = "Left";
    queueddir = "None";
  }

  public int getXPos() {
    return xPos;
  }

  public int getYPos() {
    return yPos;
  }

  public void setXPos(int newpos) {
    xPos = newpos;
  }

  public void setYPos(int newpos) {
    yPos = newpos;
  }

  public float getTrueXPos() {
    return trueXPos;
  }

  public float getTrueYPos() {
    return trueYPos;
  }

  public void setTrueXPos(float newpos) {
    trueXPos = newpos;
  }

  public void setTrueYPos(float newpos) {
    trueYPos = newpos;
  }

  public String getDirection() {
    return direction;
  }

  public void setDirection(String newdir) {
    direction = newdir;
  }

  public String getQueuedDirection() {
    return queueddir;
  }

  public void setQueuedDirection(String newdir) {
    queueddir = newdir;
  }

  public boolean getSpecial() {
    return specialAbility;
  }

  public void setSpecial(boolean hasspec) {

    if (specialAbility == true && hasspec == false) { 
      backgroundsound.play(); 
      pellet.stop();
    }

    if (specialAbility == false && hasspec == true) { 
      backgroundsound.pause(); 
      pellet.play();
    }



    if (specialAbility == true) {
      for (int i = 0; i < Ghosts.length; i++) {
        Ghosts[i].eaten = false;
      }
    }

    specialAbility = hasspec;
  }

  public int getPelletsEaten() { 
    return pelletsEaten;
  } 

  public void eatPellet() { 
    score += 10;
    pelletsEaten++;
  } 

  public boolean nextToBlock(String checkdir) {
    switch (checkdir) {
    case "Up": 
      {
        return (gameMap.map[yPos-1][xPos] == 1 || gameMap.map[yPos-1][xPos] == 4);
      }
    case "Down": 
      {
        return (gameMap.map[yPos+1][xPos] == 1 || gameMap.map[yPos+1][xPos] == 4);
      }
    case "Left": 
      {
        return (gameMap.map[yPos][xPos-1] == 1 || gameMap.map[yPos][xPos-1] == 4 );
      }
    case "Right": 
      {
        return (gameMap.map[yPos][xPos+1] == 1 || gameMap.map[yPos][xPos+1] == 4 );
      }
    }
    return true;
  }

  public void move() {    

    if (gameMap.getVal(getXPos(), getYPos()) == 2) {

      gameMap.setVal(getXPos(), getYPos(), 0); 
      eatPellet();
      counter ++;
    } 
    if (gameMap.getVal(getXPos(), getYPos()) == 3) {
      gameMap.setVal(getXPos(), getYPos(), 0); 
      Player.setSpecial(true);
      modetimer = 510 - 30 * level;
      if (modetimer < 0) {
        modetimer = 0;
      }
      Player.eatPellet();
    } 
    if (!nextToBlock(direction)) {
      movecounter = maxmovecounter;
      switch (direction) {
      case "Up": 
        {
          yPos--;
          break;
        }
      case "Down": 
        {
          yPos++;
          break;
        }
      case "Left": 
        {
          xPos--;
          if (gameMap.getVal(getXPos(), getYPos()) == 5) {
            setXPos(26);
          } 
          break;
        }
      case "Right": 
        {
          xPos++;
          if (gameMap.getVal(getXPos(), getYPos()) == 5) {
            setXPos(1);
          } 
          break;
        }
      }
    }
  }

  public void drawSelf() {
    // this allows pacdude to have immunity for a certain amount of time after eating a power pellet. 
    if (modetimer > 0) {
      modetimer --;
    }
    if (modetimer == 0) { 
      setSpecial(false);
    } 

    float anglestart = 0;
    float angleend = 0;
    if (movecounter == 0 && !nextToBlock(getQueuedDirection())) {
      setDirection(getQueuedDirection());
      setQueuedDirection("None");
    }
    if (getDirection() == "Up") {
      anglestart = 315; 
      angleend = 585;
    } else if (getDirection() == "Down") {
      anglestart = 135; 
      angleend = 405;
    } else if (getDirection() == "Left") {
      anglestart = 225; 
      angleend = 495;
    } else if (getDirection() == "Right") {
      anglestart = 45; 
      angleend = 315;
    }
    if (movecounter > 0) {
      mouthstate = mouthstate % (2*maxmovecounter) + 1;
      if (getDirection() == "Up") {
        arc(getXPos()*26+13, getYPos()*26+13+26*movecounter/maxmovecounter, 22, 22, radians(anglestart - 45 / (movecounter/mouthstate*5)), radians(angleend + 45 / (movecounter/mouthstate*5))); 
        setTrueXPos(getXPos()*26+13); 
        setTrueYPos(getYPos()*26+13+26.0*movecounter/maxmovecounter);
      } else if (getDirection() == "Down") {
        arc(getXPos()*26+13, getYPos()*26+13-26*movecounter/maxmovecounter, 22, 22, radians(anglestart - 45 / (movecounter/mouthstate*5)), radians(angleend + 45 / (movecounter/mouthstate*5))); 
        setTrueXPos(getXPos()*26+13); 
        setTrueYPos(getYPos()*26+13-26.0*movecounter/maxmovecounter);
      } else if (getDirection() == "Left") {
        arc(getXPos()*26+13+26*movecounter/maxmovecounter, getYPos()*26+13, 22, 22, radians(anglestart - 45 / (movecounter/mouthstate*5)), radians(angleend + 45 / (movecounter/mouthstate*5))); 
        setTrueXPos(getXPos()*26+13+26.0*movecounter/maxmovecounter); 
        setTrueYPos(getYPos()*26+13);
      } else if (getDirection() == "Right") {
        arc(getXPos()*26+13-26*movecounter/maxmovecounter, getYPos()*26+13, 22, 22, radians(anglestart - 45 / (movecounter/mouthstate*5)), radians(angleend + 45 / (movecounter/mouthstate*5))); 
        setTrueXPos(getXPos()*26+13-26.0*movecounter/maxmovecounter); 
        setTrueYPos(getYPos()*26+13);
      }
      movecounter--;
    } else {
      arc(getXPos()*26+13, getYPos()*26+13, 22, 22, radians(anglestart), radians(angleend));
      setTrueXPos(getXPos()*26+13);
      setTrueYPos(getYPos()*26+13);
      move();
    }
  }
}
