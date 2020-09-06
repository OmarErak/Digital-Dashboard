class SensorDataProvider {
  String filePath;
  Table dataTable;
  int currentIndex; 

  void Initialize () {
    dataTable = loadTable(filePath, "header");
  }
  void readNext() {
    if (currentIndex< dataTable.getRowCount()-1) {
      currentIndex++;
    }
  }
  float readRPM() {
    return dataTable.getFloat(currentIndex, "RPM");
  }
  float readFuelLevel() {
    return dataTable.getFloat(currentIndex, "Fuel Level (liter)");
  }

  float readRatio() {
    return dataTable.getFloat(currentIndex, "Gear Ratio");
  }

  float readX() {
    return dataTable.getFloat(currentIndex, "X");
  }

  float readY() {
    return dataTable.getFloat(currentIndex, "Y");
  }
}
