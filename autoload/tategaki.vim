
let s:save_cpo = &cpo
set cpo&vim

function! tategaki#translate(src_file)

  let l:lines = readfile(a:src_file)
  let l:src = []
  let l:line_list = []

  for l in l:lines
    let l:line_list += split(l, '\zs')
    let l:src += [l:line_list]
    let l:line_list = []
  endfor

  let l:src_max_col_length = 0

  for s in l:src
    if l:src_max_col_length < len(s)
      let l:src_max_col_length = len(s)
    endif
  endfor

  let l:tmp = []

  for i in l:src
    while len(i) < l:src_max_col_length
      let l:i += [('　')]
    endwhile

    call reverse(i)
    let l:tmp += [i]

  endfor

  let l:new_src = []
  let l:row_str = ''

  call reverse(l:tmp)

  for j in range(l:src_max_col_length)
    for row in l:tmp
      let l:row_str = l:row_str . row[j]
    endfor

    let l:new_src += [[l:row_str]]
    let l:row_str = ''

  endfor

  silent! tabe 'tategaki'
  let l:c = 0

  for k in l:new_src
    call append(l:c, join(k, ''))
  endfor

  setlocal buftype=nofile
  setlocal noswapfile
  setlocal undolevels=-1

endfunction

function! tategaki#hannyasingyo()
  call tategaki#translate(g:okyo_path)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
