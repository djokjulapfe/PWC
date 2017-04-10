int Width, Height;
int scale;
ParticleSystem ps;
Terrain T;

void setup() {
  size(800, 600);
  scale = 5;
  Width = width/scale;
  Height = height/scale;
  noSmooth();

  ps = new ParticleSystem(new PVector(Width/2, Height));
  T = new Terrain();
  ps.addParticle();
}

void draw() {
  if (mousePressed) {
    if (mouseButton == LEFT)
      T.block[mouseX/scale][mouseY/scale] = true;
    else
      T.block[mouseX/scale][mouseY/scale] = false;
  }
  for (int i = 0; i < 1; i++) {
    T.update();
    ps.addParticle();
    ps.update();
  }
  background(0);
  scale(scale);
  T.draw();
  ps.draw();
}

void keyPressed() {
  if (key == 'r') {
    T.reset();
  }
}