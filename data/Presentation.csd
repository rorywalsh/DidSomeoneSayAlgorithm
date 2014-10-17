<CsoundSynthesizer>
<CsOptions>
-+rtaudio=jack odac -m0d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 64
nchnls = 2

0dbfs = 1

;synth simple 
instr 10
i1 active 10
aexp expon p6+0.001, p3, 0.01
a1 oscil aexp, cpsmidinn(p4), 1
if(p5==0)then
outs a1, a1
else
outs a1*p5, a1*(1-p5)
endif
endin
 
;synth simple sawish waveform... 
instr 15
aexp expon p5, p3, 0.01
a1 oscil aexp, p4, 99
kpan randh 1, .01, 2
outs a1*abs(kpan), a1*(1-abs(kpan)) 
endin

instr 100
a1 loscil .4, 1, p4, 1, 0; tablei a1, p5+900, 1
kpan randh 1, .01, 2
outs a1*abs(kpan), a1*(1-abs(kpan)) 
endin 

;play samples
instr 11
aEnv linen .7, 0.01, p3, 0.01
iFreq = 1/p3
a1 phasor iFreq
atab tab a1, p4, 1 
outs atab*aEnv, atab*aEnv
endin

;play samples, no pitch shift
instr 12
aEnv linen .4, 0.01, p3, 0.01
p3 = ftlen(p4)/sr
iFreq = 1/p3
a1 phasor iFreq
atab tab a1, p4, 1 
outs atab*aEnv, atab*aEnv
endin

</CsInstruments>
<CsScore>
f1 0 1024 10 1
f99 0 2 10 1
f2 0 0 1 "random.wav" 0 4 1
f3 0 0 1 "1.wav" 0 4 1
f4 0 0 1 "2.wav" 0 4 1
f5 0 0 1 "3.wav" 0 4 1
f6 0 0 1 "4.wav" 0 4 1
f7 0 0 1 "5.wav" 0 4 1
f8 0 0 1 "6.wav" 0 4 1
f9 0 0 1 "7.wav" 0 4 1
f10 0 0 1 "8.wav" 0 4 1

f100 0 0 1 "drums/01.wav" 0 4 1
f101 0 0 1 "drums/02.wav" 0 4 1
f102 0 0 1 "drums/03.wav" 0 4 1
f103 0 0 1 "drums/04.wav" 0 4 1
f104 0 0 1 "drums/05.wav" 0 4 1
f105 0 0 1 "drums/06.wav" 0 4 1
f106 0 0 1 "drums/07.wav" 0 4 1
f107 0 0 1 "drums/08.wav" 0 4 1

f0 3600
;i 1 0 [60 * 60 * 24]
</CsScore>
</CsoundSynthesizer>
