class Invader {
  PVector pos;
  int reload;
  PImage img;
  int x, y;
  final static int space = 10;

  Invader(int x, int y) {
    this.x = space * x;
    this.y = space * y;
    pos = new PVector(32 + space * x, 8 + space * y);
    img = createInvadorGraphics(16);
  }

  void update() {
    if (((int)(pos.y - y))/4%2 == 0) pos.x += 2;
    else pos.x -= 2;
    if ((int)pos.x == 64 + x || (int)pos.x == x + 24) pos.y+=4;
  }

  void draw() {
    image(img, (int)pos.x, (int)pos.y);
  }
  
  boolean hit(Bullet b) {
    if (b.pos.x + 3 > pos.x - 2 && b.pos.x + 3 < pos.x + 8 &&
        b.pos.y > pos.y - 2 && b.pos.y + 3 < pos.y + 8)
        return true;
    else return false;
  }
  
  void shoot() {
    G.eb.add(new Bullet(pos.copy(), -1));
  }
}