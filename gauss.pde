float sigma = 0.1;
float xBar = 0;

float gauss(float x){
  return (1/sqrt(2 * PI * pow(sigma,2))) * exp(- (pow(x-xBar,2)) / (2 * pow(sigma,2)));
}
