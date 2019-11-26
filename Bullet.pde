class Bullet extends GameObject {

  int timer;

  Bullet() {
    location = new PVector (myShip.location.x, myShip.location.y);
    velocity = new PVector (myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);
    lives = 1;
    timer = 60;
    size = 10;
  }

  void show() {
    noFill();
    stroke(255);
    triangle(location.x-5, location.y+5, location.x, location.y-5, location.x+5, location.y+5);
  }

  void act() {
    super.act();

    timer--;
    if (timer == 0) {
      lives = 0;
    }
  }
}
