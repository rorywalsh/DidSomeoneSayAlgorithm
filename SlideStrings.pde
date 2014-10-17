String slide1 = "Did someone say Algorithm?";
String slide2 = "Generative algorithms can be found at the core of much of today’s music and media technology, yet many artists and musicians remain somewhat suspicious of terms such as generative process, cellular automata, stochastic modelling and formal grammars.  ";
String slide3 = "Most artists already work in a generative manor defined by their own approach to creative and artistic problem solving; so where does this reluctance to explore deeper generative models come from? ";
String slide4 = "In the course of this presentation we will take a look at some very basic models of generative algorithms, ranging from simple probability distributions to more complex rules for formal grammars. ";
String slide5 = "This entire presentation was written in the Processing language. All audio is generated by a Processing audio library called Csoundo. The graphs were generated in Python using Pylab. Both Csoundo and the source code for this entire presentation are available at https://github.com/rorywalsh   ";
String slide6 = "What is an algorithm?";
String slide7 = "An algorithm can be defined simply as a set of instructions to be carried out at some point in time. Generative algorithms usually add a degree of autonomy to the procedure. Algorithms are everywhere. ";
String slide8 = "One even made its way into this slide...";
String slide9 = "Probabilities";
String slide10 = "Probability is usually defined as the measure of the likelihood of an event occurring now or in the future. In music and art probabilities are normally used to generate musical materials by picking elements from a set. For example, in order to generate a melody out of a set of notes, the computer could be programmed to randomly select one note at a time and then play it through a synthesiser. ";
String slide11 = "Random number generators are commonly used to return a value from a set, for example one could be used to select a number from the sequence 1, 2, 3, 4, 5, 6, 7, 8. The selected number might then be used as a position for a shape, or as a degree in a musical scale. ";
String slide12 = "By using different ‘distributions’ we can determine the probability of a certain outcome. The simplest type of distribution is the known as ‘uniform distribution’. Uniform distribution means all elements from the set are weighted equally.  ";
String slide13 = "Uniform distribution is often abbreviated to U(a,b) and can be graphed as";
String slide14 = "Virtually all computer programming languages feature random number generators. Processing is no different. It ships with a random() function that we can use to create a uniform distribution.  ";
String slide15 = "This code uses the output from the randomUniform() function to position some circles on screen. The Y axis value is also uses to drive a musical note. Some scaling is added to make sure everything fits within the screen. ";
String slide16 = "While uniform distribution can yield interesting results, weighting the results means we can take more control over the output. Linear distribution works by generating two random numbers and choosing the smaller one. This can be seen the following graph   ";
String slide17 = "This code is similar to the last but selects its values based on a linear distribution. ";
String slide18 = "And finally we have exponential distribution. This obviously creates an exponential curve of probable outcomes. But unlike the previous two distributions, it allows us to control the degree of favouritism by altering ‘lambda’.    ";
String slide19 = "We can see how different values of lambda affect the outcome of the results in the following graph";
String slide20 = "The code for an exponential distribution function can be written a";
String slide21 = "Putting it all together";
String slide22 = "So how do they look like when they are all shown together? In this next example right-mouse clicks are used to toggle through the distribution curves. Some variation of colour has also been added so it’s easier to see the difference between the different curves. ";
String slide23 = "Probability distributions provide clever ways to generate pseudo random events, and for the most part, they are easy to implement in any language. Apart from the three simplest types shown here, there are many more distributions which can all be used to create interesting data. ";
String slide24 = "While the previous examples illustrate how easy it is to generate a particular set of audio and visual data, the results still come across as being a little random";
String slide25 = "Thankfully it’s not difficult to exert control over the data. One simple way is to use probability tables. That is, we map the outcome of our random distribution onto a pre-determined set of data. We could for example load the notes of a musical scale into an array, and then use one of the previous distribution curves to select one at random.  ";
String slide26 = "The following graph shows a table full of MIDI notes, ranging from C3 to C4. Each note has an equal probability of being selected by a uniform random number generator. ";
String slide27 = "To gain even more control we can use as a ‘cumulative’ probability table. So instead of placing one of each note into the table, we actually place several of one and none of another. In this way we can start to favour a particular outcome.  ";
String slide28 = "This graph shows a table full of MIDI notes but unlike the previous graph, this one has duplicate note entries. Therefore some notes (i.e., C3) are more likely to play when the random number generator selects a position from the table. ";
String slide29 = "For more interesting results one can fill multiple tables with notes from different chords and cycle through the tables to change the harmonic progressions. ";
String slide30 = "In the following example the notes from the chords C major, A minor, F major and G major are loaded into separate tables. Key presses are used to cycle through the chords.  ";
String slide31 = "Instead of generating a new note on each beat, one can always store a pattern and repeat it over and over again. And when needed, a new pattern can be generated. In this next example 8 tables hold 16 different on/off values. When a slot is true the corresponding drum will play. The pattern speed can be altered by pressing the UP and DOWN key. SPACEBAR will repeat a note, and LEFT and RIGHT lengthen or shorten the pattern.  ";
String slide32 = "The same mechanism can be applied to some notes from the harmonic series. This time the wavetables has been modified to give a slightly retro sound to the music. ";
String slide33 = "";
String slide34 = "";
String slide35 = "";
String slide36 = "";
String slide37 = "";
String slide38 = "";
