void mousePressed() {
  if (mode == INTRO) introclicks();
  else if (mode == GAME) gameclicks();
  else if (mode ==GAMEOVER) gameoverclicks();
  else if (mode == PAUSE) pauseclicks();
}
