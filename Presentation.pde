import csoundo.*;
Csoundo cs;
PFont f;
PImage photo;
int mouseClickCount=43, right_mouseClickCount=0, clearPrevious=0, screenWipes=0;
int textIndex=-1, ballBounce=0, xDir=1, yDir=1, currentKey=0, notesToPlay=8;
boolean showScrubber=false;
float smoothSine=0.0;
float ballXpos, ballYpos, x, y;
int R=255, G=255, B=255;
int fadeOutFrames=30, frameCount=0, typeIndex=0, textX=0, textY=0;
//array of AreaWipe classes
ArrayList<AreaWipe> areaWipe;
int[][] drumPatterns = new int[16][16];
int[] rainSpeed;
int[] rainPos;

//setup routine
void setup() {
  size(displayWidth, displayHeight);
  areaWipe = new ArrayList<AreaWipe>();  
  smooth();
  printArray(PFont.list());
  f = createFont("Georgia", 24);
  textFont(f);
  background(0);
  frameRate(35);
  ellipseMode(RADIUS);
  stroke(0, 0, 0, 0);
  textAlign(RIGHT);
  ballXpos = width/2;
  ballYpos = height/2;
  cs = new Csoundo(this, "Presentation.csd");
  cs.run();

  rainSpeed = new int[displayWidth+500];
  rainPos = new int[displayWidth+500];
  for( int i = 0; i<displayWidth+500; i++) {
    rainSpeed[i] = int(random(10, 30));
    rainPos[i] = int(random(0,displayWidth+500));
  }  
}

