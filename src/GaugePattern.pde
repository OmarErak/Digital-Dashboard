/*class GaugePattern {
  float x1, y1, x2, y2, x3;

  GaugePattern(float x_1, float y_1, float x_2, float y_2, float x_3) {
    x1 = x_1;
    y1 = y_1;
    x2 = x_2;
    y2 = y_2;
    x3 = x_3;
  }

  void DisplayPattern() {
    float xDistance = abs(x1-x3);
    float offset = 0.05*xDistance;
    float xOffset = 0.04*xDistance;
    float h = 0.15 * xDistance;
    float opacity = 255;
    for (int i = 0; i<10; i++) {
      fill(255, 140, 0, opacity);
      quad(x1, y1, x1+xOffset, y1-h, x2-xOffset, y2-h, x2, y2);
      x1+= xOffset;
      x2-= xOffset;
      y1 -= offset+h;
      y2 -= offset+h;
      h*=0.75;
      opacity*=0.6;
    }
  }
}*/
