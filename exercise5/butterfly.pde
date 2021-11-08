class Butterfly {
PVector position; 
PShape s; 
Butterfly() {
position = new PVector(random(width), height);
s = loadShape("butterfly.png");

}
void goUp() {
position.y = position.y - 1;
}
void goDown() {
position.y = position.y + 1;
}
void draw() {
shape(s, position.x, position.y);
} 

}
