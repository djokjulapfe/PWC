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
  background(0);
  scale(scale);
  image(light_img, -8, height/scale - 32 + 8);
 
  G.update();
  G.draw();
}

void keyPressed() {
  G.handleInput(key, keyCode);
}