class FuelComputer {
  float averageFuelEconomy, fuelEconomy, fuelConsumption, range;
  float [] fuelEconomyHistory, fuelEconomyData, fuelConsumptionData;
  int count, count1;

  FuelComputer() {
    fuelConsumptionData = new float[60];
    fuelEconomyData = new float [60];
    fuelEconomyHistory = new float [0];
    count = count1 = -1;
  }

  void calculateFuelEconomy() {
    if (car.fuel.getConsumedFuel() > 0) {
      car.tripComp.updateTotalDistance();
      fuelEconomy = (car.tripComp.getCurrentSpeed()/1000/3.6)/car.fuel.getConsumedFuel();
      fuelEconomyHistory = append(fuelEconomyHistory, fuelEconomy);
    }
  }

  void calculateAverageFuelEconomy() {
    averageFuelEconomy = 0;
    for (int i = 0; i < fuelEconomyHistory.length; i++) {
      averageFuelEconomy += fuelEconomyHistory[i];
    }
    averageFuelEconomy /= fuelEconomyHistory.length;

    count++;
    if (count < 60) {
      fuelEconomyData[count] = averageFuelEconomy;
    } else {
      count = -1;
    }
  }

  void calculateFuelConsumption() {
    fuelConsumption = 1/averageFuelEconomy*100;
    count1++;
    if (count1 < 60) {
      fuelConsumptionData[count1] = fuelConsumption;
    } else {
      count1 = -1;
    }
  }

  void calculateRange() {
    range = averageFuelEconomy*sensorData.readFuelLevel();
  }

  void update() {
    calculateFuelEconomy();
    calculateAverageFuelEconomy();
    calculateFuelConsumption();
    calculateRange();
  }
} 
