class Ball {
  float x, v, a, diam;
  
  Ball (float xi, float diameter) {
    x = xi;
    diam = diameter;
    v = 0;
    a = 0;
  }
  
  void display() {
    fill(255,0,0);
    ellipse(x,height-diam/2,diam,diam);
    a = random(-0.1,0.1);
    v += a;
    x += v;
    if (x > width) {
      x = width;
      v *= -1;
    } else if (x < 0) {
      x = 0;
      v *= -1;
    }
  }
}