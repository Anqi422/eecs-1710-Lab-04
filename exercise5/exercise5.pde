float maxThreshold = 0.01;
float minThreshold = 0.001;
Butterfly a;

void setup() {
  size(800, 600, P3D); 
  setupSound();
  a = new Butterfly();   
}

void draw() {
  updateSound();
  float amp = getAmp();
  if (amp > maxThreshold) {
     background(0,200,0);
   a.goUp();
   } else if (amp < minThreshold) {
     background(100,0,100);
   a.goDown();
   a.draw();
   }
}
