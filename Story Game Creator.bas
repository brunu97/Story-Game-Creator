'=========================================================================================================================================================================================='
'Story Game Creator Versão/Version 1.5.0 (Open Source)
'2015
'^^^^
'~~~~
'----------------------------------------|
'Bruno Silva
'==========================================================================================================================================================================================='
'
'»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««




nomainwin

    'Tamanho da janela
    WindowWidth = 690
    WindowHeight = 540
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)
    janelaprincipal = 1


    'Editor de código
    texteditor #main.editor, 62, 91, 615, 400
    texteditor #main.escondido, -1000,0,500,500
    textbox #main.line ,0, 90, 60, DisplayHeight

    'Opções
    menu #main, "File", "New", [novo],|, "Open", [abrir], "Save", [save], "Save As",[saveas] ,|,"Create Game", [criarJogo],"Test Game", [testar]
    menu #main, "Edit"
    menu #main, "Tools", "DataBase",[opendatabase], "Animation Editor", [inseranimationwindow],"Graphics/Symbols Window", [opensymbols] ,|, "ASCII Generator",[textgenerator], "Image to ASCII",[imagetoascii],"Simple ASCII letters", [simpletextascii],|, "Notes", [notas]
    menu #main, "Help", "About", [sobreisto], "Help", [help],|, "Forum", [forumhelp], "Website", [websitehelp]







    'Carregar Imagens
    loadbmp "aboutimg", "Data\about1.3.bmp"




    'Define Botões
    button #main.btnopen, "Open", [abrir], UL, 54, 6, 42, 25
    button #main.btnnovo, "New", [novo], UL, 102, 6, 34, 25
    button #main.btnCriar, "Create Game", [criarJogo], UL, 145, 6, 88, 25
    button #main.btnSave, "Save", [save], UL, 6, 6, 42, 25


    'Define botões com imagens
    bmpbutton #main.bmpcena, "Data\scene.bmp", [inserCena], UL, 318, 6
    bmpbutton #main.bmpcomentar, "Data\coment.bmp", [comentarCode], UL, 358, 6
    bmpbutton #main.bmpcores, "Data\cores.bmp", [insereCore], UL, 398, 6
    bmpbutton #main.bmpacao, "Data\l.bmp", [inserirEscolhas], UL, 438, 6
    bmpbutton #main.bmptexto, "Data\importar txt.bmp", [inserTXT], UL, 478, 6
    bmpbutton #main.bmpaviso, "Data\janela.bmp", [inserJanela], UL, 598, 46
    bmpbutton #main.bmplinha, "Data\Linha vazia.bmp", [inserirLinha], UL, 278, 46
    bmpbutton #main.bmpEcho, "Data\linha.bmp", [inserirFala], UL, 318, 46
    bmpbutton #main.bmpnet, "Data\net.bmp", [insertNet], UL, 598, 6
    bmpbutton #main.bmpmenu, "Data\inserirmenu.bmp", [insermenu], UL, 278, 6
    bmpbutton #main.bmpplay, "Data\play.bmp", [testar], UL, 10, 45
    bmpbutton #main.bmpsnd, "Data\snd.bmp", [insersom], UL, 558, 46
    bmpbutton #main.bmpoff, "Data\off.bmp", [inseroff], UL, 518, 46
    bmpbutton #main.bmpcls, "Data\cls.bmp", [insercls], UL, 478, 46
    bmpbutton #main.bmpstop, "Data\stop2.bmp", [inserstop], UL, 438, 46
    bmpbutton #main.bmpanimationmenu, "Data\animationbt2.0.bmp", [inseranimationwindow], UL,137, 46
    bmpbutton #main.bmpwritef, "Data\makefile.bmp", [insermake], UL, 558, 6
    bmpbutton #main.bmpcallfile, "Data\callfile.bmp", [insercallfile], UL, 518, 6
    bmpbutton #main.bmpsair, "Data\exitgame.bmp", [insersaidajogo], UL, 358, 46
    bmpbutton #main.bmpdb, "Data\databasedados.bmp", [opendatabase], UL, 60, 46
    bmpbutton #main.bmpjanelatamanho, "Data\block.bmp", [inserirtamanho], UL, 638, 6
    bmpbutton #main.bmpjanelanome, "Data\title.bmp", [inserirjanelanome], UL, 638, 46
    bmpbutton #main.bmpsymb, "Data\grafi.bmp", [opensymbols], UL, 98, 46
    bmpbutton #main.bmpvar33, "Data\var33.bmp", [insermostrarvar], UL, 398, 46



    'Define linhas
    graphicbox #main.divide, 7, 35, 225, 1
    graphicbox #main.divide50, 255, 3, 1, 80
    graphicbox #main.divide40, 675, 3, 1, 82
    graphicbox #main.divide70, 7, 87, 667, 1
    graphicbox #main.divide190, 50, 40, 1, 43



    'Criar Janela
    open "Story Game Creator" for window_nf as #main
    print #main, "font ms_sans_serif 0 16"
    'print #main, "fill white; flush"
    print #main, "trapclose [exitengine]"

    '#main.editor "!autoresize"
    '#main.statictext, "!font Courier_new 6 12"
    #main.editor, "!font Courier_new ";FontWidth;" ";FontHeight
    #main.line, "!font Courier_new ";FontWidth;" ";FontHeight
    #main.editor "!setfocus"
    'janelaprincipal = 1
'wait

