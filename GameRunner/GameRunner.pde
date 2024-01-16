import processing.sound.*; //<>// //<>// //<>//
import java.util.*;

Map gameMap;
PacDude Player;
int score = 0; 
Ghost[] Ghosts; 
int Lives;
boolean started;
boolean won;
boolean lost;
int modetimer;
String mode;
int startDelay;
int soundtimer = 600; 
SoundFile backgroundsound; 
SoundFile pellet; 
SoundFile eye; 
SoundFile death; 
SoundFile rain;
int count;
int level;
int normmove;
int deadmove;
int slowmove;
boolean toKill;
PImage wall;
PImage fire;
PImage leftred; 
PImage leftyellow;
PImage rightblue;
PImage rightpink;
PImage yup;
PImage red1;
PImage orange;
PImage blue;
PImage pink;
boolean randomgame; 

void setup() {
  Lives = 3;
  Player = new PacDude(13, 16);
  size(729, 729);
  started = false;
  fire = loadImage("firevillage.gif");
  leftred = loadImage("redGhostLeft.png");
  leftyellow = loadImage("yellowLeft.png");
  rightblue = loadImage("blueRight.png");
  rightpink = loadImage("pinkRight.png");
  red1 = loadImage("redGhostUp.png");
  yup = loadImage("yup.jpg");
  orange = loadImage("yellowUp.png");
  pink = loadImage("pinkUp.png");
  blue = loadImage("blueUp.png");
  won = false;
  lost = false;
  PrintStart();
  startDelay = 180;
  count = 0;
  level = 1;
  normmove = 10;
  deadmove = 2;
  slowmove = 15;
  normmove = 10 - level / 5;
  toKill = false;

  Ghosts = new Ghost[4];
  Ghosts[0] = new Blinky(13, 11);
  Ghosts[1] = new Clyde(15, 13);
  Ghosts[2] = new Inky(13, 13);
  Ghosts[3] = new Pinky(11, 13);
  modetimer = 600;
  mode = "Scatter";
  backgroundsound = new SoundFile(this, "vov.wav"); // starter music 
  pellet = new SoundFile(this, "nopp.wav");
  eye = new SoundFile(this, "neva.wav");
  death = new SoundFile(this, "op.wav");
  wall = loadImage("walll.jpg");
  rain = new SoundFile(this, "rain.wav");
  backgroundsound.play();
}

void draw() {
  if (won) {
    level++;
    if (randomgame) {
      gameMap = new Map();
    } else {
      gameMap = new Map(1);
    }
    if (Player.getSpecial()) {
      pellet.stop();
      backgroundsound.play();
    }
    Player = new PacDude(13, 16);
    won = false;
    Ghosts = new Ghost[4];
    Ghosts[0] = new Blinky(13, 11);
    Ghosts[1] = new Clyde(15, 13);
    Ghosts[2] = new Inky(13, 13);
    Ghosts[3] = new Pinky(11, 13);
    modetimer = 600;
    mode = "Scatter";
    startDelay = 180;
    normmove = 10 - level / 2;
  }
  if (!started) {
    PrintStart();
  } else if (!lost) {
    if (startDelay > 0) {
      startDelay--;
      PrintMap(); 
      image(red1, 3 + Ghosts[0].getXPos()*26, Ghosts[0].getYPos()*26 + 3);
      image(orange, 3 + Ghosts[1].getXPos()*26, Ghosts[1].getYPos()*26 + 3);
      image(blue, 3 + Ghosts[2].getXPos()*26, Ghosts[2].getYPos()*26 + 3);
      image(pink, 3 + Ghosts[3].getXPos()*26, Ghosts[3].getYPos()*26 + 3);
      fill(255, 255, 0); 
      arc(13*26+13, 16*26+13, 22, 22, radians(225), radians(495));
      text("Ready!", 335, 410);
      textSize(40);
      text(startDelay/60+1, 350, 490);
    } else {
      modetimer--;
      if (modetimer <= 0) {
        if (mode.equals("Scatter")) {
          mode = "Chase";
        } else {
          mode = "Scatter";
        }
        modetimer = 600;
      }
      PrintMap();
      fill(255, 255, 0);
      Player.drawSelf();
      for (int i = 0; i < Ghosts.length; i ++) {
        Ghosts[i].drawSelf();
        // if the player has special then the ghost will die 
        // however this ability only last for a mode timer of 510, or 8.5 seconds
        if (Ghosts[i].alive && dist(Player.getTrueXPos(), Player.getTrueYPos(), Ghosts[i].getTrueXPos(), Ghosts[i].getTrueYPos()) <= 20) {
          if (Player.getSpecial() && !Ghosts[i].eaten) {
            Ghosts[i].respawn();
            int ghostseaten = 0;
            for (int j = 0; j < Ghosts.length; j++) {
              if (Ghosts[j].eaten || !Ghosts[j].alive) {
                ghostseaten++;
              }
            }
            score += Math.pow(2, ghostseaten) * 100;
          } else {
            toKill = true;
          }
        }
      }
      if (toKill) {
        respawn();
        death.play();
      }
      won = Player.getPelletsEaten() == gameMap.getPellets();
      lost = Lives <= 0;
    }
  } else {
    PrintEnd();
  }
}

