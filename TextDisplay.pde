//draw a text box containing ah... text!
int alphaB=0;

void drawTextBox(int x, int y, int textWidth, int textHeight, int fontSize, int align, color col, String str)
{  
  frameCount++; 
  if(frameCount%1==0)
      typeIndex++;
  if(typeIndex<fadeOutFrames){   
  fill(0, 0, 0, 255.0*typeIndex/fadeOutFrames);
  rect(x-10, y-10, textWidth+20, textHeight+20);
  textAlign(align);
  fill(col);
  textSize(fontSize);
  text(str, x, y, textWidth, textHeight);  
  }
  if(typeIndex==40){
    areaWipe.add(new AreaWipe(x-10, y-10, textWidth+20, textHeight+20));
  }  
}

//type text into a box
void typeTextBox(int x, int y, int textWidth, int textHeight, int fontSize, int align, color col, String str)
{
  frameCount++; 
  if(frameCount%1==0)
      typeIndex++;
  if(typeIndex<str.length()){ 
    fill(0, 0, 0, 255.0*typeIndex/str.length());
    rect(x-10, y-10, textWidth+20, textHeight+20);
    textAlign(align);
    fill(col);
    textSize(fontSize);
    String subString = str.substring(0, typeIndex);
    text(subString, x, y, textWidth, textHeight);
    String scoEvent = "i10 0 .1 "+random(500)+100+" 0 .5";
    cs.event(scoEvent);
  } 
  if(typeIndex==str.length()){
    areaWipe.add(new AreaWipe(x, y, textWidth, textHeight));
    //showMessage("areaWipe added");
  }
}

//utility method to display text on screen for 
//debugging purposes
void showMessage(String message)
{
 fill(0);
 rect(0, 0, 300, 60);
 textSize(18);
 fill(200);
 text(message, 0, 0, 300, 100); 
 fill(0);  
}