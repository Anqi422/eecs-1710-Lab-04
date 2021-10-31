int gameScreen = 0;
int ballX, ballY;
int ballSize= 20;
int ballColor = color(100);
float gravity = 1;
float ballSpeedVert = 0;
float airfriction = 0.0001;
float friction = 0.1;
color racketColor = color(100);
float racketWidth = 100;
float racketHeight = 10;
int racketBounceRate = 20;
float ballSpeedHorizon = 3;

void setup() {
  size(500, 500);
  ballX=width/4;
  ballY=height/5;
}

void draw() {
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } 
}

void initScreen() {
  background(90,180,100);
  textAlign(CENTER);
  text("Click to Play", height/2, width/2);
}
void gameScreen() {
  background(90,150,100);
  drawBall();
  applyGravity();
  applyHorizontalSpeed();
  keepInScreen();
  drawRacket();
  watchRacketBounce();
}
public void mousePressed() {
  if (gameScreen==0) {
    startGame();
  }
}
void startGame() {
  gameScreen=1;
}
void drawBall() {
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
}
void applyGravity() {
  ballSpeedVert += gravity;
  ballY += ballSpeedVert;
  ballSpeedVert -= (ballSpeedVert * airfriction);
}
void makeBounceBottom(int surface) {
  ballY = surface-(ballSize/2);
  ballSpeedVert*=-1;
  ballSpeedVert -= (ballSpeedVert * friction);
}
void makeBounceTop(int surface) {
  ballY = surface+(ballSize/2);
  ballSpeedVert*=-1;
  ballSpeedVert -= (ballSpeedVert * friction);
}
void applyHorizontalSpeed(){
  ballX += ballSpeedHorizon;
  ballSpeedHorizon -= (ballSpeedHorizon * airfriction);
}
void makeBounceLeft(int surface){
  ballX = surface+(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}
void makeBounceRight(int surface){
  ballX = surface-(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}
void keepInScreen() {
  if (ballY+(ballSize/2) > height) { 
    makeBounceBottom(height);
  }
  if (ballY-(ballSize/2) < 0) {
    makeBounceTop(0);
  }
  if (ballX-(ballSize/2) < 0){
    makeBounceLeft(0);
  }
  if (ballX+(ballSize/2) > width){
    makeBounceRight(width);
  }
}
void drawRacket(){
  fill(racketColor);
  rectMode(CENTER);
  rect(mouseX, mouseY, racketWidth, racketHeight);
}
void watchRacketBounce() {
  float overhead = mouseY - pmouseY;
  if ((ballX+(ballSize/2) > mouseX-(racketWidth/2)) && (ballX-(ballSize/2) < mouseX+(racketWidth/2))) {
    if (dist(ballX, ballY, ballX, mouseY)<=(ballSize/2)+abs(overhead)) {
      makeBounceBottom(mouseY);
      if (overhead<0) {
        ballY+=overhead;
        ballSpeedVert+=overhead;
        ballSpeedHorizon = (ballX - mouseX)/5;
        }
    }
  }
}
