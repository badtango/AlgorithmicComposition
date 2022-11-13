// My Tasks
(
TempoClock.default.tempo = 120/60;
~mysynth1 = ({ arg myVal1 = 0, mymel1 = 0, oct1 = 0;
~mysynth1task = Task({
		     myVal1.do({ Synth(\squelch, [\freq, mymel1.choose - oct1.choose,
                                         \modfreq, [1, 2, 2, 4, 4, 8, 16].choose, 
                                         \index, [1, 5, 10].choose, 
                                         \dur5, [1, 2, 3].choose]);
                                         [2, 1, 1, 1, 0.5, 0.5, 0.5].choose.wait;	                	                                                                 
}); 
}).play; 
}); 

~mysynth2 = ({ arg myVal2 = 0, mymel2 = 0, oct2 = 0;
~mysynth2task = Task({
		     myVal2.do({ Synth(\amb, [\freq, mymel2.choose - oct2.choose, 
		                              \dur3, [0.5, 1, 2, 4, 6].choose, 
		                              \dur4, [0.01, 0.01, 1, 2].choose, 
		                              \lf, [1, 5, 10, 20, 40].choose, 
		                              \lf2, [0.1, 500, 250, 125].choose, 
		                              \lf3, [500, 750, 1000, 2000].choose]);
                                     [2, 1, 0.5, 0.25].choose.wait;                                      
}); 
}).play; 
}); 
		             
~mysynth3 = ({ arg myVal3 = 0, mymel3 = 0, oct3 = 0;
~mysynth3task = Task({
		     myVal3.do({ Synth(\blob, [\freq, mymel3.choose - oct3.choose, 
		                               \pan, [-1, 0, 0, 1].choose, 
		                               \dur1, [0.5, 1, 1.5, 2, 4].choose, 
		                               \dur2, [3, 5, 7].choose, 
                                      \mod, [1, 2, 4, 8, 12].choose]);
                                      [8, 4, 4, 2, 2, 1, 0.5].choose.wait;
}); 
}).play; 
}); 
		  	
~mysynth4 = ({ arg myVal4 = 0;
~mysynth4task = Task({
		     myVal4.do({ Synth("sounds/willsglitsame.wav", [\buf, [0.1, 0.5, 2, 0.001, 1, 10, -1, 10, 20].choose, 
                                                       \buf2, [0.1, 10, 50, 500, 1000].choose, 
                                                       \pan2, [-1, 0, 0, 1].choose, 
                                                       \dur6, [4, 6, 8].choose]);
                                                       [1, 2, 4, 8, 16].choose.wait;		  		  
}); 
}).play; 
}); 

~mysynth5 = ({ arg myVal5 = 0, mymel4 = 0, oct4 = 0;              
~mysynth5task = Task({
		     myVal5.do({ Synth(\lala, [\freq, mymel4.choose - oct4.choose, 
		                               \phase, 100.rand, 
		                               \filt, [1000, 2500, 5000, 7500, 10000, 12500, 15000].choose, 
		                               \perc, [0.5, 1, 2, 5, 8].choose, 
		                               \perc2, [0.1, 0.5, 0.1, 0.5, 2.5, 5].choose]); 		           
                                      [4, 2, 1, 0.5].choose.wait;
}); 
}).play; 
}); 
                    
~mysynth6 = ({ arg myVal6 = 0; 
~mysynth6task = Task({ arg buffy;	
		     myVal6.do({ buffy = [h, i, j, k, l].choose;                  
                   s.sendMsg("/s_new", \workdammit, s.nextNodeID, 1, 0, 
                   \dur, [0.1, 0.5, 1, 1.5, 2, 4].choose, 
                   \bufnum, buffy.bufnum, 
                   \sp, rand(buffy.numFrames), 
                   \rate, [-1.0, -5.0, 0.5, 1, 4, 8, -1.0, -5.0, 0.5, 1, 4, 8, 40].choose, 
                   \pany, [-1, 0, 0, 1].choose);
                   ([1, 0.5, 0.25, 0.25, 0.125].choose).wait;
}); 
}).play; 
}); 

~mysynth7 = ({ arg myVal7 = 0;              
~mysynth7task = Task({
		     myVal7.do({ Synth(\spec, [\rate, [0.5, 1, 25, 50, 500, 1000, 2000, 8000].choose, 
		                               \dury, [10, 15, 20].choose, 
		                               \freaky, [0.25, 1, 5, 50, 100, 200, 500, 1000].choose, 
		                               \pannery, [-1, 0, 0, 1].choose, 
		                               \addyo, [10, 20, 40, 80, 160].choose, 
		                               \kl, [0.025, 0.5, 1].choose, 
		                               \partstart, [0, 0.25, 0.5, 1, 3, 5, 10, 20].choose]); 		           
                                      [8, 16].choose.wait;
}); 
}).play; 
}); 

~mysynth8 = ({ arg myVal8 = 0, mymel5 = 0, oct5 = 0;
~mysynth8task = Task({
		     myVal8.do({ Synth(\sicko, [\freq, mymel5.choose - oct5.choose, 
		                       \panpos, [-1, 0, 0, 1].choose, 
		                       \mody1, 80.rand, 
		                       \mody2, [0.1, 50, 100, 200, 400].choose, 
		                       \mody3, [0.01, 0.1, 0.1, 1].choose, 
		                       \attack, [0.1, 1, 2, 4].choose, 
		                       \release, 8.0.rand]);                  
                              [6, 4, 2, 1, 1, 1, 0.5, 0.5, 0.5].choose.wait;	                	                                                                 
}); 
}).play; 
}); 
)
