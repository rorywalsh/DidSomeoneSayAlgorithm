//class for storing position and size of 
//textboxes so they can be faded out
class AreaWipe{
 int x, y, w, h;
 AreaWipe(int _x, int _y, int _w, int _h){
  x = _x;
  y = _y;
  h = _h;
  w = _w;
 }  
};



//this file holds different transitions and entries for slides
void fadeOutIfNeeded()
{
  if(clearPrevious!=0 && screenWipes<=fadeOutFrames){
    screenWipes++;
    //alpha blend here fades things out out each time its called
    fill(0, 0, 0, 30);
    for(int i=0;i<clearPrevious;i++){
      if(areaWipe.size()>i)
        rect(areaWipe.get(i).x, areaWipe.get(i).y, areaWipe.get(i).w, areaWipe.get(i).h); 
    }
    //showMessage(String.valueOf(screenWipes));
    
  }
  
  if(screenWipes==fadeOutFrames-1){        
    for(int i=0;i<clearPrevious;i++){
    //showMessage("removing wipe"); 
    if(areaWipe.size()>0)
    areaWipe.remove(0);
    }
    clearPrevious=0;
    screenWipes=0;
  } 
}


