class Button { 
  Position pos;
  boolean pressed;
  float xSize, ySize;
  PFont font;
  String name;

  Button(float x, float y, float xs, float ys, String n, PFont f) {
    pos = new Position(x, y);
    xSize = xs;
    ySize = ys;
    name = n;
    font = f;
  }

  void DisplayButton() {
    noStroke();
    if (pressed) {
      fill(100, 65, 164);
    } else {
      fill(255,255,255,0);
    }

    rect(pos.x, pos.y, xSize, ySize);
    textFont(font);
    fill(255);
    textAlign(LEFT, CENTER);
    text(name, pos.x+20, pos.y + ySize/2);
  }

  boolean overRect(float x, float y, float w, float h) {
    if (mouseX >= x && mouseX <= x+w && mouseY>= y && mouseY <= y+h) {
      return true;
    }
    return false;
  }

  void update() {
    if (overRect(pos.x, pos.y, xSize, ySize)) {
      pressed = true;
    } else {
      pressed = false;
    }
  }
}
