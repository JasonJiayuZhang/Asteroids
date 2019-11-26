class Ship extends GameObject {


  //1. Instance variables
  PVector direction;
  int shotTimer;
  int threshold;
  int health=4; 
  int Timer;


  //2. Constructor(s)
  Ship() {
    lives = 3;
    shotTimer = 0;
    threshold = 30;
    hp1 = 4;
    size = 50;


    location = new PVector(width/2, height/2);   
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
  }

  //3. Behaviour functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate( direction.heading() );
    stroke(white);
    noFill();
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    popMatrix();

    fill(244, 3, 3);
    noStroke();
    rect(location.x-20, location.y+30, map(health, 0, 5, 0, 50), 3 );
  }

  void act() {
    super.act();

    shotTimer++;

    if (upkey)    velocity.add(direction);
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate( -radians(2) );
    if (rightkey) direction.rotate( radians(2) );
    if (spacekey && shotTimer >= threshold) { 
      myGameObjects.add(new Bullet());
      shotTimer = 0;
    }


    Timer ++;
    int i = 0;
    while (i <myGameObjects.size()) {
      GameObject myObj =  myGameObjects.get(i);
      if (myObj instanceof Asteroid) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2 && Timer > 40) {
          hp--;
          health--;
          health=constrain(health, 0, 10);
          Timer = 0;
          if (hp <= 0) {
            mode = GAMEOVER;
            lives = 4;
            health = 4;
          }
        }
      }
      if (myObj instanceof Ufobullet) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2 && Timer > 40) {
          hp--;
          health--;
          health=constrain(health, 0, 10);
          Timer = 0;
        }

        if (hp <= 0) {
          mode = GAMEOVER;
          lives = 4;
          health = 4;
        }
      }
      i++;
    }
  }
}
