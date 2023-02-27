class Star {
  int x, y, speed, diam;

  // Comstructer
  Star() {
    x = int(random(width));
    y = int(random(height));
 
    speed = int(random(1, 2));
    diam = int(random(1, 4));
  }

  void display() {
    fill(random(255));
    ellipse(x, y, diam, diam);
  }

  void move() {
    if (y>height+5) {
      y = -5;
    } else {
      y += speed;
    }
  }
  boolean reachedBottom() {
    return true;
  }
}
