class Player
{
PVector pos;
float sumFx, sumFy;
PVector acceleration;
PVector velocity;
PVector steer;
PVector planetsForce;
float limit;
float m;

Player (){
  pos = new PVector(width/2 - 100, height/2 );
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
  planetsForce = new PVector(0,0);
  limit = 0.1;
  m = 10;
}

void update(){
  if(mousePressed)
  {
  targetMouse(mouse());
  applyForce(steer);
  }
  for(Planet planet : planets)
  {
    planetForce(planet);
    acceleration.add(planet.sumF.div(1.2));
    planetsForce.add(planet.sumF).normalize();;
  }
  acceleration.div(m);
  velocity.add(acceleration);
  pos.add(velocity);

}
  

void planetForce(Planet planet)
{
  float planetDistance = dist(pos, planet.pos);
  planet.F = planet.g * ((m * planet.m)/sqr(planetDistance));
  planet.Fx =  -planet.F * ((pos.x-planet.pos.x)/planetDistance);
  planet.Fy =  -planet.F * ((pos.y-planet.pos.y)/planetDistance);
  planet.sumF = new PVector (planet.Fx,planet.Fy);
}

void targetMouse(PVector target) 
{
  PVector desired = PVector.sub(target, pos).normalize();
  desired.mult(4);   
  steer = PVector.sub(desired, velocity);
  steer.limit(limit);    
  applyForce(steer);
}
  
  
void mousePressed()
{
  targetMouse(mouse());
}

void applyForce(PVector force) 
{
  acceleration.add(force);
}
  

void display()
{
  push();
  fill(#FC2121);
    star(pos.x,  pos.y, 5, 10, 5); 
 // rect(pos.x - 5, pos.y - 5, 10, 10);
  pop();
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

}
