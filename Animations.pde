//this file holds a few silly little visual and audio animations

void zeroAllPatterns()
{
for (int i = 0; i < 16; i++) {
	for (int j = 0; j < 16; j++) {
			drumPatterns[i][j]=0;
		}
	}
}

void playPatterns(String playback)
{
	String scoEvent="";
	int harms[] = {800, 700, 600, 500, 400, 300, 200, 100};

	//16 drums sounds and 8 note patterns
	int cols=16, rows=8;
	frameCount++;
	//our master index
	int verticalPosition=frameCount%notesToPlay;
	stroke(255);
	int xPos = width/6;
	int yPos = height/4;

	if(keyPressed){
		showScrubber=true;
		if (key == CODED) {
    		if (keyCode == UP){
    			frameRate(frameRate+1);

    		}
    		else if(keyCode == DOWN)
    			frameRate(frameRate-1);
    		else if(keyCode == LEFT){
    			if(notesToPlay>1)notesToPlay--;
    		}
    		else if(keyCode == RIGHT){
    			if(notesToPlay<16)notesToPlay++;
    		}
    	}
		else if(key==32)
			frameCount--;
		else{
			background(0);
			//run through array and generate new patterns for each drum
			for (int i = 0; i < cols; i++) {
			  for (int j = 0; j < rows; j++) {
			  	textAlign(RIGHT);
			  	if(playback=="samples"){
					fill(0, 255, 0);
					rect(xPos-150, yPos-20+(j+j*60), 100, 40);
					fill(0);
			  		drumPatterns[i][j] = (random(100)>80.0 ? 1 : 0);
			  		text("Drum "+String.valueOf(j+1), xPos-160, yPos-16+(j+j*60), 100, 40);
			  	}
			  	else if(playback=="notes"){
					fill(255, 0, 0);
					rect(xPos-150, yPos-20+(j+j*60), 100, 40);
					fill(0);
			  		drumPatterns[i][j] = (random(100)>80.0 ? 1 : 0);
			  		text("Harm_"+String.valueOf(8-j), xPos-156, yPos-16+(j+j*60), 100, 40);
			  	}


			    if(drumPatterns[i][j]==1){
				    fill(200, 200, 200);
				    ellipse(xPos+(i+i*60), yPos+(j+j*60), 20, 20);
				}
				else{
				    fill(0);
				    ellipse(xPos+(i+i*60), yPos+(j+j*60), 20, 20);				
				}
			  }
			}
		}

	}

	if(showScrubber==true){
		fill(0);
		rect(50, 50, 700, 150);
		stroke(0);
		if(playback=="samples")
			fill(255, 0, 0);
		else 
			fill(0, 255, 0);	
		textSize(50);
		textAlign(CENTER);
		text("Random Patterns", 50, 50, 400, 100);
		textSize(22);
		text("LEFT and RIGHT reduce length of pattern. UP/DOWN keys speed up and slow down pattern. SPACE key repeats. All other keys cause a change of pattern to happen", 50, 100, 700, 100);
	}

	//now run through each entire colum one by one and play the drum if
	  		for (int i = 0; i < cols; i++) {
	  			//String mess = "DrumTrack:"+String.valueOf(j)+ " "+String.valueOf(drumPatterns[i][j]);
	  			if(drumPatterns[verticalPosition][i]==1){
	  				if(playback=="samples"){
		  				scoEvent = "i100 0 1.8 "+String.valueOf(i+100);
		  				cs.event(scoEvent); 
	  				}
		  			else if (playback=="notes"){
		  				scoEvent = "i15 0 .5 "+String.valueOf(harms[i])+" "+String.valueOf(.6*(800-harms[i])/800);
		  				cs.event(scoEvent); 
		  			}

		  			
	  			}

	  		for(int index=0;index<cols;index++){
                 if(showScrubber==true){
	      				fill(0, 0, 0, 0);
	      				if(verticalPosition==index){
	      					if(playback=="samples")
	      						stroke(0, 255, 0);
	      					else 
	      						stroke(255, 0, 0);
	      				}
	      				else
	      					stroke(0, 0, 0);
	      				rect(xPos-23+(index+index*60), yPos-30, 46, 500);
  		  			}
                }

	}	



}


