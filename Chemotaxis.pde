 //declare bacteria variables here  
boolean jhoey = false;
Bacteria[] joe;
Bacteria enemy;
int joeX, bacX, bacY;
 void setup()   
 {
   size(400,400);
   joe = new Bacteria[20];
   background(255);
   frameRate(25);
   for(int i = 0; i < joe.length; i++){
     joe[i]=new Bacteria(2*100,2*100,color(0,0,216), true);
   }
   enemy = new Bacteria(25,25, color(255,255,0), true);
 
 
 }   
 void draw()   
 {
   background(0);
   joeX = joe[(int)(Math.random()*20)].myX;
   enemy.eat(40, joeX);
   enemy.move(1, joeX ,joe[(int)(Math.random()*20)].myY);
   for(int i = 0; i < joe.length; i++){
     
     joe[i].show(20);
     joe[i].tentacle();
     joe[i].eyes();
     if(mousePressed == true){
       joe[i].move(1, mouseX, mouseY);
     } else{
       joe[i].move(0, 0, 0);
     }
     bacX=joe[i].myX-enemy.myX;
     bacY=joe[i].myY-enemy.myY;
     if(bacX<=10&&bacY<=10){
       joe[i].alive = false;
       joe[i].myColor=0;
     }
   }
   
   
 }  

 class Bacteria    
 {
   int myX, myY, myColor, mySize;
   boolean alive;
   Bacteria(int x, int y, int col, boolean live){
     myX = x;
     myY = y;
     myColor = col;
     alive = live;
     
   }
   void move(int mose, int x, int y)
   {
     if(mose==0){
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
     } else if(mose==1){
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
   
   
   void show(int siz)
   {
     if(alive == true){
       noStroke();
       fill(myColor);
       ellipse(myX, myY, siz,siz);
     }
   }
   void tentacle(){
     if(alive==true){
       noStroke();
       fill(myColor);
       rect(myX-10,myY,20,10);
       triangle(myX-10,myY+10,myX-3.33,myY+10,myX-6.66,myY+15);
       triangle(myX-3.33,myY+10,myX+3.33,myY+10,myX,myY+15);
       triangle(myX+3.33,myY+10,myX+10,myY+10,myX+6.66,myY+15);
     }  
   }
   void eyes(){
     fill(255);
     ellipse(myX-4,myY,5,5);
     ellipse(myX+4,myY,5,5);
   }
   void eat(int siz, int x)
   {
     noStroke();
     fill(myColor);
     if(x>myX){
       if(frameCount%12<=3){
         arc(myX,myY,siz,siz,(PI/4),PI*7/4);
       } else if(frameCount%6<=4){
         arc(myX,myY,siz,siz,(PI/6),PI*11/6);
       } else if(frameCount%6<=5){
         arc(myX,myY,siz,siz,0,2*PI);
       }
     } else if(x<myX){
       if(frameCount%6<=1){
         arc(myX,myY,siz,siz,PI*5/4,(PI*11/4));
       } else if(frameCount%6<=4){
         arc(myX,myY,siz,siz,PI*7/6,(PI*17/6));
       } else if(frameCount%6<=5){
         arc(myX,myY,siz,siz,0,2*PI);
       }
     }
   }
 }    