linenumbers$="1"

 [contador]
 Timer 0
    #main.editor, "!origin? column row "
    linenumbers$=""
    for i = row To row+29
        z=4-len(str$(i))
        z$=""
        for u = 1 to z
            z$=z$;"0"
        next u
        z$= z$;i
        linenumbers$=linenumbers$;z$;CHR$(13)+CHR$(10)
    next i
    if old.linenumbers$<>linenumbers$ then
        #main.line linenumbers$
        old.linenumbers$=linenumbers$
    End if
 Timer 100,[contador]

    wait

'Fechar Programa
[exitengine]

 janelaprincipal = 0
        Timer 0
  close #main

    if janeladata = 1 then close #maindb
    if helpjanela = 1 then close #mainhl
    if janelaanimation = 1 then close #main9
    if janelacor = 1 then close #main3
    if janelapad = 1 then close #mainpad
    if janelasym = 1 then close #mainsym
    if janelaabout = 1 then close #main5
    if janelacorani = 1 then close #main11
    if escolhas = 1 then close #action
    if janeladosom = 1 then close #maindosom
end




'===================================================================================================================================================
[help]
  if helpjanela = 1 then wait
   WindowWidth = 488
   WindowHeight = 380

    texteditor #mainhl.texthelp, 6, 6, 474, 300
    statictext #mainhl.te1, "www.storygamecreator.webs.com", 14, 310, 250, 20


    open "Help" for window_nf as #mainhl
    print #mainhl, "font ms_sans_serif 0 16"
    PRINT #mainhl, "trapclose [helpsair]"
    helpjanela = 1


    print #mainhl.texthelp, "Story Game Creator Help File"
    print #mainhl.texthelp, ""
    print #mainhl.texthelp, "1 - Icons - Help: www.storygamecreator.boards.net/thread/6/icons-help"
    print #mainhl.texthelp, "2 - Don't use CTRL+C to copy or CTRL+V to paste, use the mouse buttons"
    print #mainhl.texthelp, ""
    print #mainhl.texthelp, "========================================================================================"
    print #mainhl.texthelp, "www.storygamecreator.boards.net - Official Forum,if you need help go to the foruns!"
    print #mainhl.texthelp, "========================================================================================"
    print #mainhl.texthelp, ""
    print #mainhl.texthelp, "||||License||||"
    print #mainhl.texthelp, "Copyright (c) 2014 Bruno Silva"
    print #mainhl.texthelp, "This software is provided 'as-is', without any express or implied warranty."
    print #mainhl.texthelp, "Under no circumstances the author be liable for damages or similar events."
    print #mainhl.texthelp, ""
    print #mainhl.texthelp, "> You can sell any material made on Story Game Creator"
    print #mainhl.texthelp, "> You Can't do modifications on the code of Story Game Creator"

wait


[helpsair]
helpjanela = 0
    close #mainhl
wait

[textgenerator]
run "explorer "+q$+"http://www.network-science.de/ascii/"+q$,RESTORE
   wait


   [simpletextascii]
run "notepad "+q$+"Data/Simple Text ASCII.txt"+q$,RESTORE
   wait


[forumhelp]
run "explorer "+q$+"http://storygamecreator.boards.net/"+q$,RESTORE
   wait

[websitehelp]
run "explorer "+q$+"http://storygamecreator.webs.com/"+q$,RESTORE
   wait

[imagetoascii]
run "explorer "+q$+"http://picascii.com/"+q$,RESTORE
   wait

[testar]
kill "testfile.bat"
#main.editor "!contents? t$"
    open "testfile.bat" for output as #f
        print #f, t$ 
    close #f
run "testfile.bat"

wait



[abrir]
filedialog "Open", "*.sty", temp$
    if temp$ <> "" then
        fileName$ = temp$
        open fileName$ for input as #f
        #main.editor, "!contents #f"
        close #f
    end if
    wait

[saveas]
 filedialog "Save", "*.sty", temp$
    if temp$ = "" then wait
    fileName$ = temp$;".sty"


[save]
    if fileName$ = "" then goto [saveas]
    open fileName$ for output as #f
    #main.editor, "!contents? s$"
    print #f, s$
    close #f
    wait

[novo]
    confirm "New Project?";resposta$
    if resposta$="yes" then
    #main.editor "!cls"
    fileName$ = ""
    end if
  wait

[criarJogo]
filedialog "Save As",default$+"*.bat",file$
   if file$="" then wait
   if left$(file$,4)<>".bat" then file$=file$+".bat"
   #main.editor "!contents? t$"
   open file$ for output as #f
   print #f, t$
   close #f
   default$=SeparatePath$(file$)
   #main.editor "!setfocus"
   wait



[inserCena]
cena$ = "Scene"
prompt "Scene Name"; cena$
if cena$ = "" then wait
print #main.escondido, ":";cena$
call paracaixa
print #main.escondido, "cls"
call paracaixa
cena$ = ""
wait


[comentarCode]
print #main.escondido, "::";
call paracaixa
    wait


