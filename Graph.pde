class Graph{ 
  
  PVector size;
  ArrayList<Function> funcs = new ArrayList();
  final float expand = 200;
  
  
  Graph(PVector size){
    assert(size != null);
    this.size = size;
  }
  
  void addFunc(Function f){
    funcs.add(f);
  }  
  
  void draw(){
    for(float x = -origin().x; x <= origin().x; x++){
       for(Function f : funcs){
         float y = f.apply(x / expand) * expand;   
         float nextX = x + 1;
         float nextY = f.apply(nextX / expand) * expand;
         
         lineFromOrigin(x,-y,nextX, -nextY);
      }
    }
    
    drawAxis();
  }  
  
  
  private PVector origin(){
    return new PVector(size.x / 2, size.y / 2);
  }
  
  private void drawAxis(){
    // X Axis
    line(0,origin().y, origin().x * 2, origin().y);
    // Y Axis
    line(origin().x,0, origin().x, origin().y * 2);
  } 
  
  private void lineFromOrigin(float x1, float y1,float x2,float y2){
    line(x1 + origin().x,y1 + origin().y,x2 + origin().x,y2 + origin().y);
  }
}  

interface Function{
 float apply(float x);
}  
