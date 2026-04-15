
PImage nerd;
boolean Nstamp = false;

PImage point;
boolean Pstamp = false;

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

  nerd = loadImage("nerdemoji-removebg.png");
  point = loadImage("point.png");
  
  surface.setTitle("Drawing app");
  
  surface.setIcon(nerd);
  
}


void draw () {

  r = map(rpos, 25, 175, 0, 255);
  g = map(gpos, 25, 175, 0, 255);
  b = map(bpos, 25, 175, 0, 255);
  w = map(wpos, 25, 175, 1, 150);

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
  line(25, 170, 175, 170);
  circle(wpos, 170, 30);//Size slider

  tactile(25, 400);
  buttonDraw(25, 400, #FFFFFF);
  tactile(125, 400);
  buttonDraw(125, 400, #000000);
  tactile(25, 300);
  buttonDraw(25, 300, #888888);
  tactile(125, 300);
  holderDraw(125, 300, br1, bg1, bb1);//color holder
  tactile(25, 200);
  holderDraw(25, 200, br2, bg2, bb2);//color holder
  tactile(125, 200);
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


  tactile(25, 25);

  if (Nstamp == true) {
    stroke(#00FF00);
  }
  fill(#FFFFFF);
  circle(50, 50, 50);
  image(nerd, 20.5, 25.5, 60, 50);//stamp
  
  tactile(25, 725);
  
  if (Pstamp == true) {
    stroke(#00FF00);
  }
  
  fill(#FFFFFF);
  circle(50, 750, 50);
  image(point, 20.5, 725.5, 60, 50);//point
  
  tactile(125, 25);
  buttonDraw(125, 25, #FF05DE);//new
  fill(#000000);
  textSize(20);
  text("new", 130, 40);
  
  tactile(25, 85);
  buttonDraw(25, 85, #FF05DE);//save
  fill(#000000);
  textSize(20);
  text("save", 30, 100);
  
  tactile(125, 85);
  buttonDraw(125, 85, #FF05DE);//load
  fill(#000000);
  textSize(20);
  text("load", 130, 100);
}


void mouseClicked() {
  
  if (mouseX > 25 && mouseX < 25 + 50 && mouseY > 75 && mouseY < 75 + 50) {//save
    selectOutput("choose a name for your new image file", "saveImage");
  }
  
  if (mouseX > 125 && mouseX < 125 + 50 && mouseY > 85 && mouseY < 85 + 50) {//save
    selectOutput("pick an image to load", "openImage");
  }
  
  if (mouseX > 125 && mouseX < 125 + 50 && mouseY > 25 && mouseY < 25 + 50) {//new
    noStroke();
    fill(#FFFFFF);
    rect(200, 0, 1000, 1000);
  }
  
  buttonClicked(25, 400, 255, 255, 255);
  buttonClicked(125, 400, 0, 0, 0);
  buttonClicked(25, 300, 125, 125, 125);
  buttonClicked(125, 300, br1, bg1, bb1);//color holder
  buttonClicked(25, 200, br2, bg2, bb2);//color holder
  buttonClicked(125, 200, br3, bg3, bb3);//color holder

  if (dist(mouseX, mouseY, 50, 50) < 25) {//mouseX > 25 && mouseX < 25 + 50 && mouseY > 25 && mouseY < 25 + 50
    if (Nstamp == false) {
      Nstamp = true;
    } else {
      Nstamp = false;
    }
  }
  
  if (dist(mouseX, mouseY, 50, 750) < 25) {//mouseX > 25 && mouseX < 25 + 50 && mouseY > 25 && mouseY < 25 + 50
    if (Pstamp == false) {
      Pstamp = true;
    } else {
      Pstamp = false;
    }
  }
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

  if (Nstamp == false && Pstamp == false) {
    if (mouseX > 200) {
      line(pmouseX, pmouseY, mouseX, mouseY);//line tool
    }
  } else {
    if (mouseX > 200 && Nstamp == true) {
      image(nerd, mouseX - w, mouseY - w, w * 2, w * 2);//stamp tool
    }
    
    if (mouseX > 200 && Pstamp == true) {
      image(point, mouseX - w, mouseY - w, w * 2, w * 2);//stamp tool
    }
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

  if (mouseX > 25 && mouseX < 175 && mouseY > 155 && mouseY < 185) {//size slider
    wpos = mouseX;
  }
  
  
  
  if (dist(mouseX, mouseY, 50, 50) < 25) {//mouseX > 25 && mouseX < 25 + 50 && mouseY > 25 && mouseY < 25 + 50
    if (Nstamp == false) {
      Nstamp = true;
    } else {
      Nstamp = false;
    }
  }
  
  if (mouseX > 125 && mouseX < 125 + 50 && mouseY > 25 && mouseY < 25 + 50) {//new
    noStroke();
    fill(#FFFFFF);
    rect(200, 0, 1000, 1000);
  }
  
  
}


void buttonClicked (int x, int y, float r, float g, float b) {

  if (mouseX > x && mouseX < x + 50 && mouseY > y && mouseY < y + 50) {
    rpos = map(r, 0, 255, 25, 175);
    gpos = map(g, 0, 255, 25, 175);
    bpos = map(b, 0, 255, 25, 175);
  }

  if (Nstamp == true && mouseX > 200) {
    image(nerd, mouseX - w, mouseY - w, w * 2, w * 2);//stamp tool
  }
}


void buttonDraw (int x, int y, color c) {

  fill(c);
  strokeWeight(5);
  rect(x, y, 50, 50);
}

void holderDraw (int x, int y, float r, float g, float b) {

  fill(r, g, b);
  strokeWeight(5);
  rect(x, y, 50, 50);
}



void tactile (int x, int y) {
  if (mouseX > x && mouseX < x + 50 && mouseY > y && mouseY < y + 50) {
    stroke(#FFFFFF);
  } else {
    stroke(#000000);
  }
}
void saveImage(File f) {
  if (f != null) {
    PImage canvas = get(200, 0, 800, 800);
    canvas.save(f.getAbsolutePath());
  }
}


void openImage(File f) {//load
  if (f != null) {
    int n =0;
    while(n < 10) {
      PImage pic = loadImage(f.getPath());
      image(pic, 200, 0);
      n = n + 1;
    }
  }
}
