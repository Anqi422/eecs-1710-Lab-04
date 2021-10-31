LetterGenerator lg;
String input = "adzad";

void setup() {
  size(800, 600, P2D);
  lg = new LetterGenerator(input, 0, height/2);
}

void draw() {
  background(100,60,90);
  
  lg.run(); 
}
