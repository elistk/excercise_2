class Check{
  
  float x;
  float y;
  color col;
  
  Check(float _x, float _y, color _col){
    this.x = _x;
    this.y = _y;
    this.col = _col;
  }
  
  void update(){
    fill(this.col);
    triangle(90, 13, 90, 70, this.x, this.y);
  }
  
}
