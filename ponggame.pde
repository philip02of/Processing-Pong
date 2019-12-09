//declaring sound liberie
import processing.sound.*;
AudioIn input;
Amplitude analyzer;

//setting variables to use in the setup
int widthN = 900;
int heightN = 600;

//building objects
bal bal = new bal(widthN/2, heightN/3, 20, 3.8, 2.8);
balk balkl = new balk(heightN/2, 30, 150, false);
balk balkr = new balk(heightN/2, 30, 150, true);
points pointsl = new points(32, 0, 200, 50, false);
points pointsr = new points(32, 0, 200, 50, true);
stars background = new stars(2000, 1);

//set booleans
boolean gamestart = false, pause = true, start = false, space, upR, downR, upL, downL;


void setup(){
  //declaring screen size, frame rate
  size(900, 600);
  frameRate(60); 
  //building background
  background.build();
  
  // Start listening to the microphone
  // Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);

  // start the Audio Input
  input.start();

  // create a new Amplitude analyzer
  analyzer = new Amplitude(this);

  // Patch the input to an volume analyzer
  analyzer.input(input);
}

void draw(){
  //rebuilding background
  if(analyzer.analyze()*40 > 20) background.build();
  background.create();
  if(start) game(); else startScreen();
}

void startScreen(){
  //creating points, ball, beams
  pointsl.create();
  pointsr.create();
  bal.create();
  balkl.create();
  balkr.create();
  //make beams move
  balkl.update();
  balkr.update();
  //creating text
  fill(255);
  text("W", balkl.w/2, height/5);
  text("S", balkl.w/2, height-height/5);
  text("↑", width-balkr.w/2, height/5);
  text("↓", width-balkr.w/2, height-height/5);
  text("PRESS SPACE TO START", width/2, height/2);
  //looking for start signal
  if(space) start = true;
}

void game(){
  //creating points, ball, beams
  pointsl.create();
  pointsr.create();
  bal.create();
  balkl.create();
  balkr.create();
  //looking for hit
  balkr.hit();
  balkl.hit();
  //making beams move
  balkl.update();
  balkr.update();
  //checking for a winner
  pointsr.check();
  pointsl.check();
  //continuing game by pressing space
  if(pause) if (space) pause = false; if(pause) text("PRESS SPACE TO CONTINUE", width/2, height/2); 
  if(!pause) bal.update();
}

//winning screen right playyer
void rightWin(){
  //creating points, ball, beams
  pointsl.create();
  pointsr.create();
  bal.create();
  balkl.create();
  balkr.create();
  balkl.update();
  balkr.update();
  //making green right corner, and red left corner
  rectMode(CORNER);  
  fill(40,255,40,100);
  rect(width/2,0,width/2,height);
  fill(255,40,40,100);
  rect(0,0,width/2,height);
  fill(255);
  text("YOU WIN", width-width/5, height/4);
  text("YOU LOSE", width/5, height/4);
  fill(255);
  //start new game by space
  if(space){
    pointsl.reset();
    pointsr.reset();
  }
}

//winning screen left player
void leftWin(){
  //creating points, ball, beams
  pointsl.create();
  pointsr.create();
  bal.create();
  balkl.create();
  balkr.create();
  balkl.update();
  balkr.update();
  //making red right corner, and green left corner
  rectMode(CORNER);  
  fill(255,40,40,100);
  rect(width/2,0,width/2,height);
  fill(40,255,40,100);
  rect(0,0,width/2,height);
  fill(255);
  text("YOU LOSE", width-width/5, height/4);
  text("YOU WIN", width/5, height/4);
  fill(255);
  //start new game by space
  if(space){
    pointsl.reset();
    pointsr.reset();
  }
}

//checking if keys are pressed
void keyPressed(){
  if(key == 'w' || key == 'W') upL = true;
  if(key == 's' || key == 'S') downL = true;
  if(keyCode == UP) upR = true;
  if(keyCode == DOWN) downR = true;
  if(keyCode == ' ') space = true;
}
 
//checking if keys are released
void keyReleased(){
  if (key == 'w' || key == 'W') upL = false;
  if (key == 's' || key == 'S') downL = false;
  if (keyCode == UP) upR = false;
  if (keyCode == DOWN) downR = false;
  if (keyCode == ' ') space = false;
}
