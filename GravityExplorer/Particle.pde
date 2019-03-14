class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l, PVector acc) {
    acceleration = acc;
    velocity = new PVector(random(-0.5,0.5),random(-0.5, 0.5));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 20.0;
  }

  // Method to display
  void display() {
    push();
    stroke(255, lifespan);
    fill(255, lifespan);
    ellipse(position.x, position.y, 2, 2);
    pop();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
