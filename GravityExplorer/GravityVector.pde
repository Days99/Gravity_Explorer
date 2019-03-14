class GravityVector{

PVector direction;
PVector position;
PVector rectPosition;
float scale;
String text;

GravityVector(PVector position, PVector direction, PVector rectPosition)
{
this.direction = direction;
this.position = position;
this.rectPosition = rectPosition;
text = "Gravity Detector";
scale = 25;
}

void display()
{
  push();
  noFill();
  rect(rectPosition.x, rectPosition.y, 100,100);
  line(position.x, position.y, position.x + direction.x * scale, position.y + direction.y * scale);
  text(text,rectPosition.x, rectPosition.y + 120);
  pop();
}
  
  
};
