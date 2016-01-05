int num = 100;
boolean start = false;
float s, hs;
PVector mouse;   //declare a P
Ball b;
ArrayList<Raindrop> rain = new ArrayList<Raindrop>();      //declare a new Raindrop called r

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  b = new Ball(width/2, 25);
  noStroke();
  textAlign(CENTER);
}

void draw() {
  if (start == true) {
    mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
    background(255);
    for (int i = 0; i < 25; i++) {
      rain.add(new Raindrop(random(width), random(-height, 0)));   //Initialize r. The parameters used are the initial x and y positions
    }
    Umbrella u = new Umbrella(mouse);
    u.display();
    b.display();
    for (int i = rain.size()-1; i >= 0; i--) {
      Raindrop droplet = rain.get(i);
      droplet.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      if (droplet.loc.y > 0 && blue(get(round(droplet.loc.x), round(droplet.loc.y))) == 0) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        rain.remove(i);                         //if it is, reset the raindrop
      }
      if (dist(droplet.loc.x, droplet.loc.y, b.x, height-b.diam/2) <= b.diam+droplet.diam) {
        start = false;
        if (s > hs) {
          hs = s;
        }
      }
      droplet.display();      //display the raindrop
      if (droplet.loc.y > height + droplet.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        rain.remove(i);                           //if it does, reset the raindrop
      }
    }
    u.display();
    s += 1/frameRate;
    fill(0);
    textSize(50);
    text(floor(s),width/2,50);
  } else {
    background(128);
    for (int i = 0; i < rain.size(); i++) {
      rain.remove(i);
    }
    fill(255);
    textSize(50);
    text("Patter", width/2,height/2);
    textSize(20);
    text("Score: " + floor(s), width/2,height/2+100);
    text("High Score: " + floor(hs), width/2,height/2+200);
  }
}

void mouseClicked() {
  if (start == false) {
    s = 0;
    b.x = width/2;
  }
  start = true;
}