class Clock {
  int second;
  int minute;
  int hour;
  Position pos;
  PFont font;
  int day;
  int month;
  int year;
  PFont font1;
  Clock(int s, int m, int h, float x, float y, PFont f) {
    second = s;
    minute = m;
    hour = h;
    pos = new Position(x, y);
    font = f;
    day = s;
    month = m;
    year = h;
  }



  void updateTime(int h, int m, int s) {
    second = s;
    minute = m;
    hour = h;
  }

  void updateDate(int d, int m, int y) {
    day = d;
    month = m;
    year = y;
  }

  void DisplayTime() {
    fill(200, 158, 255);
    textFont(font);
    text(nfs(hour,2), pos.x+302, pos.y);
    text(": ", pos.x+372, pos.y);
    text(nfs(minute,2), pos.x+382, pos.y);
    text(": ", pos.x+452, pos.y);
    text(nfs(second,2), pos.x+462, pos.y);
  }

  void DisplayDate() {
    fill(158, 255, 161);
    textFont(font);
    text(year, pos.x+347, pos.y+50);
    text("/ ", pos.x+402, pos.y+50);
    text(nfs(month,2), pos.x+417, pos.y+50);
    text("/ ", pos.x +447, pos.y+50);
    text(nfs(day,2), pos.x+462, pos.y+50);
  }
}
