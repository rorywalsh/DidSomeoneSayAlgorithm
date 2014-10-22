//this file holds all the code used for drawing the simple random distributions

void drawUniformDist()
{
    x = randomUniform(width);
    y = randomUniform(height);  
    float amp = random(1);
    fill(255, (x/width) * 255, 0, (y/height) * 255);    
    ellipse(x,y, amp*80, amp*80); 
    fill(0, 0, 0, 20);
    rect(0, 0, width, height); 
    y = ((y/height)*60)+40;//scale and make MIDI note
    String scoEvent = "i10 0 1 "+String.valueOf(y)+" "+String.valueOf(x/width)+" "+random(1);
    cs.event(scoEvent);   
}

float randomUniform(float range)
{
  return random(range);   
}

void drawLinearDist()
{
    x = randomLinear(width);
    y = randomLinear(height);
    float amp = random(1);  
    fill(255, (x/width) * 255, 0, (y/height) * 255);    
    ellipse(x,y, amp*80, amp*80); 
    fill(0, 0, 0, 10);
    rect(0, 0, width, height);
    y = ((y/height)*60)+40;//scale and make MIDI note 
    String scoEvent = "i10 0 1 "+String.valueOf(y)+" "+String.valueOf(x/width)+" "+random(1);
    cs.event(scoEvent);      
}

float randomLinear(float range)
{
   float a,b;
   a = random(range);
   b = random(range);
   if(a<b)
     return a;
   else
     return b;
}

void drawExponDist()
{
    x = randomExpon(width, .1);
    y = randomExpon(height, .1);  
    float amp = random(1);
    fill(255, (x/width) * 255, 0, (y/height) * 255);    
    ellipse(x,y, amp*80, amp*80); 
    fill(0, 0, 0, 10);
    rect(0, 0, width, height); 
    y = ((y/height)*60)+40;//scale and make MIDI note
    String scoEvent = "i10 0 1 "+String.valueOf((int)y)+" "+String.valueOf(x/width)+" "+random(1);
    cs.event(scoEvent);      
}

float randomExpon(float lambda, float range)
{
  float a, b, result;
  a = random(100)/100;
  b = a / lambda;
  result = abs(log(b));
  return result*(range/(1/lambda));  
}

void drawAllThreeDistibutionCurves()
{
  int scaleR=0, scaleG=0, scaleB=0;  
  if(right_mouseClickCount==0){
      x = randomUniform(width);
      y = randomUniform(height);
      scaleR = 480;
      scaleG = 180;
      scaleB = 800;
    }
    else if(right_mouseClickCount==1){
      x = randomLinear(width);
      y = randomLinear(height); 
      scaleR = 600;
      scaleG = 0;
      scaleB = 380;    
    }
    else if(right_mouseClickCount==2){
      x = randomExpon(.5, width);
      y = randomExpon(.5, height);
      scaleR = 1000;
      scaleG = 400;
      scaleB = 780;
      strokeWeight(2);     
    }
   
    float amp = random(1);
    fill(255, (x/scaleR) * 255, scaleG, (y/scaleB) * 255);  
    ellipse(x,y, amp*80, amp*80); 
    fill(0, 0, 0, 10);
    rect(0, 0, width, height); 
    y = ((y/height)*60)+40;//scale and make MIDI note
    String scoEvent = "i10 0 1 "+String.valueOf((int)y)+" "+String.valueOf(x/width)+" "+random(1);
    cs.event(scoEvent);   

    right_mouseClickCount = (right_mouseClickCount>2 ? 0 : right_mouseClickCount++); 
 
}
