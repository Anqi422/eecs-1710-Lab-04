import processing.sound.*;
 
SoundFile soundFile;  
AudioIn in;  
Amplitude amp;
float lucency = 0;
float ampvalue = 0;
 
void setup()
{
  size(600,600);
  pixelDensity(displayDensity());
  in = new AudioIn(this,0);
  amp = new Amplitude(this);
  in.start();  
  amp.input(in);
}
 
int lastm = 0;

void draw()
{
  background(100,150,200);
  noStroke();

  int m = millis();
  if(m/60>lastm)
  {
    ampvalue = amp.analyze();
    lastm = m/60;
  }
  println("millis:"+m);
  println(ampvalue); 
  
  drawOutsideCircle(ampvalue);
  
  fill(200,150.100);
  ellipse(300,300,260,300);
  noFill();
  
  fill(50,100,170);
  ellipse(300,300,200,280);
  noFill();
  
  drawInsideCircle(ampvalue);

  fill(180,100.50);
  ellipse(300,300,100,190);
  noFill();
  
}

void drawOutsideCircle(float ampvalue)
{
  int wid = 400;
  lucency = ampvalue*10000;
  fill(100,0,200,lucency);
  ellipse(300,300,wid-70,wid);
  noFill();
}

void drawInsideCircle(float ampvalue)
{
  float wid = 100;
  wid = wid*ampvalue*100 + wid;
  if(wid>190)
  wid = 190;
  
  fill(100,50,200);
  ellipse(300,300, wid-50,wid);
  noFill();

  strokeWeight(5);
  stroke(255);
  ellipse(300,300, 100,150);
  ellipse(300,300, 110,200);
  noStroke();
}
