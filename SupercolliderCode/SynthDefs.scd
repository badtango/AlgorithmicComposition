// My Synths
(
g = Buffer.read(s, "/Users/williamrailton/Desktop/AlgorithmicComposition/BufferSamples/WillsGlitch1.wav");
h = Buffer.read(s, "/Users/williamrailton/Desktop/AlgorithmicComposition/BufferSamples/WillsGlitch2.wav");
i = Buffer.read(s, "/Users/williamrailton/Desktop/AlgorithmicComposition/BufferSamples/WillsGlitch3.wav");
j = Buffer.read(s, "/Users/williamrailton/Desktop/AlgorithmicComposition/BufferSamples/WillsGlitch4.wav");
k = Buffer.read(s, "/Users/williamrailton/Desktop/AlgorithmicComposition/BufferSamples/WillsGlitch5.wav");
l = Buffer.read(s, "/Users/williamrailton/Desktop/AlgorithmicComposition/BufferSamples/WillsGlitchCopy.wav");

SynthDef(\squelch, { arg i_out = 0, freq, modfreq, index, dur5; 
                     var out, pmo, env, note; 
                           
                         note = freq.midicps;
                          env = EnvGen.kr(Env.perc(0.1, dur5), levelScale: 0.2, doneAction: 2);
                          pmo = PMOsc.ar(note, modfreq, index, 0, env); 
                          out = Pan2.ar(pmo, 0, 0.2);
		                         Out.ar(i_out, out);
		                         }).send(s);
		                        	                          		               
SynthDef(\amb, { arg i_out = 0, freq, dur3, dur4, lf, lf2, lf3;
                 var out, note, main, rev;               
                     
                     note = freq.midicps;
                     main = RHPF.ar(Pulse.ar(note, mul: EnvGen.kr(Env.perc(dur4, dur3), 
                            levelScale: 0.07, doneAction: 2)),
		                     LFNoise1.kr(lf, lf2, lf3), 0.1);
                            4.do({ rev = AllpassN.ar(main, 0.05, 0.05, 4)});
                      out = Pan2.ar(main, 0, 0.2);    
                            Out.ar(i_out, out);
                            }).send(s);                         
                 
SynthDef(\blob, { arg i_out = 0, freq, pan, dur1, dur2, mod;
                  var out, note, fadein, sum; 
                                
                      note = freq.midicps;
                    fadein = EnvGen.kr(Env.perc(dur1, dur2), levelScale: 0.2, doneAction: 2);  
                       sum = Blip.ar(note, LFNoise2.kr(mod, 20, 1).midicps, fadein);                
                       out = Pan2.ar(sum, pan, 0.2);   
                             Out.ar(i_out, out);
                             }).send(s);
 
SynthDef("sounds/willsglitsame.wav", { arg i_out = 0, bufnum = 0, buf, buf2, pan2, dur6;
                               var out, mode, mode2, mode3, hi, rev2, pan1;
                                                                                                                        
                                mode3 = Impulse.kr(buf2, buf2, 0.4);
                                mode2 = EnvGen.kr(Env.perc(0.1, dur6), levelScale: 0.4, doneAction: 2);  
                                 mode = SinOsc.kr(mode2, buf, 10);
                                  out = PlayBuf.ar(1, bufnum, mode, BufRateScale.kr(bufnum), 
                                        trigger: mode3, loop: 1.0);
                                        4.do({ rev2 = AllpassN.ar(out, 0.05, 0.05, 4)}); 
                                   hi = HPF.ar(rev2, 2000, mode2);
                                 pan1 = Pan2.ar(hi, pan2, 0.4);             
                                        Out.ar(i_out, pan1);
                                        }).send(s);
	
SynthDef("workdammit", { arg dur, bufnum = 0, sp = 0, rate = 1, pany; 
                         var out = 0, env4, play;

                            env4 = EnvGen.kr(Env.perc(0.01, dur), 1.0, doneAction: 2);
                            play = env4 * ( PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) 
                                        * rate, startPos: sp, loop: 1.0 ));	
                             out = Pan2.ar(play, pany, 0.2);           
                                        Out.ar(0, out);

}).writeDefFile; 
s.sendSynthDef("workdammit");

SynthDef(\lala, { arg i_out = 0, freq, phase, filt, perc, perc2;
                  var out, great, note, envy, osc;
                       
                       note = freq.midicps;
                       envy = EnvGen.kr(Env.perc(perc2, perc), levelScale: 0.3, doneAction: 2);                        
                      great = LFSaw.ar(note, phase, envy) + SinOsc.ar(note, phase, envy);
                        osc = LPF.ar(great, filt, 0.25);
                        out = Pan2.ar(osc, 0, 0.25);               
                              Out.ar(i_out, out);
                              }).send(s);                                                   

m = AtsFile.new("/Users/williamrailton/Desktop/AlgorithmicComposition/BufferSamples/LucidDream.ats").load(6);
SynthDef(\spec, { arg i_out = 0, dury, freaky, pannery, addyo, kl, partstart;
                  var rate, out, enver, pan;

                    rate = LFNoise2.kr(SinOsc.kr(freaky, freaky, addyo), 2);
                   enver = EnvGen.kr(Env.perc(0.1, dury, 0.6, 8), levelScale: 0.6, doneAction: 2);  
                     out = AtsSynth.ar(6, m.numPartials, partstart, 1, 
		                    filePointer: LFSaw.kr(m.sndDur.reciprocal * rate, rate, kl, freaky), mul: 0.6);
                     pan = Pan2.ar(out, pannery, enver);
                        Out.ar(i_out, pan);
                              }).send(s);

SynthDef(\sicko, { arg i_out = 0, freq, panpos, mody1, mody2, mody3, attack, release;
                  var note, bpf, in, mid, pan2, goenv;
                  
                      note = freq.midicps;
                     goenv = EnvGen.kr(Env.perc(attack, release, 0.4), levelScale: 0.4, doneAction: 2);
                        in = Saw.ar(note, goenv);
                       mid = SinOsc.kr(XLine.kr(mody3, mody2, mody1), 0, 3600, 4000);
                       bpf = BPF.ar(in, mid, 0.3);
                      pan2 = Pan2.ar(bpf, panpos, 0.4);
                             Out.ar(i_out, pan2);
                             }).send(s);
)
