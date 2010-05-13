if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	au! BufRead,BufNewFile *.fst setfiletype faust
	au! BufRead,BufNewFile *.dsp setfiletype faust
	au! BufRead,BufNewFile *.pdc setfiletype pdc
	au! BufRead,BufNewFile *.ms  setfiletype nroff
augroup END
