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
  
  void shoot(Game g) {
    if (g.P.reload < 0) {
      g.pb.add(new Bullet(new PVector(g.P.x + width/2/scale, height/scale), 1));
      g.P.reload = 5;
    }
  }
  
  void move(int dir) {
    if (x > -64 && x < 64)
      x += dir * 8;
  }
}