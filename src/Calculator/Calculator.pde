// Anahita Ghafari || Nov 2022 || Calculator
Button [] numButtons = new Button [10];
Button [] opButtons =  new Button [12];
String dVal = "0.0";
char op= ' ';
float l, r, result;
boolean left = true;

void setup () {
  size(250, 440);
  numButtons[0] = new Button(30, 360, 40, 30, '0');
  numButtons[1] = new Button(30, 310, 40, 30, '1');
  numButtons[2] = new Button(90, 310, 40, 30, '2');
  numButtons[3] = new Button(150, 310, 40, 30, '3');
  //opButton[0] = new Button(200,444,60,60,'=');
  numButtons[4] = new Button(30, 265, 40, 30, '4');
  numButtons[5] = new Button(90, 265, 40, 30, '5');
  numButtons[6]= new Button(150, 265, 40, 30, '6');
  numButtons[7]= new Button(30, 220, 40, 30, '7');
  numButtons[8]= new Button(90, 220, 40, 30, '8');
  numButtons[9]= new Button(150, 220, 40, 30, '9');
  opButtons[0] = new Button(210, 310, 40, 30, '×');
  opButtons[1]= new Button(210, 265, 40, 30, '÷');
  opButtons[2]= new Button(210, 220, 40, 30, '+');
  opButtons[3] = new Button(90, 360, 40, 30, '.');
  opButtons[4]= new Button(30, 180, 40, 30, '²');
  opButtons[5]= new Button(90, 180, 40, 30, '√');
  opButtons[6]= new Button(150, 180, 40, 30, 'π');
  opButtons[7]= new Button(210, 180, 40, 30, '%');
  opButtons[8]= new Button(150, 360, 40, 30, '±');
  opButtons[9]= new Button(210, 360, 40, 30, '-');
  opButtons[10]= new Button(60, 410, 95, 35, 'C');
  opButtons[11]= new Button(185, 410, 95, 35, '=');

  //opButton[0] = new Button(200,444,60,60,'=');
}

void draw() {
  background(#99A6D6);
  for (int i=0; i< numButtons.length; i++) {
    numButtons[i]. display();
    numButtons[i]. hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display ();
    opButtons[i].hover (mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key:" + key);
  println("keyCode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if  (keyCode == 109) {
    handleEvent("-", false);
  } else if ( keyCode == 107) {
    handleEvent("+", false);
  } else if ( keyCode == 111) {
    handleEvent("÷", false);
  } else if ( keyCode == 106) {
    handleEvent("×", false);
  } else if ( keyCode == 10) {
    handleEvent("=", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() <25) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) { // All opButtons here
    dVal = "0";
    op = ' ';
    l = 0;
    r = 0;
    result = 0;
    left= true;
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("-")) {
    op = '-';
    left = false;
    dVal = "0";
  } else if (val.equals("+")) {
    op = '+';
    dVal = "0.0";
    left = false;
  } else if (val.equals("÷")) {
    op = '÷';
    dVal = "0.0";
    left = false;
  } else if (val.equals("×")) {
    op = '×';
    dVal = "0.0";
    left = false;
  } else if (val.equals("=")) {
    performCalculation();
  }
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if ( numButtons[i].on ) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if ( opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent("C", false);
    } else if ( opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if ( opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if ( opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if ( opButtons[i].on && opButtons[i].val == '÷') {
      op = '÷';
      left = false;
      dVal = ("0.0");
    } else if ( opButtons[i].on && opButtons[i].val == '×') {
      op = '×';
      left = false;
      dVal = ("0.0");
    } else if ( opButtons[i].on && opButtons[i].val == '²') {
      if (left) {
        l=sq(l);
        dVal= str(l);
      } else {
        r=sq(r);
        dVal= str(r);
      }
    } else if ( opButtons[i].on && opButtons[i].val == 'π') {
       if (left) {
        l= PI;
        dVal= str(l);
      } else {
        r=PI;
        dVal= str(r);
      }
    } else if ( opButtons[i].on && opButtons[i].val == '%') {
       if (left) {
        l= l*0.01;
        dVal= str(l);
      } else {
        r=r*0.01;
        dVal= str(r);
      }
    } else if ( opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons [i].val == '±') {
      if (left) {
        l= l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal= str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal= str(l);
      } else {
        r= sqrt(r);
        dVal= str(r);
      }
    }
  }
  println("l:"+ l + " r:" + r + " op:" + op + " Left:" + left + " Result:" + result);
}
void updateDisplay() {
  fill (220);
  rect(125, 80, 230, 140);
  fill(0);
  textAlign(RIGHT);
  if (dVal.length() <31) {
    textSize(13);
  } else if (dVal.length()<34) {
    textSize(12);
  } else if (dVal.length()<36) {
    textSize(11);
  } else if (dVal.length() <41) {
    textSize(10);
  }
  text(dVal, width-30, 140);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if ( op == '-') {
    result = l - r;
  } else if (op == '×') {
    result =  l * r;
  } else if ( op == '÷') {
    result = l / r;
  } else if (op == '²') {
    result = sq(l);
    result = sq(r);
  } else if (op == 'π') {
    result = l * 3.141592653589793;
  } else if (op == '%') {
    result = l / 100;
  } else if (op == '√') {
    result = sqrt(l);
    result = sqrt(r);
  }
  dVal = str(result);
  l = result;
  left = true;
}
