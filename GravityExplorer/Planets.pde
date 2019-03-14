class Planet{
  
  float g;
  PVector pos;
  float m;
  PVector sumF;
  float F;
  float Fx, Fy;

Planet(float m, float x, float y){
  this.m = m;
  g = 10;
  pos = new PVector(x, y);
}
 //<>//
void display(){
  stroke(255);
  //line(pos.x,pos.y,force.x,force.y);
  ellipse(pos.x,pos.y, m,m);
}

}
