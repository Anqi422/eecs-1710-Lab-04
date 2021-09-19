color bgColor = color(140, 205,10);
float circleSize = 100;

void setup() {
  size(700, 540, P2D); // P2D enables 2D GPU acceleration
  background(bgColor);
}

void draw() {
  strokeWeight(4);
  fill(150, 160, 100);
   if (mousePressed) {
    rectMode(CENTER);
    fill(177, 77, 195);
    stroke(120, 10, 100);
    line(mouseX, mouseY, pmouseX, pmouseY);
    rect(mouseX, mouseY, circleSize, circleSize);
  }else{
     fill(20, 112, 14);
     line(90, 20, pmouseX, pmouseY);
  }
}
