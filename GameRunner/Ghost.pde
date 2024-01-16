public abstract class Ghost implements Entities {
  public int xPos;
  public int yPos;
  public float trueXPos;
  public float trueYPos;
  public float radius = 2;
  public String direction = "Up";
  public int modetimer = 600;
  public int movecounter;
  public boolean spawned = false;
  public int timeToSpawn;
  final public String[] modes = new String[] {"Chase", "Wander"};
  public boolean alive = true;
  public int maxmovecounter;
  public boolean eaten;

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


  public void moveTo(int targetX, int targetY) { 
    double right; 
    double left; 
    double up; 
    double down; 

    // right dist
    if (direction != "Left" && !nextToBlock("Right")) {
      right = Math.sqrt(((targetX - (xPos + 1)) * (targetX - (xPos + 1))) + ((targetY - yPos) * (targetY - yPos)));
    } else {
      right = 2000000;
    }

    // left dist
    if (direction != "Right" && !nextToBlock("Left")) {
      left = Math.sqrt(((targetX - (xPos - 1)) * (targetX - (xPos - 1)) ) + ((targetY - yPos) * (targetY - yPos)));
    } else {
      left = 2000000;
    }

    // up dist 
    if (direction != "Down" && !nextToBlock("Up")) {
      up = Math.sqrt(((targetX - xPos) * (targetX - xPos)) + ((targetY - (yPos - 1)) * (targetY - (yPos - 1))));
    } else {
      up = 2000000;
    }

    // down dist
    if (direction != "Up" && !nextToBlock("Down")) {
      down = Math.sqrt(((targetX - xPos) * (targetX - xPos)) + ((targetY - (yPos + 1)) * (targetY - (yPos + 1))));
    } else {
      down = 2000000;
    }

    if (up <= right && up <= left && up <= down && !nextToBlock("Up")) { 
      yPos--;
      direction = "Up";
    } else if (left <= right && left <= up && left <= down && !nextToBlock("Left")) {
      xPos --;
      if (gameMap.getVal(getXPos(), getYPos()) == 5) {
        setXPos(26);
      }
      direction = "Left";
    } else if (down <= right && down <= up && down <= left && !nextToBlock("Down")) { 
      yPos++;
      direction = "Down";
    } else if (right <= left && right <= down && right <= up && !nextToBlock("Right")) { 
      xPos++;
      if (gameMap.getVal(getXPos(), getYPos()) == 5) {
        setXPos(1);
      }
      direction = "Right";
    }
  } 

  public void houseMove() {
    if ((direction.equals("Up") && yPos == 12) || ((direction.equals("Down") && yPos == 13))) {
      yPos++;
      direction = "Down";
    } else {
      yPos--;
      direction = "Up";
    }
  }

  public void houseLeave(int targetX, int targetY) {
    double right; 
    double left; 
    double up; 
    double down; 


    // right dist
    if (direction != "Left" && !(gameMap.map[yPos][xPos+1] == 1)) {
      right = Math.sqrt(((targetX - (xPos + 1)) * (targetX - (xPos + 1))) + ((targetY - yPos) * (targetY - yPos)));
    } else {
      right = 2000000;
    }

    // left dist
    if (direction != "Right" && !(gameMap.map[yPos][xPos-1] == 1)) {
      left = Math.sqrt(((targetX - (xPos - 1)) * (targetX - (xPos - 1)) ) + ((targetY - yPos) * (targetY - yPos)));
    } else {
      left = 2000000;
    }

    // up dist 
    if (direction != "Down" && !(gameMap.map[yPos-1][xPos] == 1)) {
      up = Math.sqrt(((targetX - xPos) * (targetX - xPos)) + ((targetY - (yPos - 1)) * (targetY - (yPos - 1))));
    } else {
      up = 2000000;
    }

    // down dist
    if (direction != "Up" && !(gameMap.map[yPos+1][xPos] == 1)) {
      down = Math.sqrt(((targetX - xPos) * (targetX - xPos)) + ((targetY - (yPos + 1)) * (targetY - (yPos + 1))));
    } else {
      down = 2000000;
    }

    if (up <= right && up <= left && up <= down && !(gameMap.map[yPos-1][xPos] == 1)) { 
      yPos--;
      direction = "Up";
    } else if (left <= right && left <= up && left <= down && !(gameMap.map[yPos][xPos-1] == 1)) {
      xPos --;
      if (gameMap.getVal(getXPos(), getYPos()) == 5) {
        setXPos(26);
      }
      direction = "Left";
    } else if (down <= right && down <= up && down <= left && !(gameMap.map[yPos+1][xPos] == 1)) { 
      yPos++;
      direction = "Down";
    } else if (right <= left && right <= down && right <= up && !(gameMap.map[yPos][xPos+1] == 1)) { 
      xPos++;
      if (gameMap.getVal(getXPos(), getYPos()) == 5) {
        setXPos(1);
      }
      direction = "Right";
    }
  }

  public void respawn() {
    alive = false;
    eye.play();
  }

  public void wander() {
    ArrayList<String> direcs = new ArrayList<String>();
    if (direction != "Down" && !nextToBlock("Up")) { 
      direcs.add("Up");
    } 
    if (direction != "Right" && !nextToBlock("Left")) {
      direcs.add("Left");
    } 
    if (direction != "Up" && !nextToBlock("Down")) { 
      direcs.add("Down");
    } 
    if (direction != "Left" && !nextToBlock("Right")) { 
      direcs.add("Right");
    } 
    String chosenddir = direcs.get((int)(Math.random() * direcs.size()));
    direction = chosenddir;
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
          setXPos(0);
        } 
        break;
      }
    }
  }
}
