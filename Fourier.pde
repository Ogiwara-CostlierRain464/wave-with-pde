Graph graph;

void setup(){
  size(700, 700);
  graph = new Graph(new PVector(700, 700));
  graph.addFunc(new Function(){
    public float apply(float x){
      return fourier(new Function(){
        public float apply(float ax){
          return gauss(ax);
        }
      }, x);
    }
  });
  
}

void draw(){
  background(0);
  stroke(255); 
  
  graph.draw();
  
}  
