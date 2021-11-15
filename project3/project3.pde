color IMPOSSIBLE=color(120);
boolean px1_on=true;
int count=1;
float space=2;

void setup() {
  size(600,600);
  PImage pic=loadImage("bunny.jpeg");
  pic.resize(width, height); 
  pic.loadPixels();
  loadPixels();
  for (int i=0; i<pixels.length; i++) {
    if (brightness(pic.pixels[i])<240) {
      pixels[i]=pic.pixels[i];
    } else {
      pixels[i]=IMPOSSIBLE;
    }
  }
  updatePixels();
}

void draw() {
  loadPixels();
  if (px1_on) {
    for (int x=0; x<width-1; x+=2) {
      for (int y=0; y<height-1; y+=2) {
        updateColor( x, y);
      }
    }
  } else {
    for (int x=1; x<width-1; x+=2) {
      for (int y=1; y<height-1; y+=2) {
        updateColor( x, y);
      }
    }
  }
  px1_on=!px1_on;
  updatePixels();
}

void updateColor(int x, int y) {
  color c1=pixels[x+y*width];
  color c2=pixels[x+1+y*width];
  color c3=pixels[x+(y+1)*width];
  color c4=pixels[x+1+(y+1)*width];

  color[]result=updateBlock(c1, c2, c3, c4);
  pixels[x+y*width]=result[0];
  pixels[x+1+y*width]=result[1];
  pixels[x+(y+1)*width]=result[2];
  pixels[x+1+(y+1)*width]=result[3];
}

boolean matchPattern(color[]cls, boolean[]bs) {
  for (int i=0; i<4; i++) {
    if ((cls[i]!=IMPOSSIBLE) != bs[i]) {
      return false;
    }
  }
  return true;
}

color[]updateBlock(color c1, color c2, color c3, color c4) {
  color[]cls={c1, c2, c3, c4};
  if (matchPattern(cls, new boolean[]{false, false, false, false})) {
    return new color[]{IMPOSSIBLE, IMPOSSIBLE, IMPOSSIBLE, IMPOSSIBLE};
  } else if (c3!=IMPOSSIBLE && c4 !=IMPOSSIBLE) {
    return new color[]{c1, c2, c3, c4};
  } else if (matchPattern(cls, new boolean[]{true, true, false, true})) {  
    return new color[]{IMPOSSIBLE, c2, c1, c4};
  } else if (matchPattern(cls, new boolean[]{true, true, true, false})) {
    return new color[]{c1, IMPOSSIBLE, c3, c2};
  } else if (matchPattern(cls, new boolean[]{true, false, true, false})) {
    return new color[]{IMPOSSIBLE, IMPOSSIBLE, c3, c1};
  } else if (matchPattern(cls, new boolean[]{false, true, false, true})) {
    return new color[]{IMPOSSIBLE, IMPOSSIBLE, c2, c4};
  } else if (matchPattern(cls, new boolean[]{true, true, false, false})) {
    if (random(1)<0.35) {
      return new color[]{IMPOSSIBLE, IMPOSSIBLE, c1, c2};
    } else {
      return new color[]{c1, c2, IMPOSSIBLE, IMPOSSIBLE};
    }
  } else if (c1!=IMPOSSIBLE) {
    return new color[]{IMPOSSIBLE, IMPOSSIBLE, c1, IMPOSSIBLE};
  } else if (c2!=IMPOSSIBLE) {
    return new color[]{IMPOSSIBLE, IMPOSSIBLE, IMPOSSIBLE, c2};
  } else {
    return new color[]{c1, c2, c3, c4};
  }
}
