class bal{ 
  //declaring variables
  float xPos, xPosRes, yPos, yPosRes, xSpeed, xSpeedRes, ySpeed, ySpeedRes;
  int xDirection = -1, yDirection = -1, i = 30, timer = 1, rad;  
  
  //creator
  bal(float x, float y, int r, float xs, float ys){
    xPosRes = x;
    yPosRes = y;
    xSpeedRes = xs;
    ySpeedRes = ys;
    xPos = x;
    yPos = y;
    rad = r;
    xSpeed = xs;
    ySpeed = ys; 
  } 
  
  //updating ball position
  void update(){
    if(yPos > height-rad || yPos < rad){
      yDirection *= -1.6;
      if(ySpeed < 2.1) ySpeed += 0.4;
      if(xSpeed < 8.0) xSpeed += 0.5;
    }
    xPos += ( xSpeed * xDirection );
    yPos += ( ySpeed * yDirection );
  }
  
  //creating ball
  void create(){
    noStroke();
    ellipseMode(RADIUS);
    if(i < 100){
      fill(255,40,40,i);
      if(i == 0) timer = 1;
      if(i == 99) timer = -1;
      i+= timer;
    }
    ellipse(xPos, yPos, rad*1.5, rad*1.5);
    fill(140, 143, 156);
    ellipse(xPos, yPos, rad, rad);
    fill(255);
    ellipse(xPos, yPos, rad/3, rad/3);
  }
  
  //reset ball
  void reset(){
    xPos = xPosRes;
    yPos =yPosRes;
    xSpeed = xSpeedRes;
    ySpeed = ySpeedRes;
    xDirection *= -1;
    pause = true;
  }
  
  //deflect ball from beam
  void deflect(boolean down, boolean right){
    if(right) xPos = width-balkr.w-rad-1; else xPos = balkl.w+rad+1;
    xDirection *= -1;
    if(ySpeed < 3) ySpeed += 0.05;
    if(down) yDirection = -1; else yDirection = 1;
  }
} 
