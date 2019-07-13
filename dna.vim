" Vim syntax file
" Language: DNA Dynamic Network Analysis
" Maintainer: Martin Michel
" Last Revision: 2012-11-29
" Latest Revision: 2014-05-11
"

if exists ("b:current_syntax")
    finish
endif

syn case ignore

syn keyword basicLanguageKeyword TITLE STRUC MEDIA FLUID SOLID SHAFT ADDCO INICO VARPA INIST START NAMES UPDAT SIMUL NOSIMUL PARAM STATE COMNT 
syn keyword parameterUnit M E T P H X Q X_J Y_J
syn region commentLine start=/^C / end=/\n/

syn match xIf /ADDANODE\|VALVE_01\|VALVE_02\|VALVE_03\|CON_VAL3\|STHF2H2OG\|H2OG2STHF/ nextgroup=xIfCondition2N skipwhite
syn match xIf /SPLITTER\|PRESSO_1\|SOLSPLIT\|FLOWMET1\|FLOWMET1\|TEMPO_1\|MIXER_01/ nextgroup=xIfCondition3N skipwhite

" STRUC which need 2 nodes and 5 parameter:
syn match xIf /HEATDUC0/ nextgroup=xIfCondition2N5P skipwhite 
" STRUC which need 2 nodes and 6 parameter:
syn match xIf /HEATDUC1\|HEATDUC2/ nextgroup=xIfCondition2N6P skipwhite 
" STRUC which need 3 nodes and 1 parameter:
syn match xIf /HEATSNK0\|FRCSPLIT\|SIM_BOIL\|TURBIN_1\|CONVAL_1\|LIQPUM_1\|SIM_GENE\|STECON_0/ nextgroup=xIfCondition3N1P skipwhite 
" STRUC which need 3 nodes and 2 parameter:
syn match xIf /DIS_HEAT\|TURBIN_2\|TURBIN_3/ nextgroup=xIfCondition3N2P skipwhite 
" STRUC which need 3 nodes and 3 parameter:
syn match xIf /TURBIN_4\|WAT_STO1/ nextgroup=xIfCondition3N3P skipwhite 
" STRUC which need 4 nodes and 6 parameter:
syn match xIf /HEATEX_7/ nextgroup=xIfCondition4N6P skipwhite 
" STRUC which need 4 nodes and 2 parameter:
syn match xIf /STECON_1\|COMPRE_1\|GASBUR_1\|GASBUR_2/ nextgroup=xIfCondition4N2P skipwhite 
" STRUC which need 4 nodes and 1 parameter:
syn match xIf /GASBUR_3\|GASCLE_1\|WATMIX_1\|ATTEMP_1/ nextgroup=xIfCondition4N1P skipwhite 
" STRUC which need 4 nodes and 3 parameter:
syn match xIf /COMPRE_3/ nextgroup=xIfCondition4N3P skipwhite 
" STRUC which need 5 nodes and 1 parameter:
syn match xIf /STEDRU_0\|STEDRU_1/ nextgroup=xIfCondition5N1P skipwhite 
" STRUC which need 5 nodes and 2 parameter:
syn match xIf /HEATEX_1\|SOLBUR_4\|DRYER_0[1-3]/ nextgroup=xIfCondition5N2P skipwhite 
" STRUC which need 5 nodes and 3 parameter:
syn match xIf /HEATEX_2\|HEATEX_3\|HEATEX_4\|XHEATEX1\|HEATEX14/ nextgroup=xIfCondition5N3P skipwhite 
" STRUC which need 6 nodes and 3 parameter:
syn match xIf /GASCOOL1/ nextgroup=xIfCondition6N2P skipwhite 

for k in range(2,4)
        let s:countN = k
        execute 'syn match xIfCondition'.s:countN.'N /\(\d\+\( \|\n\)\)\{'.s:countN.'}/ contained skipwhite'
        execute 'highlight link xIfCondition'.s:countN.'N Define'
    endfor
unlet s:countN

for i in range(1,7)
    let s:countP = i
    execute 'syn match xThen'.s:countP.'P /\(\d\+\.\d*\( \|\n\)\)\{'.s:countP.'}/ contained skipwhite'
    execute 'highlight link xThen'.s:countP.'P Float'
    for j in range(2,6)
        let s:countN = j
        execute 'syn match xIfCondition'.s:countN.'N'.s:countP.'P /\(\d\+ \)\{'.s:countN.'}/ contained nextgroup=xThen'.s:countP.'P skipwhite'
        execute 'highlight link xIfCondition'.s:countN.'N'.s:countP.'P Define'
    endfor
endfor
unlet s:countP s:countN

highlight Para term=bold ctermfg=60 guifg=#80a0ff gui=bold
highlight link xIf Statement
highlight link basicLanguageKeyword Type
highlight link parameterUnit Para
highlight link commentLine Comment 
let b:current_syntax = "dna"

