class Asteroid extends GameObject {

  Asteroid() {
    lives = 4;
    size = 100;
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 1);
    velocity.setMag( random(0, 2) );
    velocity.rotate( random(TWO_PI) );
  }

  Asteroid(int s, float x, float y) {
    lives = 4;
    size = s;
    location = new PVector(x, y);
    velocity = new PVector(0, 1);
    velocity.setMag( random(0, 2) );
    velocity.rotate( random(TWO_PI) );
  }

  void show() {
    stroke(white);
    noFill();
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();

    int i = 0;
    while (i < myGameObjects.size()) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          lives --;
          point = point +1;
          myObj.lives = 0;
          if (lives == 0) {
            myGameObjects.add(new Asteroid(size/2, location.x, location.y));
            myGameObjects.add(new Asteroid(size/2, location.x, location.y));
            while (i < 100) {
              myGameObjects.add(new Particle(location.x, location.y));
              i++;
            }
          }
        }
      }

      i++;
    }
  }
}
