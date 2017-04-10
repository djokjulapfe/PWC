class ParticleSystem {
  ArrayList<Particle> P;
  PVector origin;
  
  ParticleSystem(PVector origin) {
    this.origin = origin.copy();
    P = new ArrayList<Particle>();
  }
  
  void addParticle() {
    P.add(new Particle(origin));
    //P.add(new Particle(new PVector(random(Width), random(Height))));
  }
  
  void update() {
    for (Particle p : P) {
      p.update();
      p.applyForce(new PVector(random(0.2)-0.1, -random(0.3)));
    }
  }
  
  void draw() {
    for (Particle p : P) p.draw();
  }
}