 //declare bacteria variables here  
boolean jhoey = false;
Bacteria[] joe;
 void setup()   
 {
   size(400,400);
   joe = new Bacteria[20];
   background(255);
  
   for(int i = 0; i < joe.length; i++){
     joe[i]=new Bacteria(2*100,2*100);
   }
 
 
 }   
 void draw()   
 {
   background(255);
   for(int i = 0; i < joe.length; i++){
     
     joe[i].show();
     if(mousePressed == true){
       joe[i].move(false, mouseX, mouseY);
     } else{
       joe[i].move(true, 0, 0);
     }
   }
 }  
 void mouseClicked(){
   
   
   
 }
 class Bacteria    
 {
   int myX, myY, myColor, mySize;
   Bacteria(int x, int y){
     myX = x;
     myY = y;
     myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
     
   }
   void move(boolean mose, int x, int y)
   {
     if(mose==true){
       myX+=((int)(Math.random()*13)-6);
       myY+=((int)(Math.random()*13)-6);
       if (myX>=400){
         myX-=((int)(Math.random()*5*2)+1*2);
       } else if (myX<=0){
         myX+=((int)(Math.random()*5*2)+1*2);
       }
       if (myY>=400){
         myY-=((int)(Math.random()*5*2)+1*2);
       } else if (myY<=0){
         myY+=((int)(Math.random()*5*2)+1*2);
       }
     } else {
       if(x > myX){
         myX+=((int)(Math.random()*6*2)-2*2);
       } else if (x<myX){
         myX-=((int)(Math.random()*6*2)-2*2);
       } else{
         myX+=((int)(Math.random()*7*2)-3*2);
       }
       if(y > myY){
         myY += ((int)(Math.random()*6*2)-2*2);
       }else if (y<myY){
         myY -= ((int)(Math.random()*6*2)-2*2);
       }else{
         myY+=((int)(Math.random()*7*2)-3*2);
       }
     }
   }
   void toMouse(){
    
   }
   void show()
   {
     fill(myColor);
     ellipse(myX, myY, 10,10);
   }
 }    
