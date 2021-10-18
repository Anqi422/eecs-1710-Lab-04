PImage back;
PImage bees1;
PImage bees2;
PImage bee;
float x = 100;
float y = 100;
float easing = 0.05;
float angle1 = 0.0;
float segLength = 50;

void setup() {
  size(996, 654, P2D);
  back = loadImage("back.jpg");
  bees1 = loadImage("bees1.png");
  bees1.resize(bees1.width/2, bees1.height/2);
  bees2 = loadImage("bees2.png");
  bees2.resize(bees2.width/2, bees2.height/2);
  bee = loadImage("bee.png");
  bee.resize(bee.width/3, bee.height/3);
  noStroke();  
}

void draw() { 
   background(back);
   float dx = mouseX - x;
   float dy = mouseY - y;
   angle1 = atan2(dy, dx);
   x = mouseX - (cos(angle1) * segLength);
   y = mouseY - (sin(angle1) * segLength);
   ellipse(x, y, 20, 20);
   image(  bee, x, y);
   image(  bees1, x, y/3);
   image(  bees2, x*1.5, y);
}
