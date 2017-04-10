class Particle {
  PVector p, v, a;
  Particle(PVector origin) {
    p = origin.copy();
    v = new PVector();
    a = new PVector();
  }

  void applyForce(PVector f) {
    a.add(f);
  }

  void update() {
    int tx = (int)p.x;
    int ty = (int)p.y;
    int x = T.getBlock(tx - 1, ty) - T.getBlock(tx + 1, ty);
    int y = T.getBlock(tx, ty - 1) - T.getBlock(tx, ty + 1);
    PVector diff = new PVector(x*0.01, y*0.01);
    a.add(diff);
    a.limit(0.1);
    a.sub(v);
    v.add(a);
    p.add(v);
    a.set(0, 0);
  }

  void draw() {
    fill(255, 30);
    noStroke();
    rect((int)p.x, (int)p.y, 1, 1);
  }
}