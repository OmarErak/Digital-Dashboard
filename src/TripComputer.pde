class TripComputer {
  float RPM;
  float gearRatio;
  float totalTravelledDistance;

  float getCurrentSpeed() {
    float s = (RPM/60)*(1/gearRatio)*2*PI*(car.radius/100);
    return s*3.6;
  }

  void updateTotalDistance() {
    totalTravelledDistance += getCurrentSpeed()/1000/3.6;
  }
}