[insereCore]
if janelacor = 1 then wait
 WindowWidth = 264
 WindowHeight = 190
 UpperLeftX=20
 UpperLeftY=40

    statictext #main3.statictext1, "Select the color", 6, 6, 128, 20
    bmpbutton #main3.0A, "Data\Colors\0A.bmp", [0A], UL, 14, 31
    bmpbutton #main3.0B, "Data\Colors\0B.bmp", [0B], UL, 54, 31
    bmpbutton #main3.0C, "Data\Colors\0C.bmp", [0C], UL, 94, 31
    bmpbutton #main3.0D, "Data\Colors\0D.bmp", [0D], UL, 134, 31
    bmpbutton #main3.OE, "Data\Colors\0E.bmp", [0E], UL, 174, 31
    bmpbutton #main3.0F, "Data\Colors\0F.bmp", [0F], UL, 214, 31
    bmpbutton #main3.01, "Data\Colors\01.bmp", [01], UL, 54, 111
    bmpbutton #main3.02, "Data\Colors\02.bmp", [02], UL, 14, 71
    bmpbutton #main3.03, "Data\Colors\03.bmp", [03], UL, 14, 111
    bmpbutton #main3.04, "Data\Colors\04.bmp", [04], UL, 94, 71
    bmpbutton #main3.05, "Data\Colors\05.bmp", [05], UL, 134, 71
    bmpbutton #main3.06, "Data\Colors\06.bmp", [06], UL, 174, 71
    bmpbutton #main3.07, "Data\Colors\07.bmp", [07], UL, 214, 71
    bmpbutton #main3.08, "Data\Colors\08.bmp", [08], UL, 94, 111
    bmpbutton #main3.09, "Data\Colors\09.bmp", [09], UL, 54, 71

    open "Color" for window_nf as #main3
    print #main3, "font ms_sans_serif 0 16"
    PRINT #main3, "trapclose [corsair]"
    janelacor = 1
wait

[corsair]
    janelacor = 0
        close #main3
    wait


[0A]
    print #main.escondido, "color 0A";
    call paracaixa
    wait


[0B]
print #main.escondido, "color 0B";
    call paracaixa
     wait



[0C]
print #main.escondido, "color 0C";
call paracaixa
    wait


[0D]
print #main.escondido, "color 0D";
  call paracaixa
    wait


[0E]
print #main.escondido, "color 0E";
 call paracaixa
    wait


[0F]
print #main.escondido, "color 0F";
    call paracaixa
    wait


[01]
print #main.escondido, "color 01";
    call paracaixa
    wait


[02]
print #main.escondido, "color 02";
    call paracaixa
     wait


[03]
print #main.escondido, "color 03";
    call paracaixa
    wait


[04]
print #main.escondido, "color 04";
    call paracaixa
     wait


[05]
print #main.escondido, "color 05";
    call paracaixa
    wait


[06]
print #main.escondido, "color 06";
    call paracaixa
     wait


[07]
print #main.escondido, "color 07";
    call paracaixa
    wait


[08]
print #main.escondido, "color 08";
    call paracaixa
    wait


[09]
print #main.escondido, "color 09";
    call paracaixa
    wait



[inserirEscolhas]

    if escolhas = 1 then wait
    WindowWidth = 184
    WindowHeight = 105
    UpperLeftX=80
    UpperLeftY=20

    statictext #action.textoac, "Number of actions:", 6, 1, 144, 20
    statictext #action.statictext15, "You can add more action", 6, 56, 184, 20
    button #action.1, "1", [1], UL, 6, 21, 18, 25
    button #action.2, "2", [2], UL, 30, 21, 18, 25
    button #action.3, "3", [3], UL, 54, 21, 18, 25
    button #action.4, "4", [4], UL, 78, 21, 18, 25
    button #action.5, "5", [5], UL, 102, 21, 18, 25
    button #action.6, "6", [6], UL, 126, 21, 18, 25
    button #action.7, "7", [7], UL, 150, 21, 18, 25

    open "Actions" for window_nf as #action
    print #action, "font ms_sans_serif 0 16"
    PRINT #action, "trapclose [escolhasai]"
    escolhas = 1
    wait

    [escolhasai]
    escolhas = 0
        close #action
    wait


[1]
print #main.escondido, "set com=2"
call paracaixa
print #main.escondido, "set /p com="
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"1";chr$(34);" goto SCENE/ACTION"
call paracaixa
print "goto SCENE"
call paracaixa
    wait


[2]
print #main.escondido, "set com=3"
call paracaixa
print #main.escondido, "set /p com="
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"1";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"2";chr$(34);" goto SCENE/ACTION"
call paracaixa
print "goto SCENE"
call paracaixa
    wait


[3]
print #main.escondido, "set com=4"
call paracaixa
print #main.escondido, "set /p com="
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"1";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"2";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"3";chr$(34);" goto SCENE/ACTION"
call paracaixa
print "goto SCENE"
call paracaixa
wait

[4]
print #main.escondido, "set com=5"
call paracaixa
print #main.escondido, "set /p com="
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"1";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"2";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"3";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"4";chr$(34);" goto SCENE/ACTION"
call paracaixa
print "goto SCENE"
call paracaixa
wait

[5]
print #main.escondido, "set com=6"
call paracaixa
print #main.escondido, "set /p com="
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"1";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"2";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"3";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"4";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"5";chr$(34);" goto SCENE/ACTION"
call paracaixa
print "goto SCENE"
call paracaixa
wait


[6]
print #main.escondido, "set com=7"
call paracaixa
print #main.escondido, "set /p com="
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"1";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"2";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"3";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"4";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"5";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"6";chr$(34);" goto SCENE/ACTION"
call paracaixa
print "goto SCENE"
call paracaixa
wait


[7]
print #main.editor, "set com=8"
call paracaixa
print #main.editor, "set /p com="
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"1";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"2";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"3";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"4";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"5";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"6";chr$(34);" goto SCENE/ACTION"
call paracaixa
print #main.escondido, "if ";chr$(34);"%com%";chr$(34);"==";chr$(34);"7";chr$(34);" goto SCENE/ACTION"
call paracaixa
print "goto SCENE"
call paracaixa
wait




