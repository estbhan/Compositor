10 REM ------------------------------------------------------------------------
20 REM ------------------------------ COMPOSITOR ------------------------------
30 REM --------------------- ESTEBAN 24/04/89**28/06/89 -----------------------
40 REM ------------- LICENSE GPLv3 (SEE AT THE END OF THE FILE) ---------------
50 DIM nf(33)
60 DIM so(33,7)
70 DIM be(33,7)
80 DIM in(100,3)
90 DIM b(100,3)
100 DIM pluma(100,3)
110 DIM no(100,3)
120 DIM ti(100,3)
130 DIM vo(100,3)
140 MODE 1:INK 1,20:INK 2,13:INK 3,2:PEN 1
150 ENV 1,10,-1,10
160 SYMBOL AFTER 200
170 WINDOW#1,1,40,2,18:PAPER#1,2
180 SYMBOL 200,0,60,126,255,255,126,60,0
190 SYMBOL 201,0,0,120,252,252,124,4,4
200 SYMBOL 202,0,0,120,252,252,125,6,4
210 SYMBOL 203,0,0,120,253,254,125,6,4
220 SYMBOL 204,0,1,122,253,254,125,6,4
230 SYMBOL 205,2,5,122,253,254,125,6,4
240 SYMBOL 206,0,0,254,254,254,254,0,0
250 SYMBOL 207,48,72,74,52,0,126,0,0
260 SYMBOL 209,0,0,112,152,152,176,192,128
270 SYMBOL 210,1,6,13,30,29,28,14,3
280 SYMBOL 211,128,224,176,152,152,152,176,192
290 SYMBOL 212,0,0,2,6,4,3,0,0
300 SYMBOL 213,128,128,128,128,128,0,0,0
310 SYMBOL 214,0,0,3,15,24,60,60,24
320 SYMBOL 215,0,0,192,240,120,60,30,30
330 SYMBOL 216,30,30,30,62,62,60,124,120
340 SYMBOL 217,0,1,3,7,30,120,0,0
350 SYMBOL 218,240,224,192,128,0,0,0,0
360 SYMBOL 219,16,48,48,55,57,49,50,60
370 SYMBOL 220,24,36,36,24,0,60,0,0
380 fa$=CHR$(214)+CHR$(215)+chr$(8)+chr$(8)+chr$(10)+" "+CHR$(216)+chr$(8)+chr$(8)+chr$(10)+CHR$(217)+CHR$(218)
390 sol$=" "+CHR$(209)+chr$(8)+chr$(8)+chr$(10)+CHR$(210)+CHR$(211)+chr$(8)+chr$(8)+chr$(10)+CHR$(212)+CHR$(213)
400 a=5:b=3:nota=0:tie=200:v=10:cuerda=1:comp=1:cl$(1)=fa$:comp$="4/4":cl2$=cl$
410 vol=v:en=1
420 fig$(1)=CHR$(200)
430 fig$(2)=CHR$(201)
440 fig$(3)=CHR$(201)
450 fig$(4)=CHR$(202)
460 fig$(5)=CHR$(203)
470 fig$(6)=CHR$(204)
480 fig$(7)=CHR$(205)
490 fig$(8)=CHR$(206)
500 ON ERROR GOTO 3980
510 GOSUB 1160
520 GOSUB 3270
530 REM ------------------- NOTAS ---------------------
540 CURSOR 1:PEN 1:LOCATE a,b
550 a$=INKEY$
560 a$=LOWER$(a$)
570 IF a$="r" THEN fig=1:vfig=1:GOSUB 960
580 IF a$="b" THEN fig=2:vfig=0.5:GOSUB 960
590 IF a$="n" THEN fig=3:vfig=0.25:GOSUB 960
600 IF a$="c" THEN fig=4:vfig=0.125:GOSUB 960
610 IF a$="s" THEN fig=5:vfig=0.0625:GOSUB 960
620 IF a$="f" THEN fig=6:vfig=0.03125:GOSUB 960
630 IF a$="m" THEN fig=7:vfig=0.015625:GOSUB 960
640 IF INKEY(47)=0 THEN GOSUB 1270
650 IF INKEY(7)=0 THEN cop=nof:camb=1:GOSUB 1270
660 IF INKEY(71)=0 THEN silen=1
670 IF INKEY(3)=0 THEN GOSUB 1160
680 IF INKEY(34)=0 THEN cuerda=cuerda+1:cl$(cuerda)=cl$(cuerda-1):vfc=0:nota=0:IF cuerda>3 THEN cuerda=3:ELSE GOSUB 1160
690 IF INKEY(27)=0 THEN GOSUB 1870
700 IF INKEY(52)=0 THEN GOSUB 1460
710 IF INKEY(36)=0 THEN GOSUB 1610
720 IF INKEY(11)=0 THEN tie=tie+1:k=2:IF tie>300 THEN tie=300
730 IF INKEY(12)=0 THEN tie=tie-1:k=2:IF tie<1 THEN tie=1
740 IF INKEY(20)=0 THEN GOSUB 1780
750 IF k=2 THEN LOCATE 1,1:PRINT"TIEMPO ";tie:k=0
760 IF INKEY(0)=0 THEN v=v+1:k=1:IF v>15 THEN v=15
770 IF INKEY(2)=0 THEN v=v-1:k=1:IF v<0 THEN v=0
780 IF k=1 THEN LOCATE 29,1:PRINT"VOLUMEN ";v:k=0:LOCATE a,b
790 vol=v
800 IF INKEY(15)=0 THEN TAGOFF:posi=b-2:SOUND 1,nf(posi+ka),5,vol
810 IF INKEY(17)=0 AND vfc<>0 THEN vfc=comp:GOTO 1140
820 IF INKEY(69)=0 THEN GOSUB 4020
830 IF INKEY(28)=0 THEN GOSUB 2160
840 IF INKEY(30)=0 THEN GOSUB 1990
850 IF INKEY(68)=0 THEN c1=1:c2=1:c3=1:GOSUB 1310
860 IF INKEY(19)=0 THEN GOSUB 2320
870 IF INKEY(22)=0 THEN GOSUB 2420
880 IF INKEY(35)=0 THEN GOSUB 2850
890 IF INKEY(29)=0 THEN GOSUB 3750
900 IF INKEY(26)=0 THEN GOSUB 3910
910 IF INKEY(16)=0 THEN RUN
920 IF INKEY(51)=0 THEN GOSUB 4610
930 IF INKEY(39)=0 THEN GOSUB 4680
940 IF a>35 THEN n2=nota:a=5:noa=nota:GOSUB 1160
950 GOTO 550
960 REM ---------------- COLOCACION -----------------
970 IF nota>=100 THEN GOSUB 4540:RETURN
980 IF INKEY(67)=0 THEN vfig=vfig+vfig/2:puntillo=1
990 PEN 1:vfc=vfc+vfig
1000 IF vfc>comp THEN vfc=vfc-vfig:PEN 3:GOTO 530
1010 IF fig>2 THEN pluma=3 ELSE pluma=1
1020 posi=b-2
1030 CURSOR 1:PEN pluma:PRINT CHR$(22);CHR$(1):CURSOR 1:LOCATE a,b
1040 IF INKEY(0)=0 THEN b=b-1
1050 IF INKEY(2)=0 THEN b=b+1
1060 IF b<2 THEN b=2
1070 IF b>18 THEN b=18
1080 IF INKEY(15)=0 THEN TAGOFF:posi=b-2:SOUND 1,nf(posi+ka),5,vol
1090 IF silen=1 THEN fig=8:vol=0
1100 IF INKEY(9)=0 THEN silen=0:vfc=vfc-vfig:vol=15:PEN 3:puntillo=0:PRINT CHR$(22);CHR$(0):GOTO 530
1110 IF INKEY(6)=0 THEN a=a+1:nota=nota+1:b(nota,cuerda)=b:pluma(nota,cuerda)=pluma:silen=0:PRINT fig$(fig);:ELSE 1020
1120 IF puntillo=1 THEN PRINT CHR$(144):a=a+1:puntillo=0
1130 no(nota,cuerda)=nf(posi+ka):ti(nota,cuerda)=tie*vfig:vo(nota,cuerda)=vol:vol=15:PRINT CHR$(22);CHR$(0):in(nota,cuerda)=en
1140 IF vfc=comp THEN PLOT a*16,382,1:DRAW a*16,112:vfc=0:vfig2=0:a=a+2:silen=0:vol=15:GOTO 530:ELSE 530
1150 GOTO 1020
1160 REM ----------------- LIMPIA --------------------
1170 MODE 1:INK 1,20:INK 2,13:INK 3,2:PEN 1
1180 WINDOW#1,1,40,2,18:PAPER#1,2:CLS#1
1190 CURSOR 0:LOCATE 33,23:PRINT"    "
1200 FOR n=0 TO 8
1210 IF n>1 AND n<7 THEN pluma=1 ELSE pluma=3
1220 PLOT 64,400-(24+n*32)-inc,pluma:DRAW 590,400-(24+n*32)-inc,pluma
1230 NEXT n
1240 a=5
1250 GOSUB 3270:GOSUB 3580
1260 RETURN
1270 REM ------------------ REPRODUCCION --------------------
1280 IF cuerda=1 THEN c1=1 ELSE c1=0
1290 IF cuerda=2 THEN c2=1 ELSE c2=0
1300 IF cuerda=3 THEN c3=1 ELSE c3=0
1310 IF no(1,1)=0 THEN c1=0
1320 IF no(1,2)=0 THEN c2=0
1330 IF no(1,3)=0 THEN c3=0
1340 IF camb=1 THEN nntt=nof+nt ELSE nntt=nota
1350 FOR n=1+cop TO nntt
1360 IF vo(n,1)>0 THEN en1=in(n,1) ELSE en1=0
1370 IF vo(n,2)>0 THEN en2=in(n,2) ELSE en2=0
1380 IF vo(n,3)>0 THEN en3=in(n,3) ELSE en3=0
1390 IF c1=1 THEN SOUND 1,no(n,1),ti(n,1),vo(n,1),1*en1
1400 IF c2=1 THEN SOUND 2,no(n,2),ti(n,2),vo(n,2),1*en2
1410 IF c3=1 THEN SOUND 4,no(n,3),ti(n,3),vo(n,3),1*en3
1420 IF INKEY(18)=0 THEN SOUND 1+128,0:cop=0:camb=0:nt=nt2:RETURN
1430 NEXT n
1440 cop=0:camb=0
1450 RETURN
1460 REM ------------------ SALVA DATOS ----------------------
1470 MODE 2:LOCATE 33,1:PRINT"SALVA  MELODIA":CAT
1480 CLEAR INPUT
1490 tieg=tie
1500 LOCATE 1,21:INPUT"Nombre de la cancion ",can$
1510 IF can$="" THEN GOSUB 1160:RETURN
1520 OPENOUT can$
1530 FOR c=1 TO cuerda
1540 FOR n=1 TO nota
1550 WRITE #9,no(n,c),ti(n,c),vo(n,c),b(n,c),in(n,c),nota,cuerda
1560 NEXT n,c
1570 WRITE #9,tieg,ton,cl$(1),cl$(2),cl$(3)
1580 CLOSEOUT:LOCATE 1,21:PRINT"                                                                              "
1590 noa=nota
1600 GOSUB 1160:RETURN
1610 REM ------------------ CARGA DATOS ----------------------
1620 MODE 2:LOCATE 33,1:PRINT"CARGA  MELODIA":CAT
1630 CLEAR INPUT
1640 LOCATE 1,21:INPUT"Nombre de la cancion ",can$
1650 IF can$="" THEN 1160
1660 OPENIN can$
1670 FOR c=1 TO 3
1680 IF c>cuerda AND cuerda<>0 THEN 1730
1690 FOR n=1 TO 200
1700 IF n>nota AND nota<>0 THEN 1720
1710 INPUT #9,no(n,c),ti(n,c),vo(n,c),b(n,c),in(n,c),nota,cuerda
1720 NEXT n
1730 NEXT c
1740 INPUT #9,tieg,ton,cl$(1),cl$(2),cl$(3)
1750 CLOSEIN:LOCATE 1,21:PRINT"                                                                              "
1760 noa=nota
1770 GOSUB 3270:GOSUB 1160:RETURN
1780 REM ------------------ PARTE EL TIEMPO --------------------
1790 IF tieg=0 THEN RETURN
1800 t=tieg/tie
1810 FOR n=1 TO nota
1820 a=ti(n,1):c=ti(n,2):e=ti(n,3)
1830 bb=a/t:d=c/t:f=e/t
1840 ti(n,1)=bb:ti(n,2)=d:ti(n,3)=f
1850 NEXT n
1860 RETURN
1870 REM --------------- COMPAS ----------------------
1880 CURSOR 1:PEN 1
1890 LOCATE 34,23:PRINT "     "
1900 LOCATE 34,23
1910 a$=INKEY$
1920 IF a$="4" THEN comp$="4/4":comp=1:GOTO 1960
1930 IF a$="2" THEN comp$="2/4":comp=0.5:GOTO 1960
1940 IF a$="3" THEN comp$="3/4":comp=0.75:GOTO 1960
1950 GOTO 1910
1960 LOCATE 34,23:PRINT comp$
1970 LOCATE a,b+pent
1980 RETURN
1990 REM ------------------- CLAVE -------------------
2000 PEN 1
2010 LOCATE 23,22:PRINT"  "
2020 LOCATE 23,23:PRINT"  "
2030 LOCATE 23,24:PRINT"  "
2040 LOCATE 23,23
2050 clave$=INKEY$
2060 IF clave$="s" OR clave$="S" THEN cl$=sol$:GOTO 2090
2070 IF clave$="f" OR clave$="F" THEN cl$=fa$:GOTO 2090
2080 GOTO 2050
2090 LOCATE 23,22:PRINT cl$:LOCATE 1,1
2100 cl$(cuerda)=cl$
2110 IF cl$=cl2$ THEN 2130
2120 GOSUB 2620
2130 cl2$=cl$
2140 LOCATE a,b
2150 RETURN
2160 REM ---------------- SOSTENIDOS -------------------
2170 CURSOR 0:GOSUB 3270
2180 LOCATE 1,21:PRINT"Cuantos sostenidos ";CHR$(143)
2190 a$=INKEY$:IF a$<"0" OR a$>"7" THEN 2190 ELSE sos=VAL(a$)
2200 LOCATE 20,21:PRINT sos
2210 LOCATE 37,21:PRINT 0
2220 LOCATE 37,20:PRINT sos
2230 IF sos=0 THEN LOCATE 1,21:PRINT"                         ":LOCATE a,b:CURSOR 1:RETURN
2240 bel=0
2250 FOR n=1 TO sos
2260 FOR x=0+ka TO 16+ka
2270 IF so(x,n)<>0 THEN nf(x)=so(x,n)
2280 NEXT x,n
2290 LOCATE 1,21:PRINT"                         "
2300 LOCATE a,b:CURSOR 1
2310 RETURN
2320 REM ------------------- CUERDA --------------------
2330 LOCATE 15,1:PRINT CHR$(243)
2340 cuer2=cuerda:CURSOR 0
2350 a$=INKEY$
2360 IF a$<"1" OR a$>"3" THEN 2350 ELSE IF b(1,VAL(a$))=0 THEN 2370 ELSE cuerda=VAL(a$)
2370 LOCATE 23,1:PRINT cuerda
2380 LOCATE a,b:CURSOR 1
2390 IF cl$(cuerda)=cl$(cuer2) THEN LOCATE 15,1:PRINT " ":RETURN ELSE GOSUB 3580
2400 LOCATE 15,1:PRINT " "
2410 RETURN
2420 REM------------------- CORRIGE NOTA -----------------------
2430 CLEAR INPUT:MODE 2
2440 LOCATE 34,1:PRINT"CORRIGE NOTA"
2450 LOCATE 70,3:PRINT"Organo=0"
2460 LOCATE 70,5:PRINT"Piano.=1"
2470 LOCATE 1,3
2480 INPUT "Numero de la Nota a corregir ",num
2490 IF num=0 THEN 1160
2500 PRINT"Valor de la Nota..........=";no(num,cuerda);"..........=";:INPUT"",vn$
2510 IF vn$<>"" THEN no(num,cuerda)=VAL(vn$)
2520 PRINT"Tiempo....................=";ti(num,cuerda);"..........=";:INPUT"",ti$
2530 IF ti$<>"" THEN ti(num,cuerda)=VAL(ti$)
2540 PRINT"Volumen...................=";vo(num,cuerda);"..........=";:INPUT"",vo$
2550 IF vo$<>"" THEN vo(num,cuerda)=VAL(vo$)
2560 PRINT"Instrumento...............=";in(num,cuerda);"..........=";:INPUT"",in$
2570 IF in$<>"" THEN in(num,cuerda)=VAL(in$)
2580 PRINT:PRINT"]Otra nota?"
2590 a$=INKEY$:IF a$<>"" THEN 2600 ELSE 2590
2600 IF a$="s" OR a$="S" THEN 2420 ELSE GOSUB 1160
2610 RETURN
2620 REM ------------------ IMPRIME CLAVE --------------------
2630 IF cl$(cuerda)=fa$ THEN ka=0:RESTORE 2770:ELSE RESTORE 2760:ka=17
2640 FOR reg=0 TO 1
2650 FOR n=2 TO 18
2660 IF reg=1 AND (n<6 OR n>14) THEN PEN 3 ELSE PEN 1
2670 IF reg=0 THEN PEN 2
2680 READ a$
2690 PRINT CHR$(22);CHR$(1)
2700 LOCATE 2,n:PRINT a$
2710 PRINT CHR$(22);CHR$(0)
2720 NEXT n
2730 IF cl$(cuerda)=fa$ THEN ka=0:RESTORE 2760 ELSE RESTORE 2770:ka=17
2740 NEXT reg
2750 LOCATE a,b:CURSOR 1:PEN 1
2760 DATA Mi,Re,Do,Si,La,Sol,Fa,Mi,Re,Do,Si,La,Sol,Fa,Mi,Re,Do
2770 DATA Do,Si,La,Sol,Fa,Mi,Re,Do,Si,La,Sol,Fa,Mi,Re,Do,Si,La
2780 RETURN
2790 REM --------------- IMPRIME FIGURAS -----------------
2800 CLEAR INPUT
2810 FOR n=0 TO 8
2820 IF n>1 AND n<7 THEN pluma=1 ELSE pluma=3
2830 PLOT 64,400-(24+n*32)-inc,pluma:DRAW 590,400-(24+n*32)-inc,pluma
2840 NEXT n
2850 GOSUB 3270
2860 LOCATE 8,19:PRINT "    "
2870 a=5:nt=0
2880 IF INKEY(32)=0 THEN nof=0
2890 PEN 1:LOCATE 8,19:PRINT nof+1
2900 FOR n=nof+1 TO nota
2910 IF ti(n,cuerda)<=tie/4 THEN PEN 3 ELSE PEN 1
2920 IF ti(n,cuerda)=tie THEN ff=1
2930 IF ti(n,cuerda)=tie/2 THEN ff=2 ELSE IF ti(n,cuerda)>tie/2 AND ti(n,cuerda)<tie THEN ff=2:punt=1
2940 IF ti(n,cuerda)=tie/4 THEN ff=3 ELSE IF ti(n,cuerda)>tie/4 AND ti(n,cuerda)<tie/2 THEN ff=3:punt=1
2950 IF ti(n,cuerda)=tie/8 THEN ff=4 ELSE IF ti(n,cuerda)>tie/8 AND ti(n,cuerda)<tie/4 THEN ff=4:punt=1
2960 IF ti(n,cuerda)=tie/16 THEN ff=5 ELSE IF ti(n,cuerda)>tie/16 AND ti(n,cuerda)<tie/8 THEN ff=5:punt=1
2970 IF ti(n,cuerda)=tie/32 THEN ff=6 ELSE IF ti(n,cuerda)>tie/32 AND ti(n,cuerda)<tie/16 THEN ff=6:punt=1
2980 IF ti(n,cuerda)=tie/64 THEN ff=7 ELSE IF ti(n,cuerda)>tie/64 AND ti(n,cuerda)<tie/32 THEN ff=7:punt=1
2990 IF ti(n,cuerda)=tie/128 THEN ff=8 ELSE IF ti(n,cuerda)>tie/128 AND ti(n,cuerda)<tie/64 THEN ff=8:punt=1
3000 PRINT CHR$(22);CHR$(1)
3010 IF b(n,cuerda)=0 THEN PRINT CHR$(22);CHR$(0):RETURN
3020 IF vo(n,cuerda)=0 THEN LOCATE a,b(n,cuerda):PRINT CHR$(206):nt=nt+1:GOTO 3070
3030 IF nf(b(n,cuerda)+ka-2)>no(n,cuerda) THEN LOCATE a,b(n,cuerda):PRINT CHR$(35):a=a+1
3040 IF nf(b(n,cuerda)+ka-2)<no(n,cuerda) THEN LOCATE a,b(n,cuerda):PRINT CHR$(219):a=a+1
3050 LOCATE a,b(n,cuerda):PRINT fig$(ff):nt=nt+1
3060 IF punt=1 THEN a=a+1:LOCATE a,b(n,cuerda):PRINT CHR$(144):punt=0
3070 a=a+1
3080 PRINT CHR$(22);CHR$(0)
3090 IF a>35 THEN WHILE INKEY(1)<>0:WEND:IF INKEY(8)<>0 THEN GOSUB 3150 ELSE a=5:GOTO 530
3100 NEXT n
3110 IF sos>0 THEN GOSUB 2250
3120 IF bel>0 THEN GOSUB 3840
3130 LOCATE a,b:PEN 1
3140 RETURN
3150 a=5
3160 FOR nn=nof+1 TO n
3170 PEN 2
3180 IF vo(nn,cuerda)=0 THEN 3210
3190 IF nf(b(nn,cuerda)+ka-2)>no(nn,cuerda) THEN LOCATE a,b(nn,cuerda):PRINT CHR$(143):a=a+1
3200 IF nf(b(nn,cuerda)+ka-2)<no(nn,cuerda) THEN LOCATE a,b(nn,cuerda):PRINT CHR$(143):a=a+1
3210 LOCATE a,b(nn,cuerda):PRINT CHR$(143)
3220 IF ti(nn,cuerda)<>tie AND ti(nn,cuerda)<>tie/2 AND ti(nn,cuerda)<>tie/4 AND ti(nn,cuerda)<>tie/8 AND ti(nn,cuerda)<>tie/16 AND ti(nn,cuerda)<>tie/32 AND ti(nn,cuerda)<>tie/64 AND ti(nn,cuerda)<>tie/128 THEN p=1
3230 IF p=1 THEN a=a+1:LOCATE a,b(nn,cuerda):PRINT CHR$(143):p=0
3240 a=a+1
3250 NEXT nn
3260 nof=n:GOTO 2790
3270 REM -------------- CLAVES DE SOL Y FA -------------
3280 nf(0)=95+ton:nf(1)=106+ton:nf(2)=119+ton:nf(3)=127+ton
3290 nf(4)=142+ton:nf(5)=159+ton:nf(6)=179+ton:nf(7)=190+ton
3300 nf(8)=213+ton:nf(9)=239+ton:nf(10)=253+ton:nf(11)=284+ton
3310 nf(12)=319+ton:nf(13)=358+ton:nf(14)=379+ton:nf(15)=426+ton:nf(16)=478+ton
3320 '
3330 nf(17)=60+ton:nf(18)=63+ton:nf(19)=71+ton:nf(20)=80+ton:nf(21)=89+ton
3340 nf(22)=95+ton:nf(23)=106+ton:nf(24)=119+ton:nf(25)=127+ton:nf(26)=142+ton
3350 nf(27)=159+ton:nf(28)=179+ton:nf(29)=190+ton:nf(30)=213+ton:nf(31)=239+ton
3360 nf(32)=253+ton:nf(33)=284+ton
3370 '
3380 so(0,6)=89+ton:so(1,4)=100+ton:so(2,2)=113+ton:so(3,7)=119+ton:so(4,5)=134+ton
3390 so(5,3)=150+ton:so(6,1)=169+ton:so(7,6)=179+ton:so(8,4)=201+ton:so(9,2)=225+ton
3400 so(10,7)=239+ton:so(11,5)=268+ton:so(12,3)=301+ton:so(13,1)=338+ton:so(14,6)=358+ton
3410 so(15,4)=402+ton:so(16,2)=451+ton
3420 '
3430 so(21,1)=84+ton:so(28,1)=169+ton:so(17,2)=56+ton:so(24,2)=113+ton:so(31,2)=225+ton
3440 so(20,3)=75+ton:so(27,3)=150+ton:so(23,4)=100+ton:so(30,4)=201+ton:so(19,5)=67+ton
3450 so(26,5)=134+ton:so(33,5)=268+ton:so(22,6)=89+ton:so(29,6)=179+ton:so(18,7)=60+ton
3460 so(25,7)=119+ton:so(32,7)=239+ton
3470 '
3480 be(3,1)=134+ton:be(10,1)=268+ton:be(0,2)=100+ton:be(7,2)=201+ton
3490 be(14,2)=402+ton:be(4,3)=150+ton:be(11,3)=301+ton:be(1,4)=113+ton
3500 be(8,4)=225+ton:be(15,4)=451+ton:be(5,5)=169+ton:be(12,5)=338+ton
3510 be(2,6)=127+ton:be(9,6)=253+ton:be(16,6)=506+ton:be(6,7)=190+ton:be(13,7)=379+ton
3520 '
3530 be(18,1)=67+ton:be(25,1)=134+ton:be(32,1)=268+ton:be(22,2)=100+ton:be(29,2)=201+ton
3540 be(19,3)=75+ton:be(26,3)=150+ton:be(33,3)=301+ton:be(23,4)=113+ton:be(30,4)=225+ton
3550 be(20,5)=84+ton:be(27,5)=169+ton:be(17,6)=63+ton:be(24,6)=127+ton:be(31,6)=253+ton
3560 be(21,7)=95+ton:be(28,7)=190+ton
3570 RETURN
3580 REM ---------------- PENTAGRAMA -----------------
3590 REM FOR n=0 TO 8
3600 PEN 1
3610 LOCATE 1,23:PRINT"Tiempo";TAB(16);"Clave";TAB(27);"Compas"
3620 LOCATE 8,23:PRINT USING"###.##";tieg
3630 LOCATE 23,22:PRINT cl$(cuerda)
3640 LOCATE 34,23:PRINT comp$
3650 LOCATE 16,1:PRINT"Cuerda ";cuerda
3660 LOCATE 1,1:PRINT"TIEMPO ";tie
3670 LOCATE 29,1:PRINT"VOLUMEN ";v
3680 LOCATE 1,19:PRINT"1";CHR$(207);"Nota=";noa+1
3690 LOCATE 16,19:PRINT"Tono ";USING"+##.#";ton
3700 IF en=0 THEN LOCATE 33,19:PRINT"Organo" ELSE LOCATE 33,19:PRINT" Piano"
3710 LOCATE 33,20:PRINT"N";CHR$(220);CHR$(35);":";sos
3720 LOCATE 33,21:PRINT"N";CHR$(220);CHR$(219);":";bel
3730 GOSUB 2620
3740 RETURN
3750 REM ------------------ BEMOLES ---------------------
3760 CURSOR 0:GOSUB 3270
3770 LOCATE 1,21:PRINT"Cuantos bemoles ";CHR$(143)
3780 a$=INKEY$:IF a$<"0" OR a$>"7" THEN 3780 ELSE bel=VAL(a$)
3790 LOCATE 16,21:PRINT bel
3800 LOCATE 37,20:PRINT 0
3810 LOCATE 37,21:PRINT bel
3820 IF bel=0 THEN LOCATE 1,21:PRINT"                         ":LOCATE a,b:CURSOR 1:RETURN
3830 sos=0
3840 FOR n=1 TO bel
3850 FOR x=ka TO 16+ka
3860 IF be(x,n)<>0 THEN nf(x)=be(x,n)
3870 NEXT x,n
3880 LOCATE 1,21:PRINT"                         "
3890 LOCATE a,b:CURSOR 1
3900 RETURN
3910 REM ---------------- ENVOLVENTE -----------------
3920 en=en+1
3930 IF en>1 THEN en=0
3940 IF en=0 THEN LOCATE 33,19:PRINT"Organo"
3950 IF en=1 THEN LOCATE 33,19:PRINT" Piano"
3960 LOCATE a,b
3970 RETURN
3980 REM ------------------- ERROR ----------------------
3990 LOCATE 30,15:PRINT"FICHERO NO ENCONTRADO"
4000 WHILE INKEY(47)<>0:WEND
4010 GOTO 510
4020 REM --------------- INSTRUCCIONES ---------------
4030 MODE 2
4040 FOR n=1 TO 25:LOCATE 37,n:PRINT CHR$(149);CHR$(149):NEXT
4050 LOCATE 1,1
4060 PRINT"-------- PENTAGRAMA ---------"
4070 PRINT"[P]..=Elige Compas(4/4-3/4-2/4)"
4080 PRINT"[?]..=Elige Clave (Sol-Fa)"
4090 PRINT"[;]..=Numero de sostenidos"
4100 PRINT"[\]..=Numero de bemoles"
4110 PRINT"[+]..=Elige cuerda"
4120 PRINT"[";CHR$(240);"]..=Sube el volumen"
4130 PRINT"[";CHR$(241);"]..=Baja el volumen"
4140 PRINT"[f8]..=Mas lento"
4150 PRINT"[f5]..=Mas rapido"
4160 PRINT"--------- FIGURA ------------"
4170 PRINT"[R]..=Redonda":PRINT"[B]..=Blanca"
4180 PRINT"[N]..=Negra":PRINT"[C]..=Corchea"
4190 PRINT"[S]..=Semicorchea":PRINT"[F]..=Fusa"
4200 PRINT"[M]..=Semifusa":PRINT"[Z]+[NOTA]..=Silencio de esa nota"
4210 PRINT"[Q]+[NOTA]..=Nota con puntillo"
4220 PRINT"[";CHR$(240);"]..=Sube el cursor"
4230 PRINT"[";CHR$(241);"]..=Baja el cursor"
4240 PRINT"[f0]..=Hace sonar la nota del cursor"
4250 PRINT"[INTRO]..=Introduce Figura"
4260 PRINT"[COPIA]..=Anula la introduccion"
4270 WINDOW#2,39,80,1,25:CLS#2
4280 PRINT#2,"[*]..=Cierra el Compas"
4290 PRINT#2,"[f9]..=Borra el Pentagrama"
4300 PRINT#2,"[I]..=Imprime las Figuras"
4310 PRINT#2,"[";CHR$(243);"]..=Continua la Impresion"
4320 PRINT#2,"[";CHR$(242);"]+[";CHR$(243);"]..=Salimos de la Impresion"
4330 PRINT#2,"[0]+[I]..=Comienza la Impresion"
4340 PRINT#2,"[>]..=Melodia del Pentagrama-(7)-"
4350 PRINT#2,"[O]..=Para iniciar Melodia en otra Cuerda"
4360 PRINT#2,"--------- MELODIA -----------"
4370 PRINT#2,"[TAB]..=Melodia a voces"
4380 PRINT#2,"[ESP]..=Melodia de la cuerda indicada"
4390 PRINT#2,"[RETURN]..=Interrumpe melodia"
4400 PRINT#2,"[G]..=Graba la melodia"
4410 PRINT#2,"[L]..=Carga la melodia"
4420 PRINT#2,"------ INSTRUMENTO ---------"
4430 PRINT#2,"[@]..=Organo / Piano"
4440 PRINT#2,"[T]..=Tono"
4450 PRINT#2,"[INTRO]..=Para salir del Tono"
4460 PRINT#2,"[<]..=Modificar,Nota,Volumen e Instrumento"
4470 PRINT#2:PRINT#2
4480 PRINT#2,"[CLR]..=RUN"
4490 PRINT#2,"[A]..=Ayuda"
4500 CLEAR INPUT
4510 WHILE INKEY$="":WEND
4520 GOSUB 1160
4530 RETURN
4540 REM ----------------- TOPE ----------------------
4550 CURSOR 0
4560 LOCATE 13,20:PRINT"NO CABEN MAS NOTAS"
4570 WHILE INKEY$="":WEND
4580 LOCATE 13,20:PRINT"                  "
4590 LOCATE a,b:CURSOR 1
4600 RETURN
4610 REM ------------------ TONO --------------------
4620 CURSOR 0:LOCATE 15,19:PRINT CHR$(243)
4630 IF INKEY(2)=0 THEN ton=ton+0.1:IF ton>10 THEN ton=10
4640 IF INKEY(0)=0 THEN ton=ton-0.1:IF ton<-10 THEN ton=-10 
4650 LOCATE 21,19:PRINT USING"+##.#";ton*-1
4660 IF INKEY(6)=0 THEN GOSUB 3270:LOCATE 15,19:PRINT" ":LOCATE a,b:CURSOR 1:RETURN
4670 GOTO 4610
4680 REM ----------- ACTUALIZA VOLUMEN E INSTRUMENTO CANAL 1 -----------------
4690 MODE 2
4700 PRINT"Introduce el canal"
4710 a$=INKEY$:IF a$<1 OR a$>3 THEN 4710 ELSE can=VAL(a$)
4720 INPUT"Introduce el margen izquierdo de NOTAS:",mari
4730 INPUT"Introduce el margen derecho de NOTAS  :",mard
4740 IF mard<=mari OR mard>nota OR mari<1 THEN 4680
4750 PRINT"]Quires cambiar al volumen?";" ~0~<=>~NO~ --- ~1~<=>~SI~"
4760 a$=INKEY$:IF a$<"0" OR a$>"1" THEN 4760 ELSE volumen=VAL(a$)
4770 PRINT"]Quires cambiar el instrumento?";" ~0~<=>~NO~ --- ~1~<=>~SI~"
4780 a$=INKEY$:IF a$<"0" OR a$>"1" THEN 4780 ELSE instrum=VAL(a$)
4790 FOR n=mari TO mard
4800 IF vo(n,can)=0 THEN 4820
4810 IF volumen THEN vo(n,can)=vol
4820 IF instrum THEN in(n,can)=en
4830 NEXT
4840 RETURN
6000 '  ------------------------------------------------------------------------
6010 '  ---------------------------- LICENSE GPLv3 -----------------------------
6020 '  ------------------------------------------------------------------------
6030 '  
6040 '  Programa de musica, que permite la introduccion de notas musicales
6050 '  en tres pentagramas para su ejecución de forma polifonica.
6060 ' 
6070 '  Copyright (C) 1989 @estbhan (Esteban H.N.)
6080 ' 
6090 '  This program is free software: you can redistribute it and/or modify it
6100 '  under the terms of the GNU General Public License as published by the
6110 '  Free Software Foundation, either version 3 of the License, or (at your
6120 '  option) any later version. 
6130 ' 
6140 '  This program is distributed in the hope that it will be useful, but
6150 '  WITHOUT ANY WARRANTY; without even the implied warranty of
6160 '  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
6170 '  GNU General Public License for more details.
6180 '  
6190 '  You should have received a copy of the GNU General Public License along
6200 '  with this program. If not, see <https://www.gnu.org/licenses/>.
6210 '  -----------------------------------------------------------------------

