float G;
Player player;
ParticleSystem ps;
GravityVector gV;

Planet[] planets;

void setup(){
  size(1000, 600);
  planets = new Planet[]{
    new Planet(20, width/2, height/2 + 100),
    new Planet(20, width/2, height/2 - 100)
  };
  player = new Player();
  ps = new ParticleSystem(player.pos);
  gV = new GravityVector(new PVector(90,90), player.planetsForce,new PVector(40,40));
}

void draw(){
  background(0);
  player.update();
  player.display();
  for(Planet planet : planets){
    planet.display();
  }
  ps.newPos(player.pos);
  if(mousePressed)
  ps.addParticle();
  gV.display();
  ps.run();
}
