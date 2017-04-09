class Game {
  Player P;
  ArrayList<Bullet> pb, eb;
  ArrayList<Rock> r;

  Game() {
    P = new Player();
    pb = new ArrayList<Bullet>();
    eb = new ArrayList<Bullet>();
    r = new ArrayList<Rock>();
    for (int i = 0; i < width/24/scale - 1; i++) {
      r.add(new Rock(3*8*i + 32));
    }
  }

  void draw() {
    for (Bullet b : pb) b.draw();
    P.draw();
    for (Bullet b : eb) b.draw();
    for (Rock rock : r) rock.draw();
  }

  void update() {
    P.update();
    for (int i = 0; i < pb.size(); i++) {
      Bullet b = pb.get(i);
      b.update();
      for (int j = 0; j < r.size(); j++) {
        if ((int)b.pos.x == r.get(j).x && (int)b.pos.y == height/scale - 3*8) {
          if (r.get(j).removePixels())r.remove(j);
          pb.remove(b);
          break;
        }
      }
    }
    for (Bullet b : eb) {
      b.update();
    }
  }

  void handleInput(int key, int keyCode) { 
    if (key == CODED) {
      if (keyCode == LEFT) P.x -=8;
      if (keyCode == RIGHT) P.x +=8;
    }
    if (key == ' ' && P.reload < 0) {
      pb.add(new Bullet(new PVector(P.x + width/2/scale, height/scale)));
      P.reload = 5;
    }
  }
}