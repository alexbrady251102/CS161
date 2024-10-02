PImage img;

//player 
int playerXCor = 600;
int playerYCor = 590;
int playerWidth = 25;
int playerHeight = 55;
//meteor
int difficulty = 10;
int limit = 8;
double score = 0;
Meteor[] meteor;
boolean isCollided = false;


void initMeteor(int xMin, int xMax, int yMin, int yMax, int num){
  meteor = new Meteor[num];
 //positioning of the meteors       
  for(int i = 0; i < meteor.length; i++){
     int x = (int)random(xMin, xMax);
     int y = (int)random(yMin, yMax);
     meteor[i] = new Meteor(x, y, 40, 25);
  }
}

void setup(){
  //fullScreen();
  size(1280,720);
  //rameRate(60);
  img = loadImage("bg.png");
  initMeteor(-100, width + 20, -250, -80, difficulty);

  
}

void draw(){
  
  image(img,0,0); // Using instead of background();
  drawPlayer();
  //checks to see if collision happened if no the game continues
  if(!isCollided){
    moveMeteor();
    if(score > limit && score < limit + 8){
      initMeteor(-100, width + 20, -260, -80, difficulty); difficulty += 8; limit += 20;
    }
  }
  //else yes the game ends 
 else{
   
   fill(255,110,199);
   text("GAMEOVER           Score: "+(int)score, 400, 100); //end of game text
 }

  
}

void moveMeteor(){
      for(int i = 0; i < meteor.length; i++){
        if(meteor[i].yCor > height){
           meteor[i].yCor = -20;
        }
        meteor[i].display();                //taken from meteors tab
        meteor[i].drop(random(5, 15));      //taken from meteors tab
   //collision checking 
   // should be in its own loop but causes game to slow down
        boolean conditionXLeft = meteor[i].xCor + meteor[i].w >= playerXCor;
        boolean conditionXRight = meteor[i].xCor + meteor[i].w <= playerXCor + playerWidth + 4;
        boolean conditionUp =  meteor[i].yCor >= playerYCor;
        boolean conditionDown = meteor[i].yCor + meteor[i].h <= playerYCor + playerHeight;
      
        if(conditionXLeft && conditionXRight && conditionUp && conditionDown){
             isCollided = true;
             
        }
  
      }
     
   //score counter
    score += 0.1;

    fill(30, 5, 0);
    text("       Score: "+(int)score, 10, 40);
    textSize(30);
}



void drawPlayer(){
  stroke(204, 132, 0);
  strokeWeight(10);
  //shape and color of player controlled block
  fill(90, 200, 90);
  rect(playerXCor, playerYCor, playerWidth, playerHeight, 7);
}



//movement controls
void mouseDragged(){
  if(mouseX >= 0 && mouseX <= width - playerWidth + 1){
    playerXCor = mouseX;
  }
  if(mouseY >= 600 && mouseY <= height - playerHeight){
    playerYCor = mouseY;
  }
 
}
