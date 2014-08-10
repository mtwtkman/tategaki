" YOKOGAKI to TATEGAKI
" Version: 0.1
" Author boku (https://github.com/mtwtkman)
" License: WTFPL

if  exists('g:loaded_tategaki')
  finish
endif
let g:loaded_tategaki = 1

if exists('g:okyo_path')
  finish
endif
let g:okyo_path = expand('~/.vim/bundle/tategaki/autoload/okyo/hannyasingyo.txt')

let s:save_cpo=&cpo
set cpo&vim

command! -nargs=1 Tategaki call tategaki#translate(<q-args>)
command! -nargs=0 Hannyasingyo call tategaki#hannyasingyo()

let &cpo = s:save_cpo
unlet s:save_cpo
