public class Clyde extends Ghost {
  PImage up = loadImage("yellowUp.png");
  PImage right = loadImage("yellowRight.png");
  PImage down = loadImage("yellowDown.png");
  PImage left = loadImage("yellowLeft.png");
  PImage dead = loadImage("scareddd.png"); 
  PImage eyes = loadImage("eyess.png"); 
  PImage white = loadImage("whiteghost.png");

  public Clyde(int x, int y ) {
    xPos = x; 
    yPos = y; 
    trueXPos = x*26+13;
    trueYPos = y*26+13;
    timeToSpawn = 1500;
  }

  public void move() {
    if (!alive) {
      maxmovecounter = deadmove;
      movecounter = deadmove;
      if (xPos < 14) {
        houseLeave(13, 11);
      } else {
        houseLeave(14, 11);
      }
      if (gameMap.getVal(xPos, yPos) == 4) {
        alive = true;
        eaten = true;
      }
    } else if (timeToSpawn > 0) {
      maxmovecounter = normmove;
      movecounter = normmove;
      houseMove();
    } else if (spawned == false) {
      maxmovecounter = normmove;
      movecounter = normmove;
      houseLeave(14, 11);
      if (yPos <= 11) {
        spawned = true;
      }
    } else if (Player.getSpecial() && !eaten) {
      maxmovecounter = slowmove;
      movecounter = slowmove;
      wander();
    } else {
      switch (mode) {
      case "Chase": 
        { 
          double distance = Math.sqrt(((Player.getXPos() - xPos) * (Player.getXPos() - xPos)) + ((Player.getYPos() - yPos) * (Player.getYPos() - yPos)));
          if (distance <= 8) {
            maxmovecounter = normmove;
            movecounter = normmove;
            moveTo(0, 26);
          } else {
            maxmovecounter = normmove;
            movecounter = normmove;
            moveTo(Player.getXPos(), Player.getYPos());
          }
          break;
        }
      case "Scatter": 
        {
          maxmovecounter = normmove;
          movecounter = normmove;
          moveTo(0, 26);
          break;
        }
      }
    }
  }


