
color selectedC = #000000;

float br1 = 0;
float bg1 = 0;
float bb1 = 0;

float br2 = 0;
float bg2 = 0;
float bb2 = 0;

float br3 = 0;
float bg3 = 0;
float bb3 = 0;

float r = 0;
float g = 0;
float b = 0;
float w = 1;

float rpos = 25;
float gpos = 25;
float bpos = 25;
float wpos = 25;

void setup() {
  size(1000, 800);
  background(255);
}


void draw () {

  r = map(rpos, 25, 175, 0, 255);
  g = map(gpos, 25, 175, 0, 255);
  b = map(bpos, 25, 175, 0, 255);

  fill(150);
  stroke(0);
  strokeWeight(5);
  rect(-100, -100, 300, 10000);//side bar

  stroke(#FF0000);
  fill(#FF0000);
  line(25, 500, 175, 500);
  circle(rpos, 500, 30);//Red slider

  stroke(#00FF00);
  fill(#00FF00);
  line(25, 600, 175, 600);
  circle(gpos, 600, 30);//Green slider

  stroke(#0000FF);
  fill(#0000FF);
  line(25, 700, 175, 700);
  circle(bpos, 700, 30);//Blue slider
  
  stroke(#000000);
  fill(#000000);
  line(25, 100, 175, 100);
  circle(wpos, 100, 30);//Size slider


  buttonDraw(25, 400, #FFFFFF);
  buttonDraw(125, 400, #000000);
  buttonDraw(25, 300, #888888);
  holderDraw(125, 300, br1, bg1, bb1);//color holder
  holderDraw(25, 200, br2, bg2, bb2);//color holder
  holderDraw(125, 200, br3, bg3, bb3);//color holder

  if (mousePressed && (mouseButton == RIGHT)) {//chooses the color of the color holder
    if (mouseX > 125 && mouseX < 125 + 50 && mouseY > 300 && mouseY < 300 + 50) {
      br1 = r;
      bg1 = g;
      bb1 = b;
    }
    
    if (mouseX > 25 && mouseX < 25 + 50 && mouseY > 200 && mouseY < 200 + 50) {
      br2 = r;
      bg2 = g;
      bb2 = b;
    }
    
    if (mouseX > 125 && mouseX < 125 + 50 && mouseY > 200 && mouseY < 200 + 50) {
      br3 = r;
      bg3 = g;
      bb3 = b;
    }
  }
}

void mouseClicked() {
  buttonClicked(25, 400, 255, 255, 255);
  buttonClicked(125, 400, 0, 0, 0);
  buttonClicked(25, 300, 125, 125, 125);
  buttonClicked(125, 300, br1, bg1, bb1);//color holder
  buttonClicked(25, 200, br2, bg2, bb2);//color holder
  buttonClicked(125, 200, br3, bg3, bb3);//color holder
}


void mouseDragged() {

  buttonClicked(25, 400, 255, 255, 255);
  buttonClicked(125, 400, 0, 0, 0);
  buttonClicked(25, 300, 125, 125, 125);
  buttonClicked(125, 300, br1, bg1, bb1);//color holder
  buttonClicked(25, 200, br2, bg2, bb2);//color holder
  buttonClicked(125, 200, br3, bg3, bb3);//color holder

  stroke(r, g, b);
  strokeWeight(w);

  if (mouseX > 200) {
    line(pmouseX, pmouseY, mouseX, mouseY);//line tool
  }


  if (mouseX > 25 && mouseX < 175 && mouseY > 485 && mouseY < 515) {//red slider
    rpos = mouseX;
  }

  if (mouseX > 25 && mouseX < 175 && mouseY > 585 && mouseY < 615) {//green slider
    gpos = mouseX;
  }

  if (mouseX > 25 && mouseX < 175 && mouseY > 685 && mouseY < 715) {//blue slider
    bpos = mouseX;
  }
}






void buttonClicked (int x, int y, float r, float g, float b) {

  if (mouseX > x && mouseX < x + 50 && mouseY > y && mouseY < y + 50) {
    rpos = map(r, 0, 255, 25, 175);
    gpos = map(g, 0, 255, 25, 175);
    bpos = map(b, 0, 255, 25, 175);
  }
}


void buttonDraw (int x, int y, color c) {

  fill(c);
  stroke(#000000);
  strokeWeight(5);
  rect(x, y, 50, 50);
}

void holderDraw (int x, int y, float r, float g, float b) {

  fill(r, g, b);
  stroke(#000000);
  strokeWeight(5);
  rect(x, y, 50, 50);
}
