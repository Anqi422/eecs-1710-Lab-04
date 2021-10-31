class LetterGenerator {
  
  PShape a, d, z;
  ArrayList<Letter> letters;
  PVector position;
  float offset = 150;
  
  LetterGenerator(String input, float x, float y) {
    initShapes();
    position = new PVector(x, y);
    letters = new ArrayList<Letter>();
    
    for (int i=0; i<input.length(); i++) {     
      char ch = input.charAt(i);
      
      float px = position.x + ((i+1) * offset);
      float py = position.y;
      
      switch(ch) {
        case 'a':
          letters.add(new Letter(a, px, py));
          break;
        case 'd':
          letters.add(new Letter(d, px, py));
          break;
        case 'z':
          letters.add(new Letter(z, px, py));
          break;
      }
    }
    
  }

  void initShapes() {
    a = createShape();
    a.beginShape();
    a.translate(170, 10);
    a.vertex(4.288147, -3.430542);
    a.vertex(-175.81473, 353.3448);
    a.vertex(-43.739258, 220.41168);
    a.vertex(57.461426, 219.55405);
    a.vertex(177.53, 358.4906);
    a.beginContour();
    a.vertex(-40,180);
    a.vertex(0, 60);
    a.vertex(40,180);
    a.endContour();
    a.endShape(CLOSE);
    
    d = createShape();
    d.beginShape();
    d.translate(50, 10);
    d.vertex(0.0, 0.0);
    d.vertex(-11.149227, 313.036);
    d.vertex(190.40138, 240.70326);
    d.vertex(190.97429, 24.871357);
    d.beginContour();
    d.vertex(40,50);
    d.vertex(140, 50);
    d.vertex(140, 230);
    d.vertex(30, 230);
    d.endContour();
    d.endShape(CLOSE);   
    
    z = createShape();
    z.beginShape();
    z.translate(220, 0);
    z.vertex(-160.0, 0.0);
    z.vertex(51.53003, -7.718689);
    z.vertex(-168.9537, 260.16125);
    z.vertex(100.457947, 269.29675);
    z.vertex(-100.78732, 246.99829);
    z.vertex(50.65524, 0.440826);
    z.endShape(CLOSE);
  }
  
  void update() {
    //
  }
  
  void draw() {
    for (Letter letter : letters) {
      letter.run();
    }
  }
  
  void run() {
    update();
    draw();
  }

}
