class Car {
  TripComputer tripComp;
  float radius;
  Gauge speedGauge;
  Gauge rpmGauge;
  Gauge fuelGauge;
  int n = 0;
  FuelTank fuel;
  FuelComputer fuelcomp;
  PFont calculations;
  Compass compass;
  Car(float r) {
    radius = r;
    fuel = new FuelTank(0);
    fuelcomp = new FuelComputer();
    tripComp = new TripComputer   ();
    calculations =  createFont("fonts/digitalFont.TTF", 18);
    compass = new Compass(width - width/2, height -725, 50);
  }

  void processInput() {
    displayGauge();
    tripComp.RPM = sensorData.readRPM();
    tripComp.gearRatio = sensorData.readRatio();
    speedGauge.setVal(tripComp.getCurrentSpeed());
    speedGauge.Display();
    rpmGauge.setVal(sensorData.readRPM());
    rpmGauge.Display();
    fuelGauge.setVal(sensorData.readFuelLevel());
    fuelGauge.Display();
    ReturnButton.update();
    ReturnButton.DisplayButton();
    if (sensorData.currentIndex < sensorData.dataTable.getRowCount() -1) {
      fuelcomp.update();
    }
    displayInformation();
    if (tripComp.getCurrentSpeed()>120&& n%18==0) {
      warning.DisplayWarning();
      exclamation.DisplayExclamation();
      circle.DisplayCircle();
    }
    n++;
    clock.updateTime(hour(), minute(), second());
    clock.DisplayTime();
    date.updateDate(day(), month(), year());
    date.DisplayDate();
    compass.displayCompass();
  }


  void displayInformation() {
    textFont(calculations);
    textSize(24);
    fill(66,244,185);
    text("Range (KM): " + nf(fuelcomp.range, 0, 1), width/7, height/1.8);
    text("Odometer (KM): " + nf(tripComp.totalTravelledDistance, 0, 1), width/7, height/1.6);
    text("Fuel Economy (KM/L):" + nf(fuelcomp.fuelEconomy, 0, 1), width/1.7, height/1.8);
    text("Fuel Consumption (Litre/(100KM):" + nf(fuelcomp.fuelConsumption, 0, 1), width/1.7, height/1.6);
  }
  void displayGauge() {
    speedGauge = new Gauge(0, 240, width*(2.0/9.0), height*(1.0/3.0), 75, "SPEED", "KM/H", numbers, titles);
    rpmGauge = new Gauge(0, 2500, width*(4.5/9.0), height*(1.0/3.0), 100, "RPM", "R/M", numbers, titles);
    fuelGauge = new Gauge(0, fuel.tankCapacity, width*(7.0/9.0), height*(1.0/3.0), 75, "Fuel", "L", numbers, titles);
  }

   
}
