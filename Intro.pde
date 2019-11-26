void intro() {
  background(white);
  fill(black);
  strokeWeight(5);
  textAlign(CENTER);
  textSize(50);
  text("PLAY", width/2, height/2);
  point=0;
}


void introclicks() {
  mode = GAME;
  myShip.show();
  myShip.act();
  health = 4;
  hp = 4;
  //lives = 4;
  health = 4;
}
