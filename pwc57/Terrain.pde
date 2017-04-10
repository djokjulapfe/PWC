class Terrain {
  boolean[][] block;
  int[][] pn;

  Terrain() {
    block = new boolean[Width][Height];
    pn = new int[Width][Height];
  }

  void draw() {
    fill(255);
    noStroke();
    for (int i = 0; i < Width; i++) {
      for (int j = 0; j < Height; j++) {
        if (block[i][j] == true) rect(i, j, 1, 1);
      }
    }
  }

  int getBlock(int x, int y) {
    if (x >= 0 && x < Width && y >= 0 && y < Height) {
      return block[x][y] ? 200 : pn[x][y];
    }
    return 0;
  }

  void update() {
    pn = new int[Width][Height];
    for (Particle p : ps.P) {
      int x = (int)p.p.x;
      int y = (int)p.p.y;
      if (x >= 0 && x < Width && y >= 0 && y < Height) {
        pn[x][y]++;
      }
    }
  }
  
  void reset() {
    block = new boolean[Width][Height];
  }
}