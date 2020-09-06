class Warning {
  Position pos1;
  Position pos2;
  Position pos3;
  Position pos;
  float xSize, ySize;

  Warning(float a, float b, float c, float d, float e, float f) {
    pos1 = new Position(a, b);
    pos2 = new Position(c, d);
    pos3= new Position (e, f);
  }

  Warning(float x, float y, float w, float z) {
    pos = new Position(x, y);
    xSize = w;
    ySize = z;
  }


  void DisplayWarning() {
    noFill();
    stroke(255, 0, 0);
    strokeWeight(8);
    triangle(pos1.x, pos1.y, pos2.x, pos2.y, pos3.x, pos3.y);
  }

  void DisplayExclamation() {
    fill(255, 0, 0);
    stroke(255, 0, 0);
    strokeWeight(4);
    triangle(pos1.x, pos1.y, pos2.x, pos2.y, pos3.x, pos3.y);
  }

  void DisplayCircle() {
    ellipse(pos.x, pos.y, xSize, ySize);
  }
}
