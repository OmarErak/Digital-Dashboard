class FuelTank {
  float tankCapacity;
  float fuelLevel;
  float prevFuelLevel;

  FuelTank(float TC) {
    tankCapacity = TC;
  }

  void update() {
    fuelLevel = sensorData.readFuelLevel();
  }

  float getConsumedFuel() {
    update();
    if (sensorData.currentIndex-1 >= 0) {
      prevFuelLevel = sensorData.dataTable.getFloat(sensorData.currentIndex-1, "Fuel Level (liter)");
    } else {
      prevFuelLevel = fuelLevel;
    }
    return prevFuelLevel - fuelLevel;
  }
}
