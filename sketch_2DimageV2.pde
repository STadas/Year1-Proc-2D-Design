//This is a logo of a fictional organization in the Neon Genesis Evangelion franchise. NOT my design.
void setup()
{
  size(600,600);
}

//Starting colours
int colour1=255;
int colour2=0;

void draw()
{
  //Setting up colours, width, fill, default eyes X coordinates
  background(colour1);
  strokeWeight(5);
  stroke(colour2);
  float leftEX=width*0.22;
  float rightEX=width*0.78;
  
  //Horizontal line at the top, vertical in the middle
  line(width*0.1, height*0.15, width*0.9, height*0.15);
  line(width/2, height*0.15, width/2, height*0.85);
  
  float yy;
  float xx;
  //Drawing left eyes (3)
  float y1=163;
  float y2=315;
  float y3=11;
  for(int i=0; i<3; i++)
  {
    //Countermeasure to iris disappearing when the cursor is aligned with its Y or X coordinates
    yy=-y1+mouseY;
    xx=-leftEX+mouseX;
    if(yy==0)
      yy=0.1;
    if(xx==0)
      xx=0.1;
    //Eyes follow the cursor
    Iris(leftEX+xx/pow(abs(xx), 0.4), y1+yy/pow(abs(yy), 0.6));
    Outlines(leftEX, y2, y3);
    y1+=90;
    y2+=90;
    y3+=90;
  }
  //Drawing right eyes (4)
  y1=163;
  y2=315;
  y3=11;
  for(int i=0; i<4; i++)
  {
    //Countermeasure to iris disappearing when the cursor is aligned with its Y or X coordinates
    yy=-y1+mouseY;
    xx=-rightEX+mouseX;
    if(yy==0)
      yy=0.1;
    if(xx==0)
      xx=0.1;
    //Eyes follow the cursor
    Iris(rightEX+xx/pow(abs(xx), 0.4), y1+yy/pow(abs(yy), 0.6));
    Outlines(rightEX, y2, y3);
    y1+=90;
    y2+=90;
    y3+=90;
  }
  //Lines between eyes of left side
  line(width*0.1, height*0.15, 91, 144);
  line(114, 185, 140, 230);
  line(165, 274, 199, 333);
  line(208, 348, width/2, height*0.85);
  //Lines between eyes of right side
  line(width*0.9, height*0.15, 509, 144);
  line(487, 185, 461, 229);
  line(436, 273, 403, 332);
  line(392, 349, width/2, height*0.85);
  //The reason why it's lines and not a triangle is because of overlapping issues
}

//Draws the iris for the eye
void Iris(float x, float y)
{
  strokeWeight(5);
  stroke(colour2);
  fill(colour1);
  ellipse(x, y, 45, 45);
}
//Draws outlines for the eye and white ones beyond it so the iris doesn't overlap eye lines
void Outlines(float x, float y1, float y2)
{
  strokeWeight(17);
  stroke(colour1);
  noFill();
  arc(x,  y1-10, 350, 350, radians(240), radians(300), OPEN);
  arc(x, y2+10, 350, 350, radians(60), radians(120), OPEN);
  stroke(colour2);
  strokeWeight(5);
  arc(x,  y1, 350, 350, radians(240), radians(300), OPEN);
  arc(x, y2, 350, 350, radians(60), radians(120), OPEN);
}
//Changes colours when mouse is clicked
void mouseClicked()
{
  if(colour1==255)
  {
    colour1=0;
    colour2=255;
  }
  else
  {
    colour1=255;
    colour2=0;
  }
}
