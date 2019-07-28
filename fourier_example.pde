float L = 1;
int N = 200;
int M = 50;

float fourier(Function f, float x){
  float a0 = am(0,f);
  float sum = 0;
  
  for(float m : range(1,M)){
    sum += am(m,f) * cos(((2 * PI * m)/ L) * x) + bm(m,f) * sin(((2 * PI * m)/ L) * x);
  }
  
  return (a0 / 2.0) + sum;
}

float am(float m, Function f){
  float delta = L / float(N);
  
  float sum = 0;
  for(float n : range(1, N/2)){
    float x = -L * 0.5 + delta * (2 * n - 1);
    sum += (f_am(f,x - delta,m)+4*f_am(f,x,m)+f_am(f,x + delta,m)) / 3.0 * delta;
  }
 
  return 2/L * sum;
}

float f_am(Function f, float x, float m){
  return f.apply(x) * cos(2 * PI * m * x / L);
}


float bm(float m, Function f){
  float delta = L / float(N);
  
  float sum = 0;
  for(float n : range(1, N/2)){
    float x = -L * 0.5 + delta * (2 * n - 1);
    sum += (f_bm(f,x - delta,m)+4*f_bm(f,x,m)+f_bm(f,x + delta,m)) / 3.0 * delta;
  }
 
  return 2/L * sum;
}

float f_bm(Function f, float x, float m){
  return f.apply(x) * sin(2 * PI * m * x / L);
}









float xOf(float x){
  
  float sum = 0;
  
  for(float n : range(1,50)){
    sum += xOfInSum(x,n);
  }
  
  
  return sum;
}  

float xOfInSum(float x, float n){
  return (L / (PI * n)) * pow(-1, n+1) * sin((2 * PI * n / L) * x);
}