void keyPressed() {
  if (!started) {
    if (key == ENTER) {
      randomgame = false; 
      started = true;
      gameMap = new Map(1);
    } else if (key == ' ') {
      randomgame = true; 
      started = true;
      gameMap = new Map();
    }
  } else if (lost) {
    if (key == ENTER) {
      Lives = 3;
      gameMap = new Map(1);
      randomgame = false; 
      Player = new PacDude(13, 16);
      score = 0;
      size(729, 729);
      started = true;
      won = false;
      lost = false;
      Ghosts = new Ghost[4];
      Ghosts[0] = new Blinky(13, 11);
      Ghosts[1] = new Clyde(15, 13);
      Ghosts[2] = new Inky(13, 13);
      Ghosts[3] = new Pinky(11, 13);
      modetimer = 600;
      mode = "Scatter";
      startDelay = 180;
      rain.stop();
      backgroundsound.play();
      count = 0;
      level = 1;
      toKill = false;
    } else if (key == ' ') {
      Lives = 3;
      gameMap = new Map();
      randomgame = true; 
      Player = new PacDude(13, 16);
      score = 0;
      size(729, 729);
      started = true;
      won = false;
      lost = false;
      Ghosts = new Ghost[4];
      Ghosts[0] = new Blinky(13, 11);
      Ghosts[1] = new Clyde(15, 13);
      Ghosts[2] = new Inky(13, 13);
      Ghosts[3] = new Pinky(11, 13);
      modetimer = 600;
      mode = "Scatter";
      startDelay = 180;
      rain.stop();
      backgroundsound.play();
      count = 0;
      level = 1;
      toKill = false;
    }
  } else {
    if (key == CODED) {
      if (keyCode == UP) {
        Player.setQueuedDirection("Up");
      } else if (keyCode == DOWN) {
        Player.setQueuedDirection("Down");
      } else if (keyCode == LEFT) {
        Player.setQueuedDirection("Left");
      } else if (keyCode == RIGHT) {
        Player.setQueuedDirection("Right");
      }
    }
  }
}

void PrintMap() {
  background(0);
  for (int i =0; i < 28; i ++) { 
    for (int j= 0; j < 27; j++) { 
      if (gameMap.getVal(i, j) == 1) { 
        fill(0, 255, 100);
        image(wall, i* 26, j *26 );
      }
      if (gameMap.getVal(i, j) == 2) { 
        fill(255); 
        circle(i * 26 + 13, j * 26 + 13, 5 );
      }

      if (gameMap.getVal(i, j) == 3) { 
        if ((((modetimer / 10) % 2 == 0)) ) {
          fill(255, 255, 0);
          circle(i * 26 + 13, j * 26 + 13, 14);
        }
      }
    }
  }

  textSize(20);
  fill(255, 255, 0);

  text("Score: " + score, 170, 725);
  text("Level: " + level, 330, 725);
  text("Lives: " + Lives, 490, 725);
}

void PrintStart() {
  background(fire);
  textSize(80);
  fill(0, 128, 255);
  text("Pac-Dude", 195, 200);

  fill(255);

  textSize(20);

  text("Everyone from your village has been killed by evil ghosts.", 84, 475);
  text("However you can go back in time and stop it from happening.", 63, 500);
  text("To get this power, you must first collect all the pellets!", 95, 525);

  image(leftyellow, 425, 350); 
  image(leftred, 475, 350); 
  image(rightblue, 295, 350); 
  image(rightpink, 245, 350); 
  textSize(25);
  fill(255);

  text("Press Enter to Play Normal Mode", 170, 650);
  text("Press Space to Play Random Mode", 160, 700);

  fill(255, 255, 0);
  arc(370, 350, 50, 50, radians(30), radians(330));
}

void PrintEnd() {

  backgroundsound.stop(); 
  pellet.stop(); 
  eye.stop();
  death.stop();
  if (count == 0) {
    rain.play(); 
    count++;
  }

  if (gameMap.getPellets() - Player.getPelletsEaten() != 0) {
    background(yup);
  }
  textSize(25);
  fill(255);
  text("But I shall give you another chance", 150, 500);

  // text("Press Enter to Play Again", 185, 575);

  text("Press Enter to Play Normal Mode", 165, 650);
  text("Press Space to Play Random Mode", 156, 700);
}

void respawn() {
  Lives--;
  if (Lives != 0) {
    if (Player.getSpecial()) {
      pellet.stop();
      backgroundsound.play();
    }
    Player = new PacDude(13, 16, Player.getPelletsEaten());
    Ghosts = new Ghost[4];
    Ghosts[0] = new Blinky(13, 11);
    Ghosts[1] = new Clyde(15, 13);
    Ghosts[2] = new Inky(13, 13);
    Ghosts[3] = new Pinky(11, 13);
    modetimer = 600;
    mode = "Scatter";
    startDelay = 180;
    toKill = false;
  }
}
