class Player {
  int x;
  int hp;
  int reload;
  
  Player() {
    x = 0;
    hp = 3;
  }
  
  void draw() {
    image(player_img, width/2/scale + x, height/scale - 8);
  }
  
  void update() {
    reload--;
  }
}