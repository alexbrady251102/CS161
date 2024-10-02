//meteor specifications and class
public class Meteor{

   int xCor;
   int yCor;
   int w;
   int h;

  Meteor( int xVal,int yVal, int wVal, int hVal){
    xCor = xVal;
    yCor = yVal;
    w = wVal;
    h = hVal;
    
  } 
  //falling parameters
  public void drop(double speed){
    yCor += speed;
  }
  //disyplay function
  public void display(){
    fill(0, 9, 0);
    rect(xCor, yCor,w,h,5);
  }
}
