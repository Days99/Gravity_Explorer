class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }
  
  public void newPos(PVector pos)
  {
    origin = pos;
  }
  
  public void clearArray()
  {
    for(Particle p : particles){
    p.lifespan = 0;
    }
  }

  void addParticle() {
    particles.add(new Particle(origin, origin.copy().sub(mouse()).normalize()));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
