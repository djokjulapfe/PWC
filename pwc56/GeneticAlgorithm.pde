class GeneticAlgorithm {
  float[][][] gen;
  float [] fitness;
  
  GeneticAlgorithm() {
    fitness = new float[100];
    gen = new float[100][500][2];
    for (float[][] a : gen)
      for (float[] b : a) {
        b[0] = (int)random(3) - 1; // direction
        b[1] = random(2); // shoot
      }
  }
  
  void calcFitness() {
    Game t;
    for (int j = 0; j < fitness.length; j++) {
      t = new Game();
      for (float[] i : gen[j]) {
        t.P.move((int)i[0]);
        if((int)i[1] == 1) t.P.shoot(t);
        t.update();
      }
      fitness[j] = t.score;
    }
  }
  
  void sortFitness() {
    for (int i = 0; i < fitness.length - 1; i++) {
      for (int j = i+1; j < fitness.length; j++) {
        if (fitness[i] > fitness[j]) {
          float t = fitness[i];
          fitness[i] = fitness[j];
          fitness[j] = t;
          float[][] genes = gen[i].clone();
          gen[i] = gen[j].clone();
          gen[j] = genes;
        }
      }  
    }
  }
  
  void copyGenes() {
    int start = (int)(0.2*fitness.length);
    int end = fitness.length;
    for (int i = start; i < end; i++) {
      gen[i] = gen[(int) random(start)].clone();
      mutate(gen[i]);
    }
  }
  
  void mutate(float[][] g) {
    for (float[] a : g) {
      a[0] += randomGaussian()*0.1;
      a[1] += randomGaussian()*0.1;
      if (a[0] > 2.99) a[0] = 2.99;
      if (a[0] < 0) a[0] = 0;
      if (a[1] > 0)
    }
  }
  
  void update() {
    calcFitness();
    sortFitness();
    copyGenes();
  }
  
  float[][] getBest() {
    return gen[0].clone();
  }
}