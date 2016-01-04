class Umbrella {
  PVector loc;
  
  Umbrella(PVector mouse) {
    loc = new PVector(mouse.x,mouse.y);
  }
  
  void display() {
    fill(0);
    arc(loc.x,loc.y-10,200,150,PI,TWO_PI,OPEN);
    rect(loc.x-2,loc.y-20,4,100);
  }
}