[inserTXT]
inser$ = "File name"
prompt "The .TXT file needs to be in the same location";inser$
if inser$ = "" then wait
print #main.escondido, "TYPE ";inser$;".txt";
call paracaixa

      wait

[inserJanela]
frase$ = "Your mensage"
prompt "Mensage"; frase$
if frase$ = "" then wait
print #main.escondido, "echo msgbox";chr$(34);frase$;chr$(34);">a.vbs&a.vbs&del a.vbs";
call paracaixa
wait


[inserirLinha]
print #main.escondido, "echo. "
call paracaixa


wait



[inserirFala]
print #main.escondido, "echo ";
call paracaixa


    wait


[insertNet]
prompt "Website"; site$
if site$ = "" then wait
prompt "Start Scene or Return to Scene"; iniciocena$
if iniciocena$ = "" then wait
print #main.escondido, "start ";site$
call paracaixa
print #main.escondido,"goto ";iniciocena$
call paracaixa
site$ = ""
iniciocena$ = ""
    wait


'-----------------Sobre Janela-----------------------------------------------------------------
[sobreisto]
if janelaabout = 1 then wait
WindowWidth = 302
WindowHeight = 180
UpperLeftX=int((DisplayWidth-WindowWidth)/2)
UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    open "About" for graphics_nsb_nf as #main5
    print #main5, "fill white; flush"
    print #main5, "font ms_sans_serif 0 16"
    print #main5, "drawbmp aboutimg 0 0; flush"
    PRINT #main5, "trapclose [saidetela]"

    janelaabout = 1
    wait

    [saidetela]
    janelaabout = 0
        close #main5
    wait
'-----------------------------------------------------------------------------------------------------------


[insermenu]
'Use ### para deixar em branco

prompt "Game name (Use ### to blank name)";gamenomedado$
if gamenomedado$ = "" then wait
if gamenomedado$ = "###" then gamenomedado$ = " "
nomedajanela2$ = gamenomedado$

print #main.editor, "@echo off"

print #main.editor, "title ";gamenomedado$

print #main.editor, "color 1B"

print #main.editor, ""

print #main.editor, ""

print #main.editor, ":: This is a simple game start Menu, you can make your own Menu"

print #main.editor, ":StartMenu"

print #main.editor, "cls"

print #main.editor, ""

print #main.editor, "echo."

if gamenomedado$ = " " then print "echo."

if gamenomedado$ <> " "then print #main.editor, "echo                                     ";gamenomedado$

print #main.editor, "echo."

print #main.editor, "echo."

print #main.editor, "echo                              ÚÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿"

print #main.editor, "echo                              ³1.³ ³ Play       ³             "

print #main.editor, "echo                              ÀÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ"

print #main.editor, "echo                              ÚÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿"

print #main.editor, "echo                              ³2.³ ³ Exit       ³             "

print #main.editor, "echo                              ÀÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ"

print #main.editor, "echo                              ÚÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"

print #main.editor, "echo                              ³3.³ ³About/Website³             "

print #main.editor, "echo                              ÀÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"

print #main.editor, "echo."

print #main.editor, "echo."

print #main.editor, "echo   MADE WITH STORY GAME CREATOR"

print #main.editor, ""

print #main.editor, ""

print #main.editor, ""

print #main.editor, "::Comands"

print #main.editor, "set com=4"

print #main.editor, "set /p com="

print #main.editor, "   if "; chr$(34);"%com%";chr$(34);"==";chr$(34);"1";chr$(34); " goto startgame"

print #main.editor, "   if "; chr$(34);"%com%";chr$(34);"==";chr$(34);"2";chr$(34); " exit"

print #main.editor, "   if "; chr$(34);"%com%";chr$(34);"==";chr$(34);"3";chr$(34); " goto about"

print #main.editor, "goto StartMenu"

print #main.editor, ""

print #main.editor, ""

print #main.editor, "::====================About Scene============================"

print #main.editor, ":about"

print #main.editor, "start http://storygamecreator.webs.com/"

print #main.editor, "goto :StartMenu"

print #main.editor, ""

print #main.editor, "::====================Game Scenes============================"

print #main.editor, ":startgame"

print #main.editor, "cls"

print #main.editor, ""

print #main.editor, "echo."

print #main.editor, "echo Welcome to Story Game Creator"

print #main.editor, "echo."

print #main.editor, "echo Game Scene"

print #main.editor, "pause>nul"

gamenomedado$ = ""
   wait

'-----------------------------------------------------------------------------
[insersom]

    nomainwin

    WindowWidth = 208
    WindowHeight = 95
    UpperLeftX=50
    UpperLeftY=300


    button #maindosom.btbeepbt1, "Beep", [bt_beep], UL, 38, 21, 42, 25
    button #maindosom.btvoicesystem, "Voice", [bt_voice], UL, 110, 21, 50, 25
    open "Sound" for window as #maindosom
    print #maindosom, "font ms_sans_serif 0 16"
    print #maindosom, "trapclose [somsair]"
    janeladosom = 1
    wait




[bt_beep]
print #main.escondido, "echo  ";
call paracaixa
wait

[bt_voice]
prompt "Voice text:"; vozquefala$
if vozquefala$ = "" then wait
print #main.editor, "echo StrText=";chr$(34);vozquefala$;chr$(34);"> spk.vbs"
print #main.editor, "echo set ObjVoice=CreateObject(";chr$(34);"SAPI.SpVoice";chr$(34);") >> spk.vbs"
print #main.editor, "echo ObjVoice.Speak StrText >>spk.vbs"
print #main.editor, "start spk.vbs"
wait

