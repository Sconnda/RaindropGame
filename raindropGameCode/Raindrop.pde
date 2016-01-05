class Raindrop {
  PVector loc, vel, acc;
  color c;
  float diam;

  Raindrop(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0.5);
    c = color(0,100,128, random(128, 255));
    diam = random(5,10);
  }

  void fall() {
    vel.add(acc);
    loc.add(vel);
  }

  void display() {
    fill(c);
    triangle(loc.x-diam/2+diam/2*vel.y*5/height,loc.y,loc.x+diam/2-diam/2*vel.y*5/height,loc.y,loc.x,loc.y-vel.y*500/height);
    arc(loc.x, loc.y, diam-diam*vel.y*5/height,diam,0,PI);
  }
  
  void reset() {
    loc.set(random(width),random(-height,0));
    vel.set(0,0);
  }

  boolean isInContactWith(PVector mouse) {
    if (dist(loc.x, loc.y, mouse.x, mouse.y) <= 10) {
      return true;
    } else {
      return false;
    }
  }
}