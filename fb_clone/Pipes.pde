class Pipes {
  int x = 1000;
  int y = (int) random(300, 700);
  int space = 250;
  int width = 300;
  int offscreen = 300;
  int space_between = 750;
  int dx = 6;

  public Pipes (int new_x) {
    this.x = new_x;
  }
  void advance() {
    x -= dx;
  }
}