[somsair]
janeladosom = 0
close #maindosom
wait
'---------------------------------------------------------------------------------

[inseroff]
print #main.escondido, "@echo off";
call paracaixa
wait

[insercls]
print #main.escondido, "cls";
call paracaixa
wait

[inserstop]
print #main.escondido, "pause>nul";
call paracaixa
wait


[insermake]
prompt "Write a file and save it // File Name"; filenome$
if filenome$ = "" then wait
prompt "Type of file // For example : .txt or .bat"; filetipo$
if filetipo$ = "" then wait
print #main.escondido, "("
call paracaixa
print #main.escondido, "echo TEXT"
call paracaixa
print #main.escondido, "echo TEXT"
call paracaixa
print #main.escondido, "echo TEXT"
call paracaixa
print #main.escondido, ")>";filenome$;filetipo$
call paracaixa
wait

[insercallfile]
prompt "Call a File // Files like Data.txt or Data.Bat ..."; ficheirochamado$
if ficheirochamado$ = "" then wait
print #main.escondido, "CALL ";ficheirochamado$
call paracaixa
wait

[insersaidajogo]
print #main.escondido, "exit";
call paracaixa
wait


[inserirjanelanome]
prompt "Game Window name (Game Name)"; nomedajanela2$
if nomedajanela2$ = "" then wait
print #main.escondido, "title ";nomedajanela2$
call paracaixa
wait

[inserirtamanho]
prompt "Window Size - Lines: "; tmhjanela$
if tmhjanela$ = "" then wait
prompt "Window Size - Cols: "; tmhjanela2$
if tmhjanela2$ = "" then wait

Print #main.escondido, "mode con cols=";tmhjanela2$;" lines=";tmhjanela$;" >nul"
call paracaixa
wait


[insermostrarvar]
prompt "Variable Name"; nomedavare$
if nomedavare$ = "" then wait

Print #main.escondido, "%";nomedavare$;"%";
call paracaixa

nomedavare$ = ""

wait



' ============================== Janela de criação de animação ===========================================
[inseranimationwindow]
    if janelaanimation = 1 then wait
    WindowWidth = 488
    WindowHeight = 405
    UpperLeftX=100
    UpperLeftY=20

    'Texto editor
    texteditor #main9.anieditor, 6, 116, 464, 240
    texteditor #main9.escondidoani, -1000,0,500,500


    'Botões
    button #main9.btcopy, "Copy", [copiar], UL, 6, 86, 42, 25
    bmpbutton #main9.btanicor, "Data\cores.bmp", [anicor], UL, 14, 11
    bmpbutton #main9.btaniclean, "Data\cls.bmp", [anilimpa], UL, 54, 11
    bmpbutton #main9.btaniloop, "Data\loop.bmp", [btaniloop], UL, 94, 11
    bmpbutton #main9.btanigoto, "Data\goto.bmp", [btanigoto], UL, 134, 11
    bmpbutton #main9.btanispeed, "Data\animationspeed.bmp", [anispeed], UL, 174, 11
    button #main9.btanisave, "Save Animation", [anisave], UL, 334, 6, 122, 25
    button #main9.btaniload, "Load Animation", [aniload], UL, 334, 41, 122, 25
    bmpbutton #main9.btanitexto, "Data\linha.bmp", [anilinha2], UL, 214, 11
    bmpbutton #main9.btanibranco, "Data\Linha vazia.bmp", [anibranco], UL, 254, 11
    graphicbox #main9.divide2, 310, 3, 1, 108
    graphicbox #main9.divide3, 320, 69, 140, 1
    bmpbutton #main9.btanitexto, "Data\play.bmp", [anitesta], UL, 320, 74
    bmpbutton #main9.anioff, "Data\off.bmp", [inseroffani], UL, 14, 50
    bmpbutton #main9.anipausa, "Data\stop2.bmp", [inseropausaani], UL, 54, 50
    bmpbutton #main9.bmptexto2, "Data\importar txt.bmp", [inseranitxt], UL, 94, 50
    bmpbutton #main9.bmpsnd2ani, "Data\snd.bmp", [insersomani2], UL, 134, 50

    'Opções
    menu #main9, "File", "Open", [aniload], "Save", [anisave],|,"Exit Animation Editor", [saidaanaimation]
    menu #main9, "Edit"
    menu #main9, "ASCII", "ASCII Generator",[textgenerator], "Image to ASCII",[imagetoascii]

      'Janela
    open "Animation" for window_nf as #main9
    print #main9, "font ms_sans_serif 0 16"
    PRINT #main9, "trapclose [saidaanaimation]"
janelaanimation = 1
wait

[saidaanaimation]
  janelaanimation = 0
        close #main9

        if janelacorani = 1 then
        janelacorani = 0
        close #main11
        else
        wait
        end if

    wait

[insersomani2]
print #main9.escondidoani, "echo  ";
call paracaixaani
wait

[inseranitxt]
insertxt2$ = "File name"
prompt "The .TXT file needs to be in the initial folder";insertxt2$
if insertxt2$ = "" then wait
print #main9.escondidoani, "TYPE ";insertxt2$;".txt";
call paracaixaani

      wait


[copiar]
  #main9.anieditor "!selectall"
  #main9.anieditor "!copy"
    wait

[inseroffani]
 print #main9.escondidoani, "@echo off"
    call paracaixaani
    wait

[inseropausaani]
 print #main9.escondidoani, "pause>nul"
    call paracaixaani
    wait

