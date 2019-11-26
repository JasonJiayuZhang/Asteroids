int mode;
final int INTRO  = 1;
final int GAME   = 2;
final int GAMEOVER = 3;
final int PAUSE  = 4;

boolean upkey, downkey, leftkey, rightkey, spacekey;

int health=4; 
int hp;
int point =0, points;
PImage shipimg;
Ship myShip;
ArrayList<GameObject> myGameObjects;
int n = 100;                 
color yellow = #DFE800;   
color green = #0DD142;
color lgreen = #16861A;
color purple = #9575DB;
color blue = #75DBC9;
color lblue = #23A7B7;
color rred = #9B1F1F;
color red = #E3102C;
color black = #141415;
color lblack = #48413A;
color brown = #985F19;
color orange = #FFB803;
color lorange = #C46B18;
color grey = #A09884;
color white = #FFFFFF;
color lwhite = #D6D5D4;
color dblue = #0D4BFF;
color lgrey = #6A6969;
color pink = #ED02D2;
color lred = #FF3636;
int timer = 1800;
int countdown = 30;
int seconds, startTime;

void setup() {
  mode = INTRO;
  background(255);
  fill(0);
  size(800, 600, P2D);
  imageMode(CENTER);
  //hp = 10;
  myShip = new Ship();
  myGameObjects = new ArrayList<GameObject>();
  //myGameObjects.add(new Ufo());
  textSize(50);
  if(mode == GAME){
  startTime = millis()/1000 + countdown;
}
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == GAMEOVER) gameover();
  else if (mode == PAUSE) pause(); 
  else println("mode error");
}

void keyPressed() {
  if (keyCode == UP)    upkey = true; 
  if (keyCode == DOWN)  downkey = true;
  if (keyCode == LEFT)  leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == ' ')       spacekey = true;
}

void keyReleased() {
  if (keyCode == UP)    upkey = false; 
  if (keyCode == DOWN)  downkey = false;
  if (keyCode == LEFT)  leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (key == ' ')       spacekey = false;
}
