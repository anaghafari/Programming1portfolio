// Anahita Ghafari | oct 10 | Screen Saver
float xpos, ypos, strokeW, pointCount;

void setup() {
  size(1000, 1000);
  background(random(100, 255));
  xpos = random(width);
  ypos = random(height);
}

void draw () {
  strokeW = random(3, 10);
  pointCount = random(30, 60);
  stroke(random(255), random(10), random(120));
  //stroke(0);
  strokeWeight(strokeW);
  //moveRight(xpos, ypos, pointCount);


  // moveLeft(xpos, ypos, pointCount);
  if (xpos> width || xpos<0 || ypos>height || ypos <0) {
    xpos = random(width);
    ypos = random(height);
  }
  if (random(100)>80) {
    strokeWeight(strokeW);
     moveLeft(xpos, ypos, pointCount);
  } else if (random(100)>60) {
    strokeWeight(strokeW);
    moveUp(xpos, ypos, pointCount);
  } else if (random(100)>50) {
    strokeWeight(strokeW);
    moveDown(xpos, ypos, pointCount);
  } else {
    strokeWeight(strokeW);
    moveRight(xpos, ypos, pointCount);
  }
  //moveDown(xpos,ypos,pointCount);
  //moveUp(xpos,ypos,pointCount);
}

void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX + i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX - i, startY);
    xpos = startX - i;
    ypos = startY;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY +i);
    xpos = startX ;
    ypos = startY + i;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    xpos = startX ;
    ypos = startY -i ;
  }
}