[anicor]
if janelacorani = 1 then wait
 WindowWidth = 264
 WindowHeight = 190
 UpperLeftX=int((DisplayWidth-WindowWidth)/2)
 UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    statictext #main11.statictext69, "Select the color", 6, 6, 128, 20
    bmpbutton #main11.0A0, "Data\Colors\0A.bmp", [0A0], UL, 14, 31
    bmpbutton #main11.0B0, "Data\Colors\0B.bmp", [0B0], UL, 54, 31
    bmpbutton #main11.0C0, "Data\Colors\0C.bmp", [0C0], UL, 94, 31
    bmpbutton #main11.0D0, "Data\Colors\0D.bmp", [0D0], UL, 134, 31
    bmpbutton #main11.OE0, "Data\Colors\0E.bmp", [0E0], UL, 174, 31
    bmpbutton #main11.0F0, "Data\Colors\0F.bmp", [0F0], UL, 214, 31
    bmpbutton #main11.010, "Data\Colors\01.bmp", [010], UL, 54, 111
    bmpbutton #main11.020, "Data\Colors\02.bmp", [020], UL, 14, 71
    bmpbutton #main11.030, "Data\Colors\03.bmp", [030], UL, 14, 111
    bmpbutton #main11.040, "Data\Colors\04.bmp", [040], UL, 94, 71
    bmpbutton #main11.050, "Data\Colors\05.bmp", [050], UL, 134, 71
    bmpbutton #main11.060, "Data\Colors\06.bmp", [060], UL, 174, 71
    bmpbutton #main11.070, "Data\Colors\07.bmp", [070], UL, 214, 71
    bmpbutton #main11.080, "Data\Colors\08.bmp", [080], UL, 94, 111
    bmpbutton #main11.090, "Data\Colors\09.bmp", [090], UL, 54, 71

    open "Color" for window_nf as #main11
    print #main11, "font ms_sans_serif 0 16"
    PRINT #main11, "trapclose [corsairani]"
    janelacorani = 1
wait

[corsairani]
    janelacorani = 0
        close #main11
    wait


[0A0]
    print #main9.escondidoani, "color 0A";
    call paracaixaani
    wait


[0B0]
print #main9.escondidoani, "color 0B";
    call paracaixaani
     wait



[0C0]
print #main9.escondidoani, "color 0C";
call paracaixaani
    wait


[0D0]
print #main9.escondidoani, "color 0D";
  call paracaixaani
    wait


[0E0]
print #main9.escondidoani, "color 0E";
 call paracaixaani
    wait


[0F0]
print #main9.escondidoani, "color 0F";
    call paracaixaani
    wait


[010]
print #main9.escondidoani, "color 01";
    call paracaixaani
    wait


[020]
print #main9.escondidoani, "color 02";
    call paracaixaani
     wait


[030]
print #main9.escondidoani, "color 03";
    call paracaixaani
    wait


[040]
print #main9.escondidoani, "color 04";
    call paracaixaani
     wait


[050]
print #main9.escondidoani, "color 05";
    call paracaixaani
    wait


[060]
print #main9.escondidoani, "color 06";
    call paracaixaani
     wait


[070]
print #main9.escondidoani, "color 07";
    call paracaixaani
    wait


[080]
print #main9.escondidoani, "color 08";
    call paracaixaani
    wait


[090]
print #main9.escondidoani, "color 09";
    call paracaixaani
    wait






[anilimpa]
print #main9.escondidoani, "cls";
call paracaixaani
    wait


[btaniloop]
prompt "Loop name"; nomedoloop$
if nomedoloop$ = "" then wait
prompt "Go to loop"; vaiparaloop$
if vaiparaloop$ = "" then wait
print #main9.escondidoani, ":";nomedoloop$
call paracaixaani
print #main9.escondidoani,"goto ";vaiparaloop$
call paracaixaani
nomedoloop$ = ""
vaiparaloop$ = ""

    wait


[btanigoto]
prompt "Go to Loop"; loopmarcado$ 
if loopmarcado$ = "" then wait
print #main9.escondidoani, "goto " ; loopmarcado$;
    call paracaixaani
    loopmarcado$ = ""
    wait


[anispeed]
print #main9.escondidoani, "ping localhost -n 1 >nul";
call paracaixaani
    wait


[anisave]
filedialog "Save As",default$+"*.stya",file$
   if file$="" then wait
   if left$(file$,4)<>".stya" then file$=file$+".stya"
   #main9.anieditor "!contents? t$"
   open file$ for output as #f
   print #f, t$
   close #f
   default$=SeparatePath$(file$)
   #main9.anieditor "!setfocus"
    wait


[aniload]
filedialog "Open",nowPath$+"*.Story Animation;*.stya",file$
    if file$="" then wait
    open file$ for input as #f
    #main9.anieditor "!contents #f"
    close #f
    nowPath$=SeparatePath$(file$)
    #main9.anieditor "!setfocus"
    wait
    wait


[anilinha2]
 print #main9.escondidoani, "echo ";
    call paracaixaani
    wait



[anibranco]
 print #main9.escondidoani, "echo. ";
    call paracaixaani
    wait

[anitesta]
kill "testfile.bat"
#main9.anieditor "!contents? t$"
    open "testfile.bat" for output as #f
        print #f, t$ 
    close #f
run "testfile.bat"
wait



'======================================Editor da DataBase ===========================================================
[opendatabase]

