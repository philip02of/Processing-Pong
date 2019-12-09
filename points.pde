 class points{
  //declaring variables
  int textSize, red, green, blue, Qpoints;
  boolean right;
  
  //creator
  points(int ts, int r, int g, int b, boolean rr){
    textSize = ts;
    red = r;
    green = g;
    blue = b;
    right = rr;
    Qpoints = 0;
  }
  
  //creating points
  void create(){
    textAlign(CENTER);
    textSize(textSize);
    fill(red, green, blue);
    if(right) text(Qpoints, width*0.8, height*0.2); else text(Qpoints, width*0.2, height*0.2);
  }
  
  //add point
  void add(int q){
    Qpoints += q;
  }
  
  //check if there is a winner
  void check(){
    if(Qpoints == 5){
      if(right) rightWin();else leftWin();
    }
  }
  
  //reset points
  void reset(){
    Qpoints = 0;
  }
}
