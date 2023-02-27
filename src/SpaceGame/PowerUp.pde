class PowerUp {
  int x, y, speed, diam;
  char type;

  // Comstructer
  PowerUp() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 4));
    diam = int(random(40, 70));
    if (int(random(2)) == 0) {
      type = 'H';
    } else {
      type = 'A';
    }
  }

  void display() {
    fill(#F7CDF7);
    ellipse(x, y, diam, diam);
    fill(#360736);
    textAlign(CENTER);
    text(type, x, y);
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
  boolean intersect(Ship ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<20) {
      return true;
    } else {
      return false;
    }
  }
}