if janeladata = 1 then wait
    WindowWidth = 472
    WindowHeight = 330
    UpperLeftX=20
    UpperLeftY=100

    menu #maindb, "File", "Open", [dbopen], "Save", [dbsavet],|,"Export to .bat", [dbExporttobat]
    menu #maindb, "Edit"

    texteditor #maindb.escondidodb, -1000,0,500,500
    texteditor #maindb.textdata, 6, 36, 456, 240

    button #maindb.btdbexport, "Export to .Bat", [dbExporttobat], UL, 134, 6, 122, 25
    button #maindb.btdbexport, "Save", [dbsavet], UL, 280, 6, 70, 25
    button #maindb.btdbexport, "Open", [dbopen], UL, 370, 6, 70, 25
    button #maindb.tbdbvar, "Set Variable", [inservardb], UL, 6, 6, 106, 25

    graphicbox #maindb.divide6969, 123, 2, 1, 30

     open "DataBase Editor" for window_nf as #maindb
    print #maindb, "font ms_sans_serif 0 16"
    PRINT #maindb, "trapclose [saidadb]"
    janeladata = 1
wait

[dbExporttobat]
filedialog "Save As",default$+"*.bat",file$
   if file$="" then wait
   if left$(file$,4)<>".bat" then file$=file$+".bat"
   #maindb.textdata "!contents? t$"
   open file$ for output as #f
   print #f, t$
   close #f
   default$=SeparatePath$(file$)
   #maindb.textdata "!setfocus"
    wait




[inservardb]
prompt "Variable Name";varnome$
if varnome$ = "" then wait
prompt "Variable Value";varvalor$
if varvalor$ = "" then wait
print #maindb.escondidodb, "set ";varnome$;"=";varvalor$
call paracaixadb
varnome$ = ""
varvalor$ = ""
wait

[dbsavet]
filedialog "Save As",default$+"*.styd",file$
   if file$="" then wait
   if left$(file$,4)<>".styd" then file$=file$+".styd"
   #maindb.textdata "!contents? t$"
   open file$ for output as #f
   print #f, t$
   close #f
   default$=SeparatePath$(file$)
   #maindb.textdata "!setfocus"
    wait

[dbopen]
filedialog "Open",nowPath$+"*.Story Data;*.styd",file$
    if file$="" then wait
    open file$ for input as #f
    #maindb.textdata "!contents #f"
    close #f
    nowPath$=SeparatePath$(file$)
    #maindb.textdata "!setfocus"
    wait


[saidadb]
    janeladata = 0
        close #maindb
    wait

'=========================================ASCII Text=========================================================


    WindowWidth = 528
    WindowHeight = 405

    texteditor #maintext.simpletext2, 6, 16, 512, 355
    open "Simple ASCII Text" for window as #maintext
    print #maintext, "font ms_sans_serif 0 16"



'==========================================Editor de Notas/Apontamentos=============================================================
[notas]

if janelapad = 1 then wait

    WindowWidth = 550
    WindowHeight = 345
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)

    texteditor #mainpad.notepad, 1, 31, 532, 254
    button #mainpad.btn_savenotas, "Save Notes", [savenotas], UL, 3, 4, 90, 25
    button #mainpad.btnloadnotes, "Load Notes", [abrirnotas2], UL, 97, 4, 90, 25
    open "Notes" for window as #mainpad
    print #mainpad, "font ms_sans_serif 0 16"
    print #mainpad.notepad, "!autoresize"
    PRINT #mainpad, "trapclose [saidapad]"
    janelapad = 1


wait

[savenotas]
filedialog "Save As",default$+"*.txt",file$
   if file$="" then wait
   if left$(file$,4)<>".txt" then file$=file$+".txt"
   #mainpad.notepad "!contents? t$"
   open file$ for output as #f
   print #f, t$
   close #f
   default$=SeparatePath$(file$)
   #mainpad.notepad "!setfocus"
   wait



[abrirnotas2]
filedialog "Open",nowPath$+"*.Stytxt;*.txt",file$
    if file$="" then wait
    open file$ for input as #f
    #mainpad.notepad "!contents #f"
    close #f
    nowPath$=SeparatePath$(file$)
    #mainpad.notepad "!setfocus"
    wait


[saidapad]

janelapad = 0
    close #mainpad
wait


