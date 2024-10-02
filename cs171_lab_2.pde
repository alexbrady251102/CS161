
int x=250;
int direction_x=2;
int y=150;
int direction_y=2;

int lives=3;
int score=0;

void setup()
{
  size(500,500);
}

void draw()
{
  background(255,255,255);
  fill(0,255,10);
  rect(0,mouseY-90,20,80);
  
  fill(255,0,0);
  ellipse(x,y,20,20);
  
  x=x+direction_x;
  if(x<10)
  {
    direction_x=-direction_x;
    x=30;
    lives--;
    if(lives==0) exit();
  }
  if(x>(height-10)) direction_x=-direction_x;
  
  y=y+direction_y;
  if(y<10)    direction_y=direction_y;
  
  if(y>(height-10))  direction_y=-direction_y;
 
  if((x<30)&&(abs(mouseY=y)<60))
 {
   direction_x=-direction_x;
   score++;
 }
 textSize(36);
 fill(0,0,255);
 text(score,20,40);
 text(lives,width-40,40);
}
