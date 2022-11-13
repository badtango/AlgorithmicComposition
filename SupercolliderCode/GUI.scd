//My GUI

(
"/Users/williamrailton/Desktop/AlgorithmicComposition/SupercolliderCode/SynthDefs.scd”.loadPaths;
"/Users/williamrailton/Desktop/AlgorithmicComposition/SupercolliderCode/Tasks.scd”.loadPaths;
"/Users/williamrailton/Desktop/AlgorithmicComposition/SupercolliderCode/Functions.scd”.loadPaths;

s.waitForBoot({ var v, w, s, b, c, d, e, f, go, h, i, re, x;
			
	w = Window.new("Alg", Rect(1150, 800, 143, 285));	
	
	v = VLayoutView(w,Rect(10,5,125,3000)); 
			
					
	re=Button(v, Rect(20,20,80,26))
			.states_([["Randomize All", Color.black, Color.white],["Stop", Color.black, Color.red]])
			.action_({|re| (re.value==1).if{s= ~master.value; }{ ~stop.value; }});
	
	b=Button(v, Rect(20,20,80,26))
			.states_([["Play Synth 1", Color.black, Color.white],["Stop Synth 1", Color.black, Color.red]])
			.action_({|b| (b.value==1).if{s= ~go1.value }{ ~mysynth1task.stop }});
	
	c=Button(v, Rect(20,20,80,26))
			.states_([["Play Synth 2", Color.black, Color.white],["Stop Synth 2", Color.black, Color.red]])
			.action_({|c| (c.value==1).if{s= ~go2.value }{ ~mysynth2task.stop }});
			
	d=Button(v, Rect(20,20,80,26))
			.states_([["Play Synth 3", Color.black, Color.white],["Stop Synth 3", Color.black, Color.red]])
			.action_({|d| (d.value==1).if{s= ~go3.value }{ ~mysynth3task.stop }});
	
	e=Button(v, Rect(20,20,80,26))
			.states_([["Play Synth 4", Color.black, Color.white],["Stop Synth 4", Color.black, Color.red]])
			.action_({|e| (e.value==1).if{s= ~go4.value }{ ~mysynth4task.stop }});
	
	f=Button(v, Rect(20,20,80,26))
			.states_([["Play Synth 5", Color.black, Color.white],["Stop Synth 5", Color.black, Color.red]])
			.action_({|f| (f.value==1).if{s= ~go5.value }{ ~mysynth5task.stop }});
			
	go=Button(v, Rect(20,20,80,26))
			.states_([["Play Synth 6", Color.black, Color.white],["Stop Synth 6", Color.black, Color.red]])
			.action_({|go| (go.value==1).if{s= ~go6.value }{ ~mysynth6task.stop }});
			
	h=Button(v, Rect(20,20,80,26))
			.states_([["Play Synth 7", Color.black, Color.white],["Stop Synth 7", Color.black, Color.red]])
			.action_({|h| (h.value==1).if{s= ~go7.value }{ ~mysynth7task.stop }});
			
	i=Button(v, Rect(20,20,80,26))
			.states_([["Play Synth 8", Color.black, Color.white],["Stop Synth 8", Color.black, Color.red]])
			.action_({|i| (i.value==1).if{s= ~go8.value }{ ~mysynth8task.stop }});
				
	w.onClose_{ s.free; CmdPeriod.removeAll };
	w.front;

})
)

	