'===============================================================Janela de Simbolos=======================================================================================================
'========================================================================================================================================================================================

    [opensymbols]

    if janelasym = 1 then wait

    WindowWidth = 208
    WindowHeight = 200
    UpperLeftX=50
    UpperLeftY=50

    bmpbutton #mainsym.btn1p, "Data\sym\1.bmp", [1cc], UL, 6, 6
    bmpbutton #mainsym.btn2p, "Data\sym\2.bmp", [2cc], UL, 38, 6
    bmpbutton #mainsym.bnt3p, "Data\sym\3.bmp", [3cc], UL, 70, 6
    bmpbutton #mainsym.bnt4p, "Data\sym\4.bmp", [4cc], UL, 102, 6
    bmpbutton #mainsym.bnt5p, "Data\sym\5.bmp", [5cc], UL, 134, 6
    bmpbutton #mainsym.bnt6p, "Data\sym\6.bmp", [6cc], UL, 166, 6
    bmpbutton #mainsym.bnt7p, "Data\sym\7.bmp", [7cc], UL, 6, 36
    bmpbutton #mainsym.bnt8p, "Data\sym\8.bmp", [8cc], UL, 38, 36
    bmpbutton #mainsym.bnt9p, "Data\sym\9.bmp", [9cc], UL, 70, 36
    bmpbutton #mainsym.bnt10p, "Data\sym\10.bmp", [10cc], UL, 102, 36
    bmpbutton #mainsym.bnt12p, "Data\sym\12.bmp", [12cc], UL, 134, 36
    bmpbutton #mainsym.bnt13p, "Data\sym\13.bmp", [13cc], UL, 6, 66
    bmpbutton #mainsym.btn14p, "Data\sym\14.bmp", [14cc], UL, 38, 66
    bmpbutton #mainsym.bnt15p, "Data\sym\15.bmp", [15cc], UL, 70, 66
    bmpbutton #mainsym.bnt16p, "Data\sym\16.bmp", [16cc], UL, 102, 66
    bmpbutton #mainsym.bnt17p, "Data\sym\17.bmp", [17cc], UL, 134, 66
    bmpbutton #mainsym.bnt18p, "Data\sym\19.bmp", [18cc], UL, 166, 66
    bmpbutton #mainsym.bnt19p, "Data\sym\20.bmp", [19cc], UL, 6, 96
    bmpbutton #mainsym.bnt20p, "Data\sym\21.bmp", [20cc], UL, 38, 96
    bmpbutton #mainsym.bnt21p, "Data\sym\22.bmp", [21cc], UL, 70, 96
    bmpbutton #mainsym.bnt22p, "Data\sym\24.bmp", [22cc], UL, 102, 96
    bmpbutton #mainsym.bnt23p, "Data\sym\25.bmp", [23cc], UL, 134, 96
    bmpbutton #mainsym.bnt24p, "Data\sym\26.bmp", [24cc], UL, 166, 36
    bmpbutton #mainsym.bntecho4, "Data\linha.bmp", [inserecho4], UL, 6, 128


    open "Graphics Window" for window_nf as #mainsym
    print #mainsym, "font ms_sans_serif 0 16"
    print #mainsym, "trapclose [saidasym]"
    janelasym = 1
    wait


[main.inputLoop]   'wait here for input event
    wait

[saidasym]
janelasym = 0
close #mainsym
wait


[1cc]

print #main.escondido, "Á";
call paracaixa
    wait


[2cc]
print #main.escondido, "À";
call paracaixa
    wait


[3cc]
print #main.escondido, "Å";
call paracaixa
    wait


[4cc]
print #main.escondido, "Ä";
call paracaixa
    wait


[5cc]

print #main.escondido, "É";
call paracaixa
    wait

[6cc]
print #main.escondido, "È";
call paracaixa
    wait


[7cc]
print #main.escondido, "Í";
call paracaixa
    wait
[8cc]
print #main.escondido, "Ì";
call paracaixa
    wait


[9cc]
print #main.escondido, "Î";
call paracaixa
    wait


[10cc]
print #main.escondido, "î";
call paracaixa
    wait


[12cc]
print #main.escondido, "ö";
call paracaixa
    wait


[13cc]
print #main.escondido, "Ú";
call paracaixa
    wait

[14cc]
print #main.escondido, "ú";
call paracaixa
    wait



[15cc]
print #main.escondido, "Ù";
call paracaixa
    wait



[16cc]
print #main.escondido, "ù";
call paracaixa
    wait

[17cc]
print #main.escondido, "ß";
call paracaixa
    wait

[18cc]
print #main.escondido, "°";
call paracaixa
    wait


[19cc]
print #main.escondido, "±";
call paracaixa
    wait



[20cc]
print #main.escondido, "²";
call paracaixa
    wait


[21cc]
print #main.escondido, "Û";
call paracaixa
    wait


[22cc]
print #main.escondido, "Ú";
call paracaixa
    wait


[23cc]
print #main.escondido, "¿";
call paracaixa
    wait



[24cc]
print #main.escondido, "Â";
call paracaixa
    wait

[inserecho4]
print #main.escondido, "echo ";
call paracaixa
    wait










'===========================================================================================================
'===========================================================================================================

sub saveas
    filedialog "Save as...", "*.sty", s$
    if s$ <> "" then
        FILENAME$ = s$
        call save
    end if
end sub

sub save
    if FILENAME$ = "" then
        call saveas
    else
        open FILENAME$ for output as #f
        #main.editor, "!contents? a$"
        #f, a$
        close #f
    end if
end sub


Function SeparatePath$(f$)
    fileindex=Len(f$)
    filelength=Len(f$)
      While Mid$(f$, fileindex,1)<>"\"
        fileindex=fileindex-1
      Wend
    SeparatePath$=Left$(f$,fileindex)
    End Function


 Sub paracaixa
    #main.escondido "!selectall"
    #main.escondido "!copy"
    #main.editor "!paste"
    #main.escondido "!cls"
    #main.editor "!setfocus"
    '#main.escondido " "
    '#main.escondido "!selectall"
    #main.escondido "!copy"
    end sub


 Sub paracaixaani
    #main9.escondidoani "!selectall"
    #main9.escondidoani "!copy"
    #main9.anieditor "!paste"
    #main9.escondidoani "!cls"
    #main9.anieditor "!setfocus"
    '#main9.escondidoani " "
    '#main9.escondidoani "!selectall"
    #main9.escondidoani "!copy"
    end sub

 Sub paracaixadb
    #maindb.escondidodb "!selectall"
    #maindb.escondidodb "!copy"
    #maindb.textdata "!paste"
    #maindb.escondidodb "!cls"
    #maindb.textdata "!setfocus"
    '#maindb.escondidodb " "
    '#maindb.escondidodb "!selectall"
    #maindb.escondidodb "!copy"
    end sub

