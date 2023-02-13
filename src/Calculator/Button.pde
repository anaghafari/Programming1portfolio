class Button {

  // Member Variable
  int x, y, w, h;
  char val;
  color  c1, c2;
  boolean on;
  // Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val= val;
    c1 = color(#E8EAF0);
    c2 = color(#EACEE1);
    on = false;
  }

  // Memeber Methods
  void display () {
    rectMode(CENTER);
    if (on) {
      fill (c2);
    } else {
      fill (c1);
    }
    //fill(c1);
    rect(x, y, w, h, 8);
    fill(0);
    textSize(14);
    textAlign(CENTER);
    text(val, x, y);
  }

  void hover(int mx, int my) {
    on = (mx > x - w/2 && mx < x + w/2 && my> y-h/2 && my< y+h/2);
  }
}
