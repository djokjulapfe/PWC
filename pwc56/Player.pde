class Player {
  int x;
  int health;
  int reload;
  
  Player() {
    x = 0;
  }
  
  void draw() {
    image(player_img, width/2/scale + x, height/scale - 8);
  }
  
  void update() {
    reload--;
  }
}