void cycleThroughChords()
{
	int one[] = {60, 64, 67, 72}; //major triad
	int two[] = {62, 65, 69, 74}; //minor triad
	int four[] = {65, 69, 72, 77}; //major traid
	int five[] = {67, 62, 71, 79}; //major triad
	int six[] = {55, 57, 60, 69}; //minor triad

	color col = color(255, 255, 255, 30); 
	float angle = 1.4;
	int noteIndex = (int)random(4);
	int modulate=0;
	angle = random(TWO_PI);
	if(!keyPressed){
		strokeWeight(1);
		//fade out previous lines if key is held
		fill(0, 0, 0, 20);
		rect(-width, -height, width*2, height*2);  	
		modulate=0;	
	}
	else{
		strokeWeight(4);
		modulate = 12; //take us up an octave
	}


    if(key=='2'){
	  String scoEvent = "i10 0 2 "+String.valueOf(two[noteIndex]+modulate)+" 0.5 "+random(.5)+.5;
	  cs.event(scoEvent); 
	  col = color(200, 100, 0, 40); 
    }
    else if(key=='4'){
	  String scoEvent = "i10 0 2 "+String.valueOf(four[noteIndex]+modulate)+" 0.5 "+random(.5)+.5;
	  cs.event(scoEvent); 
	  col = color(100, 200, 100, 40);
    }
    else if(key=='5'){
	  String scoEvent = "i10 0 2 "+String.valueOf(five[noteIndex]+modulate)+" 0.5 "+random(.5)+.5;
	  cs.event(scoEvent);  
	  col = color(100, 100, 200, 40);     	 
    }
    else if(key=='6'){
	  String scoEvent = "i10 0 2 "+String.valueOf(six[noteIndex]+modulate)+" 0.5 "+random(.5)+.5;
	  cs.event(scoEvent);  
	  col = color(100, 200, 200, 40);     	 
    }
    else{//1 or any other key...
	  String scoEvent = "i10 0 2 "+String.valueOf(one[noteIndex]+modulate)+" 0.5 "+random(.5)+.5;
	  cs.event(scoEvent);
	  col = color(255, 255, 255, 30); 
    }

	stroke(col);
	fill(200, 200, 200);
	translate(width/2+500,height/2);
	rotate(angle);
	//translate lines
	translate(-width/2,-height/2);
	for( int i = 0; i<width+500; i++) {
	    line(rainPos[i], i* 20, rainPos[i] + rainSpeed[i]*10, i * 20 );
	    rainPos[i] += rainSpeed[i];
	    rainPos[i] = rainPos[i] % width;
	}  
}

void playRandNotes(int version)
{
  frameCount++; 
  if(version==1)
  {
	  int notes[] = {60, 62, 64, 65, 67, 69, 71, 72};
	  if(frameCount%35==0){
	  stroke(0, 0, 0, 0);
	  drawTextBox(500, 140, 600, 300, 24, RIGHT, color(200, 200, 200), slide26); 
	  photo = loadImage("uniformDistTable.png");
	  image(photo, 70, 260, 800, 650); 
	  int note = (int)random(8);
	  fill(0, 0, 200);
	  setGradient(172+(note*77), 373, 77/2, 471, color(0, 255, 100, 0), color(0, 255, 100, 255), 2);
	  setGradient(172+(note*77)+(int)77/2, 373, 77/2, 471, color(0, 255, 100, 255), color(0, 255, 100, 0), 2);
	  String scoEvent = "i10 0 2 "+notes[note]+" "+x/width+" "+random(.5)+.5;
	  cs.event(scoEvent);   
	  }
  }
  else if(version==2)
  {
	  int notes[] = {60, 60, 60, 64, 60, 69, 60, 64};
	  if(frameCount%35==0){
	  stroke(0, 0, 0, 0);
	  drawTextBox(500, 140, 600, 300, 24, RIGHT, color(200, 200, 200), slide28); 
	  photo = loadImage("weightedDistTable.png");
	  image(photo, 70, 300, 800, 650); 
	  int note = (int)random(8);
	  fill(0, 0, 200);
	  setGradient(172+(note*77), 412, 77/2, 471, color(0, 100, 200, 0), color(0, 100, 200, 255), 2);
	  setGradient(172+(note*77)+(int)77/2, 412, 77/2, 471, color(0, 100, 200, 255), color(0, 100, 200, 0), 2);
	  String scoEvent = "i10 0 2 "+notes[note]+" "+x/width+" "+random(.5)+.5;
	  cs.event(scoEvent);   
	  }
  } 

}