  public void drawSelf() {
    if (timeToSpawn > 0) {
      timeToSpawn--;
    }
    // condition 1 
    if (movecounter > 0) {

      // condition 1a: no special stay normal 
      if ((!Player.getSpecial() && alive) || (Player.getSpecial() && eaten)) {
        if (getDirection() == "Up") {
          image(up, 3 +getXPos()*26, getYPos()*26+26*movecounter/maxmovecounter + 3); 
          setTrueXPos(13+getXPos()*26); 
          setTrueYPos(13+getYPos()*26+26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Down") {
          image(down, 3+ getXPos()*26, getYPos()*26-26*movecounter/maxmovecounter +3 ); 
          setTrueXPos(13+getXPos()*26); 
          setTrueYPos(13+getYPos()*26-26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Left") {
          image(left, 3+  getXPos()*26+26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(13+getXPos()*26+26.0*movecounter/maxmovecounter); 
          setTrueYPos(13+getYPos()*26);
        } else if (getDirection() == "Right") {
          image(right, 3 + getXPos()*26-26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(13+getXPos()*26-26.0*movecounter/maxmovecounter); 
          setTrueYPos(13+getYPos()*26);
        }
        movecounter--;
      }

      // condition 1b: has special = turn blue 
      else if (Player.getSpecial() && alive) {
        if (Player.modetimer <= 240 && (Player.modetimer / 15) % 2 == 1) {
          if (getDirection() == "Up") {
            image(white, 3 +getXPos()*26, getYPos()*26+26*movecounter/maxmovecounter + 3); 
            setTrueXPos(13+getXPos()*26); 
            setTrueYPos(13+getYPos()*26+26.0*movecounter/maxmovecounter);
          } else if (getDirection() == "Down") {
            image(white, 3+ getXPos()*26, getYPos()*26-26*movecounter/maxmovecounter +3 ); 
            setTrueXPos(13+getXPos()*26); 
            setTrueYPos(13+getYPos()*26-26.0*movecounter/maxmovecounter);
          } else if (getDirection() == "Left") {
            image(white, 3+  getXPos()*26+26*movecounter/maxmovecounter, getYPos()*26 +3); 
            setTrueXPos(13+getXPos()*26+26.0*movecounter/maxmovecounter); 
            setTrueYPos(13+getYPos()*26);
          } else if (getDirection() == "Right") {
            image(white, 3 + getXPos()*26-26*movecounter/maxmovecounter, getYPos()*26 +3); 
            setTrueXPos(13+getXPos()*26-26.0*movecounter/maxmovecounter); 
            setTrueYPos(13+getYPos()*26);
          }
        } else {
          if (getDirection() == "Up") {
            image(dead, 3 +getXPos()*26, getYPos()*26+26*movecounter/maxmovecounter + 3); 
            setTrueXPos(13+getXPos()*26); 
            setTrueYPos(13+getYPos()*26+26.0*movecounter/maxmovecounter);
          } else if (getDirection() == "Down") {
            image(dead, 3+ getXPos()*26, getYPos()*26-26*movecounter/maxmovecounter +3 ); 
            setTrueXPos(13+getXPos()*26); 
            setTrueYPos(13+getYPos()*26-26.0*movecounter/maxmovecounter);
          } else if (getDirection() == "Left") {
            image(dead, 3+  getXPos()*26+26*movecounter/maxmovecounter, getYPos()*26 +3); 
            setTrueXPos(13+getXPos()*26+26.0*movecounter/maxmovecounter); 
            setTrueYPos(13+getYPos()*26);
          } else if (getDirection() == "Right") {
            image(dead, 3 + getXPos()*26-26*movecounter/maxmovecounter, getYPos()*26 +3); 
            setTrueXPos(13+getXPos()*26-26.0*movecounter/maxmovecounter); 
            setTrueYPos(13+getYPos()*26);
          }
        }
        movecounter--;
      }

      //condition 1c: if not alive turn into eyes 
      else if (!alive) {
        if (getDirection() == "Up") {
          image(eyes, 3 +getXPos()*26, getYPos()*26+26*movecounter/maxmovecounter + 3); 
          setTrueXPos(13+getXPos()*26); 
          setTrueYPos(13+getYPos()*26+26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Down") {
          image(eyes, 3+ getXPos()*26, getYPos()*26-26*movecounter/maxmovecounter +3 ); 
          setTrueXPos(13+getXPos()*26); 
          setTrueYPos(13+getYPos()*26-26.0*movecounter/maxmovecounter);
        } else if (getDirection() == "Left") {
          image(eyes, 3+  getXPos()*26+26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(13+getXPos()*26+26.0*movecounter/maxmovecounter); 
          setTrueYPos(13+getYPos()*26);
        } else if (getDirection() == "Right") {
          image(eyes, 3 + getXPos()*26-26*movecounter/maxmovecounter, getYPos()*26 +3); 
          setTrueXPos(13+getXPos()*26-26.0*movecounter/maxmovecounter); 
          setTrueYPos(13+getYPos()*26);
        }
        movecounter--;
      }


      // condition 2
    } else if (movecounter <= 0) {

      //condition2a
      if ((!Player.getSpecial() && alive) || (Player.getSpecial() && eaten)) {
        if (getDirection() == "Up") {
          image(up, 3+getXPos()*26, getYPos()*26+3);
        } else if (getDirection() == "Down") {
          image(down, 3+getXPos()*26, getYPos()*26+3);
        } else if (getDirection() == "Left") {
          image(left, 3+getXPos()*26, getYPos()*26+3);
        } else if (getDirection() == "Right") {
          image(right, 3+getXPos()*26, getYPos()*26+3);
        }
        setTrueXPos(13+getXPos()*26); 
        setTrueYPos(13+getYPos()*26);
      }

      // condition 2b
      else if (Player.getSpecial() && alive) {
        if (Player.modetimer <= 240 && (Player.modetimer / 15) % 2 == 1) {
          if (getDirection() == "Up") {
            image(white, 3+getXPos()*26, getYPos()*26+3);
          } else if (getDirection() == "Down") {
            image(white, 3+getXPos()*26, getYPos()*26+3);
          } else if (getDirection() == "Left") {
            image(white, 3+  getXPos()*26, getYPos()*26+3);
          } else if (getDirection() == "Right") {
            image(white, 3 + getXPos()*26, getYPos()*26+3);
          }
        } else {
          if (getDirection() == "Up") {
            image(dead, 3+getXPos()*26, getYPos()*26+3);
          } else if (getDirection() == "Down") {
            image(dead, 3+getXPos()*26, getYPos()*26+3);
          } else if (getDirection() == "Left") {
            image(dead, 3+  getXPos()*26, getYPos()*26+3);
          } else if (getDirection() == "Right") {
            image(dead, 3 + getXPos()*26, getYPos()*26+3);
          }
        }
        setTrueXPos(13+getXPos()*26); 
        setTrueYPos(13+getYPos()*26);
      }

      // condition 2c 
      else if (!alive) {
        if (getDirection() == "Up") {
          image(eyes, 3+getXPos()*26, getYPos()*26+3);
        } else if (getDirection() == "Down") {
          image(eyes, 3+getXPos()*26, getYPos()*26+3);
        } else if (getDirection() == "Left") {
          image(eyes, 3+getXPos()*26, getYPos()*26+3);
        } else if (getDirection() == "Right") {
          image(eyes, 3+getXPos()*26, getYPos()*26+3);
        }
        setTrueXPos(13+getXPos()*26); 
        setTrueYPos(13+getYPos()*26);
      }

      move();
    }
  }
}
