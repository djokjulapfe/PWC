class Game {
  Player P;
  ArrayList<Bullet> pb, eb;
  ArrayList<Rock> r;
  ArrayList<Invader> I;
  int score;

  Game() {
    P = new Player();
    pb = new ArrayList<Bullet>();
    eb = new ArrayList<Bullet>();
    r = new ArrayList<Rock>();
    I = new ArrayList<Invader>();
    for (int i = 0; i < width/24/scale - 1; i++) {
      r.add(new Rock(3*8*i + 32));
    }
    for (int i = 0; i < 8*5; i++) {
      I.add(new Invader(i%8, i/8));
    }
  }

  void draw() {
    for (Bullet b : pb) b.draw();
    P.draw();
    for (Bullet b : eb) b.draw();
    for (Rock rock : r) rock.draw();
    for (Invader i : I) i.draw();
    PImage hp = createHearth();
    for (int i = 0; i < P.hp; i++) {
      image(hp, 2 + i*8, 2);
    }
    textAlign(RIGHT, TOP);
    textSize(5);
    text("SCORE: " + nf(G.score, 6, 0), width/scale, 0);
  }

  void update() {
    P.update();
    for (int i = 0; i < I.size(); i++) {
      for (int j = 0; j < pb.size(); j++) {
        if (I.get(i).hit(pb.get(j))) {
          I.remove(I.get(i));
          pb.remove(pb.get(j));
          i--;
          score += 1000 - frameCount;
          break;
        }
      }
    }
    float miny = 0;
    for (Invader i : I) {
      i.update();
      if (i.pos.y > miny) miny = i.pos.y; 
    }
    if (miny > 88) {
      P.hp = 0;
      return;
    }
    if (random(1) < 0.1) I.get((int)random(I.size())).shoot(); 
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
    for (int i = 0; i < eb.size(); i++) {
      Bullet b = eb.get(i);
      b.update();
      if (b.pos.y > height/scale) {
        eb.remove(b);
        i--;
        continue;
      }
      if (b.pos.x + 3 > P.x + width/2/scale && b.pos.x + 3 < P.x + 6 + width/2/scale && b.pos.y > height/scale - 5) {
        eb.remove(b);
        P.hp--;
        if(P.hp == 0) return;
        i--;
        continue;
      }
      for (int j = 0; j < r.size(); j++) {
        Rock rr = r.get(j);
        if (b.pos.x + 3 > rr.x - 2 && b.pos.x + 3 < rr.x + 8 &&
          b.pos.y > height/scale - 3*8 && b.pos.y < height/scale - 3*8 + 10) {
          if (r.get(j).removePixels())r.remove(j);
          eb.remove(b);
          break;
        }
      }
    }
    if (I.size() == 0) {
      P.hp = 0;
      return;
    }
  }

  void handleInput(int key, int keyCode) { 
    if (key == CODED) {
      if (keyCode == LEFT) P.x -=8;
      if (keyCode == RIGHT) P.x +=8;
    }
    if (key == ' ' && P.reload < 0) {
      pb.add(new Bullet(new PVector(P.x + width/2/scale, height/scale), 1));
      P.reload = 5;
    }
  }
}