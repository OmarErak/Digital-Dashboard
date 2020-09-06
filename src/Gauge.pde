class Gauge {
  float currentValue, min, max, percent;
  String units, gaugeName;
  Position pos;
  float size; 
  PFont num;
  PFont t;
  //GaugePattern gaugePattern;
  void setVal(float val) {
    if (val<min|| val>max) {
      return;
    } else {
      currentValue = val;
    }
  }

  void Display() {
    percent = currentValue/max;
    noFill();
    strokeWeight(3);
    stroke(255);
    ellipse(pos.x, pos.y, 2*size, 2*size);
    noFill();
    stroke(140, 142, 252);
    strokeWeight(8);
    arc(pos.x, pos.y, 2*size, 2* size, HALF_PI, 2*PI*percent+HALF_PI);
    //gaugePattern = new GaugePattern(pos.x-size,pos.y+size,pos.x+size,pos.y+size,pos.x);
    //gaugePattern.DisplayPattern();
    noStroke();
    textAlign(CENTER, CENTER);
    fill(255);
    textFont(t);
    text(gaugeName + " (" + units + ")", pos.x, pos.y+size+20);
    textFont(num);
    text(nfc(currentValue, 1), pos.x, pos.y);
  }


  Gauge(float minimum, float maximum, float x, float y, float radius, String name, String u, PFont n, PFont text) {
    t = text;
    num = n;
    min = minimum;
    max = maximum;
    pos = new Position(x, y);
    size = radius;
    gaugeName = name;
    units = u;
  }
}
