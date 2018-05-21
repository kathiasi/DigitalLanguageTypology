###Paloitteluskripti### 

#Avaa objektilistaan .wav & .TextGrid pari. 
#Pidä äänitiedosto valittuna.
#Vaihda allaoleva kansion polku oikeaksi.
#Aja skripti ja klikkaa kohtaa jonka haluat leikata ja klikkaa Continue.
#Toista tämä kunnes koko äänitiedosto on paloiteltu.

#Palat tallennetaan numeroituina kohdekansioon.

#@Juraj Simko & Katri Hiovain

dir$ = "C:\HY-Data\HIOVAIN\Dropbox\TheNorthWind\praat_scripts\test"

wav$ = selected$("Sound")
endfile=Get end time
plus TextGrid 'wav$'
tg = selected("TextGrid")
prev_start = 0

filename$ = selected$("Sound")

Edit
for k from 1 to 5000
	kk$ = string$(k)
	select tg
		editor: tg
			pause  Select next boundary.
			start = prev_start
			end = Get cursor
			Select: start, end
			vwf = Extract selected sound (time from 0)
		endeditor


		select vwf 
		Save as WAV file: dir$ + "\" + filename$ + "-" + kk$ + ".wav"
		
		Remove
		
		select tg
		tg1 = Extract part... start end no

		Save as text file: dir$ + "\" + filename$ + "-" + kk$ + ".TextGrid"
		
						
		prev_start = end
		endeditor
		
endfor
