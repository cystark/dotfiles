function! statusline#gutterpadding(subtractBufferNumber) abort
  let l:gutterWidth=max([strlen(line('$')), &numberwidth]) + 1
  let l:bufferNumberWidth=a:subtractBufferNumber ? strlen(winbufnr(0)) : 0
  let l:padding=repeat(' ', l:gutterWidth - l:bufferNumberWidth - 1)
  return l:padding
endfunction

function! statusline#ft() abort
  if strlen(&ft)
    return ',' . &ft
  else
    return ''
  endif
endfunction

function! statusline#fenc() abort
  if strlen(&fenc) && &fenc !=# 'utf-8'
    return ',' . &fenc
  else
    return ''
  endif
endfunction

function! statusline#update_highlight() abort
  " Update StatusLine to use italics.
  let l:highlight = functions#italicize_group('StatusLine')
  execute 'highlight User1 ' . l:highlight

  " Update MatchParen to use italics.
  let l:highlight = functions#italicize_group('MatchParen')
  execute 'highlight User2 ' . l:highlight

  " Make not-current window status lines visible against ColorColumn background.
  " Note that we can't use an exact copy of StatusLine here because in that case
  " Vim will helpfully(?) fill in the background with "^^^".
  highlight clear StatusLineNC
  highlight! link StatusLineNC User2
endfunction