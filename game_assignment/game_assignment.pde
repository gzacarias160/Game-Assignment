//global variables
int paddleWidth;
int paddleHeight;
PImage space;
PImage furby;
//furby position variables
float furbyX;
float furbyY;
//furby speed
float furbyXspeed;
float furbyYspeed;
//score
int score;
void setup() {
  size(1200, 800);
   space = loadImage ("space.jpg");
  furby = loadImage ("furby.png");
  
  paddleWidth = 200;
  paddleHeight = 50;
  
  furbyX=height/2;
   furbyY=width/2;
  furbyXspeed = 3;
  furbyYspeed = 3;
  imageMode(CENTER);
}
void draw() {
  background(0);     
  image(space,400,400);
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("Score:" + score, width/2, 35);
  fill(random(255), random(255), random(255));

  rectMode(CENTER);
  rect(mouseX, height-50, paddleWidth, paddleHeight);

  //animate the variables
  furbyX= furbyX + furbyXspeed;
  furbyY= furbyY + furbyYspeed;

  //three arguements: PImage name, x, y, custom width, custom height
  image(furby, furbyX, furbyY, 50, 50);

  //check to see if furby has hit an edge
  if (furbyX <= 26 || furbyX >= width-26) {
    furbyXspeed= -furbyXspeed;
  }
  if (furbyY <= 26) {
    furbyYspeed= -furbyYspeed;
  }
  if ( furbyY > height-paddleHeight -25 && furbyX > mouseX-paddleWidth/2 && furbyX < mouseX+paddleWidth/2) {
   furbyXspeed = -furbyXspeed*1.5;
   furbyYspeed = -furbyYspeed*1.5;
    score++;
    println(score);
  }
 if (furbyY > height+35){
   furbyY=height/2;
   furbyX=width/2;
   furbyXspeed = 2;
   furbyYspeed = 2;
  score = score -1;
 }
  //check to see if the mouse has tagged the furby
  //if so add a point to score and move furby
  if (score == 30) {
    background(0);
    fill(random(255), random(255), random(255));
    textAlign(CENTER);
    textSize(30);
    text("You win!", width/2, 35);
  }
}
 //screenshot
 void keyPressed() {
  if (key == 's') {
    saveFrame("drawing-#####.png");
}
  }
