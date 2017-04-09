int scale;
Game G;

void setup() {
  size(800, 600);
  noSmooth();
  frameRate(5);
  scale = 5;
  loadGraphics();

  G = new Game();
}

void draw() {
  if (G.P.hp == 0) {
    textSize(50);
    textAlign(CENTER, CENTER);
    fill(random(255), 255, 255);
    text("GAME OVER\npress 'r'", width/2, height/2);
  }
  if (G.P.hp > 0) {
    background(0);
    scale(scale);
    G.update();
    G.draw();
  }
}

void keyPressed() {
  if (G.P.hp > 0) {
    G.handleInput(key, keyCode);
  } else if (key == 'r') {
    G = new Game();
  }
}