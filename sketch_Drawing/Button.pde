
class Button {


  void buttonClicked (int x, int y, color c) {

    if (mouseX > x && mouseX < x + 50 && mouseY > y && mouseY < y + 50) {
      selectedC = c;
    }
  }

  void buttonDraw (int x, int y, color c) {

    fill(c);
    stroke(#000000);
    strokeWeight(5);
    rect(x, y, 50, 50);
  }
}
