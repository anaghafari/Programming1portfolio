class Rock {
  int x, y, speed, diam;
  PImage rock;

  // Comstructer
  Rock() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 11));
    diam = int(random(40, 70));
    rock = loadImage("rock.png");
  }

  void display() {
    rock.resize(diam, diam);
    imageMode(CENTER);
    image(rock, x, y);
  }

  void move() {
    y += speed;
  }
  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Laser laser) {
    float d = dist(x, y, laser.x, laser.y);
    if (d<20) {
      return true;
    } else {
      return false;
    }
  }
}
