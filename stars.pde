class stars{
  //declaring variables
  int quantity, s;
  float[] xPos, yPos, size;
  
  //creator
  stars(int q, int ss){
    quantity = q;
    s = ss;
    xPos = new float[q];
    yPos = new float[q];
    size = new float[q];
  }
  
  //build stars
  void build(){
    for(int i = 0; i < quantity; i ++){
      xPos[i] = random(width);
      yPos[i] = random(height);
      size[i] = random(1, s);
    }
  }
  
  //create stars
  void create(){
    background(0);
    for(int i = 0; i < quantity; i ++){
      fill(random(150, 255));
      ellipse(xPos[i], yPos[i], size[i], size[i]);
    }
  }
}
