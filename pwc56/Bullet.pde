class Bullet {
  PVector pos;
  int c, dir;

  Bullet(PVector pos, int dir) {
    this.pos = pos;
    this.dir = dir;
    c = (int) random(255);
  }

  void update() {
    pos.y -= dir * 8;
  }

  void draw() {
    PImage disp = createBulletGraphics(c);
    pushMatrix();
    if (dir == -1) {
      translate(pos.x, pos.y);
      scale(1, -1);
      translate(-pos.x, -pos.y);
    }
    image(disp, (int)pos.x, (int)pos.y);
    popMatrix();
  }
}