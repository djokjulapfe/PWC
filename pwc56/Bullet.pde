class Bullet {
  PVector pos;
  int c;
  
  Bullet(PVector pos) {
    this.pos = pos;
    c = (int) random(255);
  }
  
  void update() {
    pos.y -= 8;
  }
  
  void draw() {
    image(createBulletGraphics(c), (int)pos.x, (int)pos.y);
  }
}