import org.gicentre.utils.stat.*;

SensorDataProvider sensorData;
Car car;
PFont numbers;
PFont titles;
Button CarButton;
Button TruckButton;
Button QuitButton;
Button ReturnButton;
PFont menu; 
PFont time;
PFont date1;  
Menu main;
Warning warning;
Warning exclamation;
Warning circle;
Clock clock;
Clock date;
BarChart fuelEconomy;
BarChart fuelConsumption;
PImage background;




void setup() {
  size(1336, 768);
  circle = new Warning(width*(2.0/9.0), 135, 8, 8);
  exclamation = new Warning(width*(2.0/9.0)-5, 85, width*(2.0/9.0), 115, width*(2.0/9.0)+5, 85);
  warning = new Warning(width*(2.0/9.0)-50, 150, width*(2.0/9.0), 50, width*(2.0/9.0)+50, 150);
  sensorData = new SensorDataProvider();
  car = new Car(23);
  main = new Menu();
  menu = createFont("fonts/menu.TTF", 28);
  CarButton = new Button(0, 100, 300, 100, "Car", menu);
  TruckButton = new Button(0, 300, 300, 100, "Truck", menu );
  QuitButton = new Button(0, 500, 300, 100, "Quit", menu);
  ReturnButton = new Button(0, 0, 200, 50, "return", menu);
  sensorData.filePath = "car_status_BMW_323i.csv";
  numbers = createFont("fonts/digitalFont.TTF", 36);
  titles = createFont("fonts/BADABB__.TTF", 28);
  time = createFont("fonts/ObelixProB-cyr.ttf", 28);
  date1 = createFont("fonts/ObelixProB-cyr.ttf", 14);
  clock = new Clock(second(), minute(), hour(), 800, 25, time);
  date = new Clock(day(), month(), year(), 800, 25, date1);
  sensorData.Initialize();
  fuelEconomy = new BarChart(this);
  fuelEconomy.setMinValue(0);
  fuelEconomy.setMaxValue(30);
  fuelEconomy.showValueAxis(true);
  fuelEconomy.setValueFormat("#");
  fuelEconomy.showCategoryAxis(true);
  fuelEconomy.setBarColour(color(0,255,30));
  fuelEconomy.setBarGap(1);
  fuelConsumption = new BarChart(this);
  fuelConsumption.setMinValue(0);
  fuelConsumption.setMaxValue(60);
  fuelConsumption.showValueAxis(true);
  fuelConsumption.setValueFormat("#");
  fuelConsumption.showCategoryAxis(true);
  fuelConsumption.setBarColour(color(0,255,30));
  fuelConsumption.setBarGap(1);
  background = loadImage("thumbnail.png");
background.resize(width, height);
}

void draw() {
  if (!main.selected) {
    frameRate(144);
    background(background);
    main.DisplayMenu();
  } else {
    frameRate(10);
    background(background);
    car.processInput();
    fuelEconomy.setData(car.fuelcomp.fuelEconomyData);
    fuelConsumption.setData(car.fuelcomp.fuelConsumptionData);
    textFont(numbers);
    textSize(9);
    fuelEconomy.draw(75, 550, 525, 180);
    fuelConsumption.draw(700, 550, 525, 180);
    sensorData.readNext();
  }
}

void mousePressed() {
  if (QuitButton.pressed) {
    exit();
  }

  if (CarButton.pressed) {
    CarButton.pressed = false;
    sensorData.filePath = "car_status_BMW_323i.csv";
    sensorData.Initialize();
    main.selected= true;
    car.fuel.tankCapacity = 60;
  }

  if (TruckButton.pressed) {
    sensorData.filePath = "car_status_Truck_F150.csv";
    sensorData.Initialize();
    main.selected = true;
    car.fuel.tankCapacity = 80;
  }

  if (ReturnButton.pressed) {
    main.selected = false;
    ReturnButton.pressed = false;
    sensorData.Initialize();
    sensorData.currentIndex = 0;
    car.tripComp.totalTravelledDistance = 0;
    car.fuelcomp.fuelEconomyData = new float [60];
    car.fuelcomp.fuelConsumptionData = new float [60];
    car.fuelcomp.count = car.fuelcomp.count1 = 0;
  }
}