//main drawing loop
void draw() {
 fadeOutIfNeeded();

  switch(mouseClickCount){
    case 0:       //did someone say algorithm
      drawTextBox(textX, textY, 400, 200, 44, RIGHT, color(200, 200, 200), slide1);
      break;
    case 1:       //Generative algorithms can be found at the core
      typeTextBox(textX, textY, 600, 400, 24, LEFT, color(200, 200, 200), slide2); 
      break;
    case 2:       //"Most artists already work in a generative
      typeTextBox(textX, textY, 500, 200, 24, LEFT, color(200, 200, 200), slide3); 
      break;
    case 3:       //"In the course of this presentation we will take a
      typeTextBox(500, 180, 540, 204, 24, RIGHT, color(200, 200, 200), slide4);
      typeTextBox(200, 480, 700, 344, 24, LEFT, color(200, 200, 200), slide5); 
      break;
    case 5:       //"What is an algorithm?"
      drawTextBox(600, 90, 500, 44, 32, RIGHT, color(255, 0, 0), slide6); 
      break;
    case 6:       //"An algorithm can be defined simply as a set of instructions
      drawTextBox(500, 140, 600, 244, 24, RIGHT, color(200, 200, 200), slide7); 
      break;
    case 7:       //"One even made its way into this slide..."
      drawTextBox(690, 340, 400, 144, 24, RIGHT, color(255, 0, 0), slide8); 
      break; 
    case 8:       //bouncing ball example..
      ballBounce();
      break;
    case 9:       //"Probabilities"
      drawTextBox(200, 360, 500, 100, 32, LEFT, color(255, 0, 0), slide9);  
      break;
    case 10:      //"Probabilities are usually defined as the measure of the
      drawTextBox(200, 540, 600, 400, 22, LEFT, color(200, 200, 200), slide10); 
      break;
    case 11:      //"Random number generators are commonly used to return a
      drawTextBox(500, 140, 600, 300, 24, RIGHT, color(200, 200, 200), slide11); 
      break;
    case 12:
      frameRate(5);
      playRandomSamples1();
      break;
    case 13:      //"By using different ‘distributions’ we can determine the probability
      frameRate(35);
      drawTextBox(510, 480, 600, 400, 24, LEFT, color(200, 200, 200), slide12); 
      break;
    case 14:      //"Uniform distribution is often abbreviated to U(a, b), where
      drawTextBox(100, 140, 600, 400, 24, LEFT, color(200, 200, 200), slide13); 
      break;
    case 15:
      photo = loadImage("uniformDistPlot.png");
      image(photo, 300, 180);
      break;
    case 16:      //"Virtually all computer programming languages feature random
      drawTextBox(500, 105, 500, 180, 24, LEFT, color(200, 200, 200), slide14); 
      break;
    case 17:      //"This code uses the output from the randomUniform() function to position
      drawTextBox(90, 290, 400, 600, 24, RIGHT, color(200, 200, 200), slide15); 
      photo = loadImage("uniformDistCode.png");
      image(photo, 500, 290);  
      break;
    case 18:
      frameRate(5);
      drawUniformDist();
      break;
    case 19:
      frameRate(35);
      break;
    case 20:      //"While uniform distribution can yield interesting results, weighting the results
      drawTextBox(530, 40, 700, 300, 24, RIGHT, color(200, 200, 200), slide16); 
      break;
    case 21:
      photo = loadImage("linearDistPlot.png");
      image(photo, 190, 200);
      break;
    case 22:      //"This code does pretty much the same as the last but selects its   
      drawTextBox( 90, 290, 400, 200, 24, RIGHT, color(200, 200, 200), slide17); 
      photo = loadImage("linearDistCode.png");
      image(photo, 500, 290);
      break;
    case 23:
      frameRate(5);
      drawLinearDist();
      break;
    case 24:
      frameRate(35);      //"And finally we have exponential distribution. This 
      drawTextBox(100, 140, 600, 400, 24, LEFT, color(200, 200, 200), slide18); 
      break;
    case 25:      //"We can see how different values of lambda affect the outcome of the
      drawTextBox(380, 140, 800, 400, 24, RIGHT, color(200, 200, 200), slide19);
      photo = loadImage("exponDistPlot.png");
      image(photo, 110, 180); 
      break;
    case 26:      //"The code for an exponential distribution function can be written as"
      drawTextBox(90, 190, 500, 200, 24, LEFT, color(200, 200, 200), slide20); 
      photo = loadImage("exponDistCode.png");
      image(photo, 390, 235);
      break;
    case 27:
      frameRate(5);
      drawLinearDist();
      break;
    case 28:
      break;
    case 29:
      frameRate(35);           //"Putting it all together.."
      drawTextBox(500, 70, 700, 70, 32, RIGHT, color(255, 0, 0), slide21); 
                      //"So how they look like when they are all together? In this next 
      drawTextBox(500, 150, 700, 400, 24, RIGHT, color(200, 200, 200), slide22); 
      break;
    case 30:
      frameRate(5);
      drawAllThreeDistibutionCurves();
      break;
    case 31:
      frameRate(35);
      break;
    case 32:      //"Probability distributions provide clever ways to generate
      drawTextBox(100, 140, 600, 400, 24, LEFT, color(200, 200, 200), slide23); 
      break;
    case 33:
      frameRate(5);
      if(frameCount%7==0){
        showTypesOfDistributionCurves(typeIndex);
      }
      frameCount++; 
      break;
    case 34:
      break;
    case 35:
      frameRate(35);
                  //"The previous examples illustrate how easy it is to generate
      drawTextBox(600, 140, 600, 400, 24, RIGHT, color(200, 200, 200),  slide24);  
      break;
    case 36:
      frameRate(5);
      frameCount++; 
      if(frameCount%2==0)
        printRandomToScreen();
      break;
    case 37:      //"Thankfully it’s not difficult to exert control over the data
      frameRate(35);
      drawTextBox(100, 140, 600, 400, 24, LEFT, color(200, 200, 200), slide25); 
      break; 
    case 38:      //The following graph shows a table full of MIDI notes,
      drawTextBox(500, 140, 600, 300, 24, RIGHT, color(200, 200, 200), slide26); 
      photo = loadImage("uniformDistTable.png");
      image(photo, 70, 260, 800, 650);  
      break;
    case 39:
      playRandNotes(1);
      break;
    case 40:    //To gain even more control we can use as a ‘cumulative’ 
      drawTextBox(100, 140, 600, 300, 24, LEFT, color(200, 200, 200), slide27); 
      break;
    case 41:    //This graph shows a table full of MIDI notes but unlike
      drawTextBox(500, 140, 600, 300, 24, RIGHT, color(200, 200, 200), slide28); 
      photo = loadImage("weightedDistTable.png");
      image(photo, 70, 300, 800, 650);  
      break;   
    case 42:
      playRandNotes(2);
      break; 
    case 43:
      frameRate(35);
      drawTextBox(textX, textY, 600, 300, 24, LEFT, color(200, 200, 200), slide29); 
      break;
    case 44:
      drawTextBox(textX, textY, 600, 300, 24, LEFT, color(200, 200, 200), slide30); 
      break;  
    case 45:
      frameRate(5);
      cycleThroughChords();
      break;
    case 46:
      break;
    case 47:
      frameRate(35);
      drawTextBox(textX, textY, 600, 300, 24, LEFT, color(200, 200, 200), slide31); 
      break;      
    case 48:
      playPatterns("samples");
      break;
    case 49:
      break; 
    case 50:
      showScrubber=false;
      notesToPlay=16;
      zeroAllPatterns();
      frameRate(35);
      drawTextBox(textX, textY, 600, 300, 24, LEFT, color(200, 200, 200), slide32); 
      break;    
    case 51:
      playPatterns("notes");
      break; 
    default:  
  }
  
}

//once off functions are triggered in here. 
void mouseClicked() 
{
  //reset type index on each click
  typeIndex=0;
  //generate random positions for text boxes. 
  textX=(int)random(600);
  textY=(int)random(600);

  //increment mouse clicks
  if(mouseButton == LEFT)
    mouseClickCount++;
  else
   right_mouseClickCount++;
  right_mouseClickCount = (right_mouseClickCount>2 ? 0 : right_mouseClickCount++);
  switch(mouseClickCount)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 13:
    case 14:
    case 17:
    case 36:
    case 38:
    case 41:
    case 44:
      clearPrevious=1;
      break;
    case 5:
      areaWipe.clear();
      background(0);
      break;
    case 8:
      areaWipe.clear();
      break;
    case 11:
      clearPrevious=2;
      break;
 
    case 9:
    case 16:
    case 22:
    case 20:
    case 24:
    case 25:
    case 29:
    case 32:
    case 34:
    case 37:
    case 40:
    case 26:
    case 35: 
    case 43:
    case 45:
    case 46:
    case 47:
    case 49:
    case 50:
      background(0);    
      stroke(0);
      areaWipe.clear();          
      break;
    case 48:
      background(0);    
      stroke(0);
      frameRate(5);
      break;
    case 51:
      background(0);    
      stroke(0);
      frameRate(8);  
      break;
    default:
  
  }     
}


//make sure sketch runs in fullscreen
boolean sketchFullScreen()
{
  return true;
}




