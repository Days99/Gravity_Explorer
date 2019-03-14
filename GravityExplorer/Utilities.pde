float dist(PVector p1, PVector p2) {
  return dist(p1.x, p1.y, p2.x, p2.y);
}

float sqr(float value) {
  return value * value;
}

PVector mouse() {
  return new PVector(mouseX, mouseY);
}