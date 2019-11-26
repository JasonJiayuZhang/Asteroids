class Particle extends GameObject {
  int timer;

  Particle(float x, float y) {
    location = new PVector (x, y);
    velocity = new PVector (1, 0);
    velocity.rotate( random(TWO_PI) );
    velocity.setMag( (random(0.4, 2)));
    lives = 1;
    size = 1;
    alive = true;
    timer = 60;
  }

  void show() {
    rect(location.x, location.y, 3, 3);
  }

  void act() {
    super.act();
    timer--;
    if (timer == 0) {
      lives = 0;
    }
  }
}
