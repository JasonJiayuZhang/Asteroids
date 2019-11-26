void game() {
  background(black);
  fill(white);
  seconds = startTime - millis()/1000;
  if (seconds < 0) {
    startTime = millis()/1000 + countdown;
    myGameObjects.add(new Ufo());
    myGameObjects.add(new Asteroid());
    myGameObjects.add(new Asteroid());
    myGameObjects.add(new Asteroid());
  } else {               
    text(seconds, width-50, 60);
  }
  text("Point: "+point, 120, 60);
  myShip.show();
  myShip.act();

  //if (myShip.hp1 < 0) {
  //  mode = GAMEOVER;

  int i = 0;
  while (i < myGameObjects.size()) {
    GameObject myObj = myGameObjects.get(i);
    myObj.show();
    myObj.act();
    if (myObj.lives == 0) {
      myGameObjects.remove(i);
    } else {
      i++;
    }
  }
}


void gameclicks() {
}
