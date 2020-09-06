class Compass{
  float size, x, y, prevX, prevY, direction;
  Position pos;
  
  Compass(float x, float y, float s){
    size = s;
    pos = new Position(x,y);
  }
  
  String getCompassDirection(){
    String dir = "";
    if(sensorData.currentIndex-1>=0){
      prevX = sensorData.dataTable.getFloat(sensorData.currentIndex-1, "X");
      prevY = sensorData.dataTable.getFloat(sensorData.currentIndex-1, "Y");
    }
    x = sensorData.readX();
    y = sensorData.readY();
    if(x-prevX == 0 && y - prevY >0){
      dir = "S";
    } else if(x-prevX == 0 && y-prevY>0){
      dir = "N";
    } else if(y-prevY == 0 && x - prevX <0){
      dir = "W";
    } else if(y-prevY == 0 && x-prevX >0){
      dir = "E";
    } else if(y-prevY < 0 && x - prevX <0){
      dir = "SW";
    } else if(y-prevY>0 && x-prevX<0){
      dir = "NW";
    } else if( y - prevY < 0 && x - prevX >0){
      dir = "SE";
    } else{
      dir = "NE";
    }
    return dir;
  }
  
  float getDirection(){
    float dir = 0;
    if(sensorData.currentIndex-1 >=0){
      prevX = sensorData.dataTable.getFloat(sensorData.currentIndex-1, "X");
      prevY = sensorData.dataTable.getFloat(sensorData.currentIndex-1, "Y");
    }
    x = sensorData.readX();
    y = sensorData.readY();
    float xDir = x - prevX;
    float yDir = y - prevY;
    float angle = atan(yDir/xDir);
    if (getCompassDirection().equals("NE")){
      dir = angle;
    } else if(getCompassDirection().equals("SE")){
      dir = -angle;
    } else if(getCompassDirection().equals("SW")){
      dir = PI + angle;
    } else if(getCompassDirection().equals("NW")){
      dir = PI - angle;
    } else if(getCompassDirection().equals("N")){
      dir = -PI/2;
    } else if(getCompassDirection().equals("E")){
      dir = 0;
    } else if(getCompassDirection().equals("S")){
      dir = PI/2;
    }
    else{
      dir = PI;
    }
    return dir;
  }
  
  
  void displayCompass(){
    fill(255);
    textAlign(CENTER, CENTER);
    text(getCompassDirection(), pos.x, pos.y - size/2);
    pushMatrix();
    translate(pos.x, pos.y +height/16);
    rotate(getDirection() + PI/2);
    drawArrow();
    popMatrix();
   }
   
   void drawArrow(){
     float s = size;
     strokeWeight(2);
     stroke(240);
     noFill();
     beginShape();
     vertex(0, -s*0.6);
     vertex(s/2, s*0.6);
     vertex(0, s*0.4);
     vertex(-s/2, s*0.6);
     endShape(CLOSE);
     stroke(200);
     s*=0.8;
     strokeWeight(5);
     beginShape();
     vertex(0, -s*0.6);
     vertex(s/2, s*0.6);
     vertex(0, s*0.4);
     vertex(-s/2, s*0.6);
     endShape(CLOSE);
     s*=0.6;
     stroke(240);
     strokeWeight(10);
     beginShape();
     vertex(0, -s*0.6);
     vertex(s/2, s*0.6);
     vertex(0, s*0.4);
     vertex(-s/2, s*0.6);
     endShape(CLOSE);
   }
}
     
     
