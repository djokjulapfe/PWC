int scale;
Game G;
GeneticAlgorithm ga;
float[][] moves;
int t;

void setup() {
  size(800, 600);
  noSmooth();
  frameRate(5);
  scale = 5;
  fill(0);
  text("Training...", width/2, height/2);
  loadGraphics();
  ga = new GeneticAlgorithm();
  for(int i = 0; i < 10; i++) {
    println(i);
    ga.update();
  }
  moves = ga.getBest();
  t = 0;
  G = new Game();
}

void draw() {
  if (G.P.hp == 0) {
    textSize(50);
    textAlign(CENTER, CENTER);
    fill(random(255), 255, 255);
    text("GAME OVER\nYour score:" + nf(G.score, 5, 0) + "\npress 'r'", width/2, height/2);
  }
  if (G.P.hp > 0) {
    background(0);
    scale(scale);
    G.P.move((int)moves[t][0]);
    if ((int)moves[t][1] == 1) G.P.shoot(G);
    G.update();
    G.draw();
    println(moves[t][0] + " " + moves[t][1]);
    t++;
  }
}

void keyPressed() {
  if (G.P.hp > 0) {
    G.handleInput(key, keyCode);
  } else if (key == 'r') {
    G = new Game();
  }
}