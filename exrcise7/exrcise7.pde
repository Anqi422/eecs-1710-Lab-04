int increW;
int increH;
int WCOUNT = 10;
int HCOUNT = 10;

void drawRect(int c, int x, int y, int w, int h) {
  noStroke();
  fill(c);
  rect(x, y, w, h);
}

void settings() {
  size(800, 800);
}
void setup() {
  increW = width/WCOUNT;
  increH = height/HCOUNT;
  int k = 0;
  int c = 0;
  for (int x = 0; x  < width; x += increW)
  {
    for (int y = 0; y < height; y += increH)
    {
      if (k % 2 == 0)
        c = color(255);
      else 
      c = color(0);
      drawRect(c, x, y, increW, increH);
      k++;
    }
    k++;
  }
}

void draw() {
}
