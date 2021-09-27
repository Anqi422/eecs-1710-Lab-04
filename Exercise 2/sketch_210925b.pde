PImage ocean;
PImage boat;
float x1, y1, x2, y2;
float speedX1, speedX2;

void setup() {
  size(800, 600, P2D);
  ocean = loadImage("ocean.jpeg");
  ocean.resize(width, height);
  boat = loadImage("boat.jpeg");
  boat.resize(boat.width, boat.height);
  imageMode(CENTER);
  
  x1 = width/2;
  y1 = height/2;
  x2 = x1 + 50;
  y2 = y1 - 50;
  speedX1 = 0.5;
  speedX2 = speedX1*2;
}

void draw() {
  background(210,251,240);
  tint(255, 127);
  image(ocean, x2, y2);
  
  noTint();
  image(ocean, x1, y1);
   image(ocean, x1-800, y1);
  
  x1 += speedX1;
  x2 += speedX2;
    
  if (x1> width || x1<0) {
    speedX1 *= -1;
     x2 = 0;
  }
    float a = random(width);
    float b = height/1.5;
    
    for (int j=0; j<1; j++) {
      float a2 = a + j * 5;
      float b2 = b + j * 10;
      
       noTint();
      image(boat, a2, b2);
      
  }
}
