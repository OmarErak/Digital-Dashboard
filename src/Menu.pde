class Menu {
  boolean selected;

  void DisplayMenu() {
    CarButton.update();
    CarButton.DisplayButton();
    TruckButton.update();
    TruckButton.DisplayButton();
    QuitButton.update();
    QuitButton.DisplayButton();
  }
}
