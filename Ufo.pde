class Ufo extends GameObject {

  //1. Instance variables
  PVector direction;
  int shotTimer;
  int threshold;
  int hp;
  float health=4; 
  int Timer;
  float x, y, d, vx, vy;



  //2. Constructor(s)
  Ufo() {
    lives = 10;
    shotTimer = 0;
    threshold = 180;
    hp1 = 4;
    size = 200;
    vx = 2;
    vy = 2;
    hp = 4;
    location = new PVector(200, 200);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
  }

  //3. Behaviour functions
  void show() {

    pushMatrix();
    translate(location.x, location.y);
    noStroke();
    fill(0);
    arc(0, 37, 50, 50, -PI, 0);
    arc(0, 70, 125, 70, -PI, 0);
    fill(255);
    arc(0, 35, 40, 40, -PI, 0);
    fill(0);

    ellipse(0, 80, 6, 6);
    ellipse(50, 80, 6, 6);
    ellipse(-50, 80, 6, 6);
    popMatrix(); 
    fill(244, 3, 3);
    noStroke();
    rect(location.x-20, location.y+50, map(health, 0, 5, 0, 50), 3 );
    fill(244, 3, 3);
  }

  void act() {
    super.act();

    shotTimer++;

    PVector direction = new PVector(myShip.location.x-location.x, myShip.location.y-location.y);
    direction.setMag(4);
    vx = direction.x;
    vy = direction.y;

    //location.y = location.y-random(4, 5) + vy; 
    location.x = location.x + vx; 

    if ( shotTimer >= threshold) {


      myGameObjects.add(new Ufobullet(location.x, location.y));
      shotTimer = 0;
    }

    int i = 0;
    while (i < myGameObjects.size()) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          lives --;
          health = health - 0.4;
          health=constrain(health, 0, 10);
          Timer = 0;
          point = point +1;
          myObj.lives = 0;
          if (lives ==0) {   
            //myGameObjects.add(new Ufo());
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
