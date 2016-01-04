int num = 100;
PVector mouse;   //declare a P
ArrayList<Raindrop> rain = new ArrayList<Raindrop>();      //declare a new Raindrop called r

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  noStroke();
}

void draw() {
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(50);
  for (int i = 0; i < 10; i++) {
    rain.add(new Raindrop(random(width), random(-height,0)));   //Initialize r. The parameters used are the initial x and y positions
  }
  Umbrella u = new Umbrella(mouse);
  u.display();
  for (int i = rain.size()-1; i >= 0; i--) {
    Raindrop droplet = rain.get(i);
    droplet.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    if (droplet.loc.y > 0 && blue(get(round(droplet.loc.x),round(droplet.loc.y))) == 0) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      rain.remove(i);                         //if it is, reset the raindrop
    }
    droplet.display();      //display the raindrop
    if (droplet.loc.y > height + droplet.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      rain.remove(i);                           //if it does, reset the raindrop
    }
  }
  u.display();
}