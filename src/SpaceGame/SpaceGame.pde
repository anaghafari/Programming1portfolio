// Anahita Ghafari | Nov 28 | Space Game
import processing.sound.*;
SoundFile blaster;
Ship s1;

Timer rockTimer, puTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> laser = new ArrayList<Laser>();
Star[] stars = new Star [750];
int score, level, rockRate, Rocks, Lasers, rockCount, rocksPassed;
boolean play;

void setup() {
  size(800, 800);
  s1 = new Ship();
  rockRate = 500;
  puTimer = new Timer(int(random(7000, 15000)));
  puTimer.start();
  rockTimer = new Timer(rockRate);
  rockTimer.start();
  blaster = new SoundFile(this, "blast.wav");
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  //Rocks = Rock;
  level = 1;
  play = false;
  rocksPassed = 0;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    
    background(0);
    // Level handeling
    if (frameCount % 1000 == 10) {
      level++;
      rockRate-=100;
      
    }

    // Rendering stars
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }

    noCursor();


    //Add PowerUps
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
      println("PowerUp:" +powerups.size());
      // rockCount++;
    }



    // Rendering powerups and detecting ship collosion
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(s1)) {
        if (pu.type== 'H') {
          s1.health+=50;
        } else {
          s1.ammo+=50;
        }
        powerups.remove(pu);
      }
      if (pu.reachedBottom()) {
        rocks.remove(pu);
      } else {
        pu.display();
        pu.move();
      }
    }
    // Add rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      println("Rocks:" +rocks.size());
      // rockCount++;
    }
    // Rendering rocks and detecting ship collosion
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=25;
        //to do call explostion animation
        //add a sound for explosion
        //todo consider rock health
        score-=r.diam;
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
        rocksPassed++;
        Rocks ++;
      } else {
        r.display();
        r.move();
      }
    }

    //  Rneder laserson the screen and detect rock collision
    for (int i = 0; i < laser.size(); i++) {
      Laser l = laser.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (r.intersect(l)) {
          score+=25;
          // add sound to collision
          //todo: Add animation to the collision
          //todo: dectrement the rock health
          laser.remove(l);
          r.diam-=50;
          if (r.diam<30) {
            rocks.remove(r);
          }
        }
        if (l.reachedTop()) {
          laser.remove(l);
          Lasers ++;
          // Ammo ++;
        } else {
          l.display();
          l.move();
        }
      }
    }
    s1.display(mouseX, mouseY);
    infoPanel();

    // Game over logic
    if (s1.health<1 || rocksPassed >10 ) {
      gameOver();
      noLoop();
    }
  }
}
// Add Laser based on event
void mousePressed() {
  if (play) {
    blaster.stop();
    blaster.play();
  }
  if (s1.fire() && s1.turretCount == 1) {
    laser.add(new Laser(s1.x, s1.y));
    println("Laser:" + laser.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    laser.add(new Laser(s1.x-20, s1.y));
    laser.add(new Laser(s1.x+20, s1.y));
    println("Laser:" + laser.size());
  } else if (s1.fire() && s1.turretCount == 3) {
    laser.add(new Laser(s1.x-20, s1.y));
    laser.add(new Laser(s1.x-35, s1.y));
    laser.add(new Laser(s1.x+20, s1.y));
    println("Laser:" + laser.size());
  } else if (s1.fire() && s1.turretCount == 4) {
    laser.add(new Laser(s1.x-20, s1.y));
    laser.add(new Laser(s1.x-35, s1.y));
    laser.add(new Laser(s1.x+35, s1.y));
    laser.add(new Laser(s1.x+20, s1.y));
    println("Laser:" + laser.size());
  }
}

void keyPressed() {
  blaster.stop();
  blaster.play();
  if (key == ' ') {
    if (s1.fire() && s1.turretCount == 1) {
      laser.add(new Laser(s1.x, s1.y));
      println("Laser:" + laser.size());
    } else if (s1.fire() && s1.turretCount == 2) {
      laser.add(new Laser(s1.x-20, s1.y));
      laser.add(new Laser(s1.x+20, s1.y));
      println("Laser:" + laser.size());
    } else  if (s1.fire() && s1.turretCount == 3) {
      laser.add(new Laser(s1.x-20, s1.y));
      laser.add(new Laser(s1.x-35, s1.y));
      laser.add(new Laser(s1.x+20, s1.y));
      println("Laser:" + laser.size());
    } else if (s1.fire() && s1.turretCount == 4) {
      laser.add(new Laser(s1.x-20, s1.y));
      laser.add(new Laser(s1.x-35, s1.y));
      laser.add(new Laser(s1.x+35, s1.y));
      laser.add(new Laser(s1.x+20, s1.y));
      println("Laser:" + laser.size());
    }
  }
}
void infoPanel() {
  fill(129, 128);
  rectMode(CENTER);
  rect(width/2, 25, width/2, 50);
  fill(255);
  textSize(15);
  textAlign(CENTER);
  text("Score:" + score, 235, 42);
  text("Level:" + level, 289, 42);
  text("Rocks Passed:" + Rocks, 369, 42);
  text("Laser Count:" + Lasers, 465, 42);
  text("Health:" + s1.health, 556, 42);
  // text("Rocks Passed:" + rocksPassed,10,10);
  // text("Ammo:" + Ammo, 526,42);
}

void startScreen() {
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Press any key to begin...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
  play = false;
  background(0);
  fill(222);
  textAlign(CENTER);
  fill(#8B0000);
  text("You dead dead bro. RIP.", width/2, 375);
  fill(255);
  //size(25,25);
  text("Gameover.", width/2, height/2);
  noLoop();
}