void playRandomSamples1()
{
  frameCount++; 
  if(frameCount%35==0){
	  String scoEvent = "i12 0 2 "+String.valueOf((int)random(7)+3);
	  cs.event(scoEvent);
	}
}

void printRandomToScreen()
{
  textSize(20+random(20));
  fill(random(255), random(255), random(255)); 
  text("Random", random(width), random(height), 180, 100); 
  String scoEvent = "i11 0 "+random(0.25)+1+" 2 0";
  cs.event(scoEvent);
}

//simple ball bounce
void ballBounce()
{
  // Update the position of the shape
  background(0);
  textAlign(RIGHT);
  textSize(24);
  ballXpos = ballXpos + ( 10.0 * xDir );
  ballYpos = ballYpos + ( 10.0 * yDir );  
  if (ballXpos > width-60 || ballXpos < 60) {
    xDir *= -1;
    smoothSine=1;
    R = int(random(255));
    G = int(random(255));
    B = int(random(255));
    String scoEvent = "i10 0 3 "+random(500)+100+" 0 .5";
    cs.event(scoEvent);
  }
  if (ballYpos > height-60 || ballYpos < 60) {
    yDir *= -1;
    smoothSine=1;
    R = int(random(255));
    G = int(random(255));
    B = int(random(255));
    String scoEvent = "i10 0 3 "+random(500)+100+" 0 .5";
    cs.event(scoEvent);
  }
  
  fill(R+smoothSine, G+smoothSine, B+smoothSine);
  text("One even made its way into this slide...", 690, 340, 400, 144); 
  smoothSine-=1;
  ellipse(ballXpos, ballYpos, 60, 60);  
}


void showTypesOfDistributionCurves(int index)
{
  if(index<14){
  fill(0);
  rect(0, 0, width, height);
  fill(200);
  String str = "Probability distributions provide clever ways to generate pseudo random events, and for the most part, they are easy to implement in any language. Apart from the three simplest types shown here, there are many more distributions which can all be used to create interesting data.";
  if(index==0)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, "); 
  if(index==1)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, Gaussian, "); 
  if(index==2)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, Gaussian, Geometric,"); 
  if(index==3)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, Gaussian, Geometric, Gamma,"); 
  if(index==4)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, Gaussian, Geometric, Gamma, Lomax,"); 
  if(index==5)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, Gaussian, Geometric, Gamma, Lomax, Laplace,"); 
  if(index==6)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, Gaussian, Geometric, Gamma, Lomax, Laplace, Hyper-geometric,"); 
  if(index==7)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, Gaussian, Geometric, Gamma, Lomax, Laplace, Hyper-geometric, Weibull,"); 
  if(index==8)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, Gaussian, Geometric, Gamma, Lomax, Laplace, Hyper-geometric, Weibull, Rayleigh,"); 
  if(index==9)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, Gaussian, Geometric, Gamma, Lomax, Laplace, Hyper-geometric, Weibull, Rayleigh, Pareto II,"); 
  if(index==10)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, Gaussian, Geometric, Gamma, Lomax, Laplace, Hyper-geometric, Weibull, Rayleigh, Pareto II, Non-central Chi-Square,");         
  if(index==11)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, Gaussian, Geometric, Gamma, Lomax, Laplace, Hyper-geometric, Weibull, Rayleigh, Pareto II, Non-central Chi-Square, Convex,");         
  if(index==12)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, Gaussian, Geometric, Gamma, Lomax, Laplace, Hyper-geometric, Weibull, Rayleigh, Pareto II, Non-central Chi-Square, Convex, etc.,");         
  if(index==13)
        drawTextBox(100, 140, 600, 700, 24, LEFT, color(200, 200, 200), str+" Concave, Gaussian, Geometric, Gamma, Lomax, Laplace, Hyper-geometric, Weibull, Rayleigh, Pareto II, Non-central Chi-Square, Convex, etc., etc.");         
  }      
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis )
{
 int Y_AXIS = 1;
 int X_AXIS = 2;
  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
