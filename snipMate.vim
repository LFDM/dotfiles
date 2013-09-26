" snipMate maps
" These maps are created here in order to make sure we can reliably create maps
" after SuperTab.

let s:save_cpo = &cpo
set cpo&vim

function! s:map_if_not_mapped(lhs, rhs, mode)
    let l:unique = s:overwrite ? '' : ' <unique>'
    if !hasmapto(a:rhs, a:mode)
	silent! exe a:mode . 'map' . l:unique a:lhs a:rhs
    endif
endfunction

if !exists('g:snips_no_mappings') || !g:snips_no_mappings
	if exists('g:snips_trigger_key')
		echom 'g:snips_trigger_key is deprecated. See :h snipMate-mappings'
		exec 'imap <unique>' g:snips_trigger_key '<Plug>snipMateTrigger'
		exec 'smap <unique>' g:snips_trigger_key '<Plug>snipMateSNext'
		exec 'xmap <unique>' g:snips_trigger_key '<Plug>snipMateVisual'
	else
		" Remove SuperTab map if it exists
		let s:overwrite = maparg('<c-j>', 'i') ==? '<Plug>SuperTabForward'
		call s:map_if_not_mapped('<c-j>', '<Plug>snipMateNextOrTrigger', 'i')
		call s:map_if_not_mapped('<c-j>', '<Plug>snipMateNextOrTrigger', 's')
		let s:overwrite = 0
		call s:map_if_not_mapped('<c-j>', '<Plug>snipMateVisual', 'x')
	endif

	if exists('g:snips_trigger_key_backwards')
		echom 'g:snips_trigger_key_backwards is deprecated. See :h snipMate-mappings'
		exec 'imap <unique>' g:snips_trigger_key_backwards '<Plug>snipMateIBack'
		exec 'smap <unique>' g:snips_trigger_key_backwards '<Plug>snipMateSBack'
	else
		let s:overwrite = maparg('<c-k>', 'i') ==? '<Plug>SuperTabBackward'
		call s:map_if_not_mapped('<c-k>', '<Plug>snipMateBack', 'i')
		call s:map_if_not_mapped('<c-k>', '<Plug>snipMateBack', 's')
		let s:overwrite = 0
	endif

	call s:map_if_not_mapped('<C-R><Tab>', '<Plug>snipMateShow', 'i')
endif

" FIXME: Without this map, <BS> in select mode deletes the current selection and
" returns to normal mode. This doesn't update placeholders. Ideally there's some
" way to update the placeholders without this otherwise useless map.
silent! snoremap <unique> <BS> b<BS><Esc>

let &cpo = s:save_cpo

" vim:noet:
