class Laser {
  int x, y, w, h, speed;
  color c1;

  // Comstructer
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 4;
    h = 10;
    speed = 5;
    c1 =  color(#FF0505);
  }

  void display() {
    rectMode(CENTER);
    fill(#F50000);
    noStroke();
    fill(c1);
    rect(x, y, w, h);
  }

  void move() {
    y -= speed;
  }
  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Laser laser) {
    float d = dist(x, y, laser.x, laser.y);
    if (d<laser.w/2) {
      return true;
    } else {
      return false;
    }
  }
}
