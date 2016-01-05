//game has not begun
boolean start = false;

//raindrops created each frame of the game
int num = 25;

//score
float s, hs;

//declare position of mouse as a vector
PVector mouse;   //declare a P

//declare ball and raindrop ArrayList
Ball b;
ArrayList<Raindrop> rain = new ArrayList<Raindrop>();      //declare a new Raindrop called r

void setup() {
  //set size and initial settings 
  size(1200, 800);
  noStroke();
  textAlign(CENTER);

  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  b = new Ball(width/2, 25);            //initialize ball and set x position and diameter
}

void draw() {
  if (start == true) {                    //if the game has begun
    mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
    background(255);

    //create raindrops
    for (int i = 0; i < num; i++) {
      rain.add(new Raindrop(random(width), random(-height, 0)));   //Initialize r. The parameters used are the initial x and y positions
    }
    
    //initialize umbrella and display once
    Umbrella u = new Umbrella(mouse);
    u.display();
    
    //display ball
    b.display();
    
    for (int i = rain.size()-1; i >= 0; i--) {      //for all existing raindrops
      Raindrop droplet = rain.get(i);
      droplet.fall();                             //make the raindrop fall

      if (droplet.loc.y > 0 && blue(get(round(droplet.loc.x), round(droplet.loc.y))) == 0) {      //check to see if the raindrop is in contact with the umbrella (if the color beneath it is black)
        rain.remove(i);                                                                           //if it is, remove the raindrop
      }
      if (dist(droplet.loc.x, droplet.loc.y, b.x, height-b.diam/2) <= b.diam+droplet.diam) {      //check if the raindrop touches the ball
        start = false;                       //game ends
        if (s > hs) {
          hs = s;                        //increase high score if the score is greater than the old high score
        }
      }
      droplet.display();      //display the raindrop
      if (droplet.loc.y > height + droplet.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        rain.remove(i);                           //if it does, remove the raindrop
      }
    }
    u.display();
 
    //score is the amount of time elapsed from start of the game
    s += 1/frameRate;

    //display score
    fill(0);
    textSize(50);
    text(floor(s),width/2,50);
  } else {              //game over
    background(128);

    //remove all raindrops
    for (int i = 0; i < rain.size(); i++) {
      rain.remove(i);
    }

    //display title text and scores
    fill(255);
    textSize(50);
    text("Patter", width/2,height/2);
    textSize(20);
    text("Score: " + floor(s), width/2,height/2+100);
    text("High Score: " + floor(hs), width/2,height/2+200);
  }
}

void mouseClicked() {
  if (start == false) {    //check if the game has started 
    s = 0;                 //if not, reset the score, center the ball, and start
    b.x = width/2;
    start = true;
  }
}