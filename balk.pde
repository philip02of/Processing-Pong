class balk{ 
  //declaring variables
  float yPos, w, h;
  boolean right;
  
  //creator
  balk(int y, int ww, int hh, boolean r){  
    yPos = y;
    w = ww;
    h = hh;
    right = r;
  } 
  
  //making beam move
  void update() {
    if(yPos < h/2){
      yPos = h/2;
    }else if(yPos > height-h/2){
       yPos = height-h/2;
    }else if(right){
      if(upR){
        yPos -= 5;
      }else if(downR){
        yPos += 5;
      }
    }else{
      if(upL){
        yPos -= 5;
      }else if(downL){
        yPos += 5;
      }
    }
  }
  
  //creating beam
  void create() {
    fill(255, 100, 100);
    rectMode(CENTER);
    if(right) rect(width-w/2,yPos,w,h); else rect(w/2,yPos,w,h);
  }
  
  //looking for a hit
  void hit(){
    if(right){
      if(bal.xPos+bal.rad >= width-w && bal.xPos+bal.rad < width){
        if(bal.yPos > yPos-h/2 && bal.yPos < yPos){
          bal.deflect(true, true);
        }else if(bal.yPos > yPos && bal.yPos < yPos+h/2){
          bal.deflect(false, true);
        }
      }
    }else{
      if(bal.xPos-bal.rad <= w && bal.xPos-bal.rad > 0){
        if(bal.yPos > yPos-balkl.h/2 && bal.yPos < yPos){
          bal.deflect(true, false);
        }else if(bal.yPos > yPos && bal.yPos < yPos+h/2){
          bal.deflect(false, false);
        }
      }
    }
    if(bal.xPos+bal.rad*2 < 0){
      pointsr.add(1);
      bal.reset();
    }
    if(bal.xPos-bal.rad*2 > width){
      pointsl.add(1);
      bal.reset();
    }
    }
}
