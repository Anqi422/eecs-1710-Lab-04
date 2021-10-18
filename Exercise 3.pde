String hour;
String minute;
String second;

void setup()
{
  size(600, 600);
  background(170,57,70);
  stroke(245);
  strokeWeight(2); 
  textAlign(CENTER);
  textSize(60);
  
}

void draw()
{
  background(170,57,70);
  float s = second(); // Values from 0 - 59
  float m = minute(); // Values from 0 - 59
  float h = hour(); // Values from 0 - 23
  
  s =s/60*width; // Values from 0 - 59
  m = m/60*width; // Values from 0 - 59
  h = h/24*width; // Values from 0 - 23

print("sec " + s + " min " + m + " hour " + h +" \n");
  rect(width/2, height/2, s/4,s/4);
  fill(245,127);
  
  triangle(width/2, height/2,  height/2,m/2,m/2,width/2);
  fill(245,85);
  
  ellipse(width/2, height/2, h/2,h/2);
  fill(245,50);

hour   = transform(hour());
minute = transform(minute());
second = transform(second());

text(hour + ":" + minute + ":" + second, width/2, height/6); 

}

String transform(int number)
{
  String value = "";
  
  if(number < 10)
  {
    value = "0" + number;
  }
  else
  {
    value = str(number);
  }
  
  return value;
}
