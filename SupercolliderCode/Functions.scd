// My Functions

(
~myFuncy = ({ arg triggy = 0;
~myFunc = ({ arg myArrayBass = 0, myArrayDiff = [0, 2, 4, 5, 7, 9, 10, 12], myTrans = 0;
	myArrayDiff.size.do({ arg i;
		myArrayDiff[i] = myArrayDiff[i] + myArrayBass;
	}); 
	myArrayDiff - myTrans;
}); 

y = triggy; // chosen bassnote 
z = [0, 2, 4, 5, 7, 9, 11, 12]; // scale
w = [48, 36, 24, 12, 0]; // oct
x = ~myFunc.value(y, z);

~go1 = ({ arg myTime = 0;
SystemClock.schedAbs( (thisThread.seconds + myTime),
    {
    "synth1".postln; 
    (
		a = 40.rand;
		~mysynth1task.stop; ~mysynth1.value(a, x, w);
	)                    
});
});

~go2 = ({ arg myTime = 0;
SystemClock.schedAbs( (thisThread.seconds + myTime),
    {
    "synth2".postln; 
    (
		b = 40.rand;
		~mysynth2task.stop; ~mysynth2.value(b, x, w);
	)                    
});
});

~go3 = ({ arg myTime = 0;
SystemClock.schedAbs( (thisThread.seconds + myTime),
    {
    "synth3".postln; 
    (
       c = 40.rand;
		~mysynth3task.stop; ~mysynth3.value(c, x, w);
	)                    
});
});

~go4 = ({ arg myTime = 0;
SystemClock.schedAbs( (thisThread.seconds + myTime),
    {
    "synth4".postln; 
    (
       d = [4, 8, 16, 32, 64].choose;
		~mysynth4task.stop; ~mysynth4.value(d);
	)                    
});
});

~go5 = ({ arg myTime = 0;
SystemClock.schedAbs( (thisThread.seconds + myTime),
    {
    "synth5".postln; 
    (
       g = [8, 16, 32, 64].choose;
		~mysynth5task.stop; ~mysynth5.value(g, x, w);
	)                    
});
});

~go6 = ({ arg myTime = 0;
SystemClock.schedAbs( (thisThread.seconds + myTime),
    {
    "synth6".postln; 
    (
       e = [16, 32, 64].choose;
		~mysynth6task.stop; ~mysynth6.value(e);
	)                    
});
});

~go7 = ({ arg myTime = 0;
SystemClock.schedAbs( (thisThread.seconds + myTime),
    {
    "synth7".postln; 
    (
       f = [16, 32, 64].choose;
		~mysynth7task.stop; ~mysynth7.value(f);
	)                    
}); 
}); 

~go8 = ({ arg myTime = 0;
SystemClock.schedAbs( (thisThread.seconds + myTime),
    {
    "synth8".postln; 
    (
		n = 40.rand;
		~mysynth8task.stop; ~mysynth8.value(n, x, w);
	)                    
}); 
}); 

~stop = ({ arg myTime = 0;
SystemClock.schedAbs( (thisThread.seconds + myTime),
    {
    "FINISHED!".postln; 
    (
    ~masterTask.stop; ~modechangeTask.stop;
    ~mysynth1task.stop; ~mysynth2task.stop; 
    ~mysynth3task.stop; ~mysynth4task.stop; 
    ~mysynth5task.stop; ~mysynth6task.stop; 
    ~mysynth7task.stop; ~mysynth8task.stop;
    ~stoptask.stop;          
	)                    
}); 
}); 
}); 

~master = ({ arg val6 = 0; 
             var t, myModes;
~masterTask = Task({
                ~sCount = 0; 
	                    loop({

[~go1, ~go2, ~go3, ~go1, ~go2, ~go3, ~go4, ~go5, ~go5, ~go6, ~go7, ~go8, ~go8].choose.value(0);
	
	~sCount = ~sCount + 1;	
	~sCount;
	[0.5, 1, 2, 4, 8, 16, 8, 16, 32, 48].choose.wait;	                 
	}); 
	}).play; 
 
~modechangeTask = Task({ 
                ~sCount = 0; 
	                    loop({

myModes = [84, 86, 88, 89, 91, 93, 95, 96];
t = myModes.choose;
 
if ( t == 84, {"Ionian Mode".postln;     });
if ( t == 86, {"Dorian Mode".postln;     });
if ( t == 88, {"Phrygian Mode".postln;   });
if ( t == 89, {"Lydian Mode".postln;     });
if ( t == 91, {"Mixolydian Mode".postln; });
if ( t == 93, {"Aeolian Mode".postln;    });
if ( t == 95, {"Locrian Mode".postln;    });
if ( t == 96, {"Ionian Mode".postln;     });

~myFuncy.value(t); 
~myFunc.value(y, z); 

	~sCount = ~sCount + 1;	
	[32, 64, 128, 256].choose.wait;	                 
	}); 
	}).play; 

~stoptask = Task({ 
                ~sCount = 0; 

"Here We Go!".postln;
~stop.value(300.rand.postln);

	~sCount = ~sCount + 1;	
	500.wait;	                 
	}).play; 
}); 
)
