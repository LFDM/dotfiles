" File: UltiSnips.vim
" Author: Holger Rapp <SirVer@gmx.de>
" Description: The Ultimate Snippets solution for Vim
"
" Testing Info: {{{
"   See directions at the top of the test.py script located one 
"   directory above this file.
" }}}

" don't finish, because you'll get other annoying messages about missing .Py
" then
if &compatible | echoe "UltiSnips requires :set nocompatible - you should have it set for many reasons" | endif

" bind g:UltiSnips to local name s:c for convenience
if !exists('g:UltiSnips') | let g:UltiSnips = {} | endif | let s:c = g:UltiSnips

" Define dummy version of function called by autocommand setup in
" ftdetect/UltiSnips.vim.  If the function isn't defined (probably due to
" using a copy of vim without python support) it will cause an error anytime a
" new file is opened.
function! UltiSnips_FileTypeChanged()
endfunction

" Global Variables, user interface configuration {{{

" Should UltiSnips unmap select mode mappings automagically?
let s:c['RemoveSelectModeMappings'] = get(s:c, 'RemoveSelectModeMappings', 1)

" If UltiSnips should remove Mappings, which should be ignored
let s:c['MappingsToIgnore'] = get(s:c, 'MappingsToIgnore', [])

" If the expand key doesn't trigger any snippet, show completion menu with
" possible matches? Eg foo will be completed to foobar snippet name then
let s:c['CompletionMenu'] = get(s:c, 'CompletionMenu', 1)

let s:c['empty_lines_add_indent'] = get(s:c, 'empty_lines_add_indent', 1)

" Set to 1 to make tools like YouCompleteMe find UltiSnips which tries to
" import the python classes
" I don't like early loading of Python always because it could interfer with
" other plugins or slow down Vim startup
let s:c['setup_py_path_early'] = get(s:c, 'load_early', 0)

" A list of directory names that are searched for snippets.
" Why is this necessary?
" let s:c['SnippetDirectories'] = get(s:c, 'SnippetDirectories', [ "UltiSnips" ] )

" Which snippet files to use ? {{{1
" The default implementation is written in VimL and called
" SnippetFilesForCurrentExpansionDefaultImplementation.
" If you want to customize it just assign your own function.
" If you want to do it in python call it from within a Vim function.
" This way you can do both: define it lazily and call it.
let s:c.SnippetFilesForCurrentExpansion = get(s:c, 'SnippetFiles', 'UltiSnips#SnippetFilesForCurrentExpansionDefaultImplementation' )

let s:c.ChooseSnippetFileToEdit = get(s:c, 'SnippetFiles', 'UltiSnips#ChooseSnippetFileToEditDefaultImplementation' )

" The default implementation first gathers all .snippet files found in any
" location matching such a glob pattern: &runtimepath/UltiSnips/*.snippets
" Thus any plugin in your &runtimepath can provide snippets.
" Then the list of all snippet files is filtered by filetype and regular
" expression matching the directory of the file. This way you can easily
" choose to use your own snippets only by setting ft_filter to this:
" { 'default': {'filetypes': ["FILETYPE"], 'dir-regex': '[._]vim/UltiSnips$' } }
" FILETYPE will be replaced by &filetype. 'default' key is used if no filetype
" specific filter is set.
let s:c.UltiSnips_ft_filter = get(s:c, 'UltiSnips_ft_filter', {
            \ 'default' : {'filetypes': ["all", "FILETYPE"] },
            \ 'html'    : {'filetypes': ["all", "html", "javascript"] },
            \ 'xhtml'    : {'filetypes': ["all", "html"] },
            \ 'cpp'    : {'filetypes': ["all", "cpp", "c"] },
            \ 'zsh'    : {'filetypes': ["all", "zsh", "sh"] },
            \ 'tex'    : {'filetypes': ["all", "tex", "texmath"] },
            \ })

" don't load snipmate snippets by default
let s:c.snipmate_ft_filter = get(s:c, 'snipmate_ft_filter', {
            \ 'default' : {'filetypes': [] },
            \ })
" }}}

" UltiSnipsEdit will use this variable to decide if a new window
" is opened when editing. default is "e", allowed are also
" "split", "vpslit"
let s:c['EditSplit'] = get(s:c, 'EditSplit', "e" )
let s:old_to_new = {'normal': 'e', 'vertical': 'vsplit', 'horizontal': 'sp'}
if has_key(s:old_to_new, s:c.EditSplit)
  let s:c.EditSplit = s:old_to_new[s:c.EditSplit]
endif


let s:c['debug_snipmate_conversion'] = get(s:c, 'debug_snipmate_conversion', 0)

" If there are multiple snippets matching a trigger the first one will be
" chosen always if you set this to 1. This is useful if you have both:
" UltiSnips and snipmate-snippets - and want the UltiSnips snippets to take
" precedence.
let s:c['always_use_first_snippet'] = get(s:c, 'always_use_first_snippet', 0)

" select python version, be backward compatible
" in the future just set PyCommand yourself
if exists('g:UsePythonVersion')
  let s:c['PyCommand'] =  {2: ':py ', 3: ':py3 '}[g:UsePythonVersion]
endif
" PyCommand is set below

" expand snippet. Note: expansion and forward jumping can be the smae trigger
let s:c.ExpandTrigger = get(s:c, 'ExpandTrigger', "<tab>")

" should be named "show_snippets_then_expand_trigger"
" Now that CompletionMenu works and is enabled by default you may no longer
" need this.
let s:c.ListSnippets = get(s:c, 'ListSnippets', "<c-tab>")

" jump in snippet to next/previous placeholder
let s:c.JumpForwardTrigger = get(s:c, 'JumpForwardTrigger', "<c-j>")
let s:c.JumpBackwardTrigger = get(s:c, 'JumpBackwardTrigger', "<c-k>")

if has_key(s:c,'InterfaceFlavour')
    echoe "g:UltiSnips.InterfaceFlavour option has been dropped!"
endif

" be compatible to configuration style, if a g:UltiSnips* setting exists assign it to
" dictionary overriding defaults
for k in keys(s:c)
    if exists('g:UltiSnips'.k)
	let s:c[k] = g:{'UltiSnips'.k}
    endif
endfor

" be compatible to code, assign all keys to global dictionaries (the code
" should be patched in the long run .., so this will go away)
for [k, V] in items(s:c)
    let g:{'UltiSnips'.k} = V
    unlet k V
endfor

" run py command
" Its important to be lazy for speed reasons. On Windows the by .dll is load
" lazily. Thus only initialize if the user acutally wants to use Snipmate
fun! s:c.Py(command)
  if !has_key(s:c, 'PyCommand')
    " try to detect python:
    " which :py* command should be used? Options:
    " :py
    " :py3
    if !has_key(s:c, 'PyCommand')
      " try to detect working python version
      try
      " try python2 first
        py import vim; vim.command('let g:UltiSnips.PyCommand = "py "')
        if !has_key(s:c, 'PyCommand') | throw "silent failure? Why does it happen?" | endif
      catch /.*/ 
        try
          " try python3
          py3 import vim; vim.command('let g:UltiSnips.PyCommand = "py3 "')
          echoe "UltiSnips py3 support might be broken!"
        catch /.*/ | endtry
      endtry
    endif
    if !has_key(s:c, 'PyCommand')
      " what should happen if the selected version by the users is does not work?
      " probably it should be a lazy failure telling the user about the issue if
      " he tries to expand a snippet. Having a strong failure here may be annoying
      " echom at least writes to the :messages log, too.
      echom "UltiSnips: no valid python found implementation found"
    endif
  endif

  if !has_key(s:c, 'PyCommand') | throw "no working python found" | endif
   exec s:c.PyCommand.a:command
endf
" }}}

" Global Commands {{{

" edit snippets, default of current file type or the specified type
command! -nargs=? UltiSnipsEdit :call call(s:c.ChooseSnippetFileToEdit,empty([<f-args>]) ? [&filetype] : [<f-args>] )

" Global Commands {{{
function! UltiSnipsAddFiletypes(filetypes)
    echom "UltiSnipsAddFiletypes is deprecated, which snippets are used is determined by a function returning snippet files now"
    return ""
endfunction
command! -nargs=1 UltiSnipsAddFiletypes :call UltiSnipsAddFiletypes(<q-args>)
command! -nargs=0 UltiSnipsDebugSnippets :call UltiSnips#SetupM('', 'debug_snippets()')

"" }}}

function! UltiSnips_MapKeys()
    " Map the keys correctly

    " assign ListSnippets first, so that ExpandTrigger and JumpForwardTrigger
    " override it - they are more important. Because CompletionMenu exists now
    " ListSnippets is no longer mandatory
    if s:c.ListSnippets != ""
        exec "inoremap <silent> " . s:c.ListSnippets . " <C-R>=UltiSnips#SetupM('', 'list_snippets()')<cr>"
        exec "snoremap <silent> " . s:c.ListSnippets . " <Esc>:call UltiSnips#SetupM('', 'list_snippets()')<cr>"
    endif

    if g:UltiSnipsExpandTrigger == g:UltiSnipsJumpForwardTrigger
        exec "inoremap <silent> " . s:c.ExpandTrigger . " <C-R>=UltiSnips#SetupM('c', 'expand_or_jump()')<cr>"
        exec "snoremap <silent> " . s:c.ExpandTrigger . " <Esc>:call UltiSnips#SetupM('c', 'expand_or_jump()')<cr>"
    else
        exec "inoremap <silent> " . s:c.ExpandTrigger . " <C-R>=UltiSnips#SetupM('','expand()')<cr>"
        exec "snoremap <silent> " . s:c.ExpandTrigger . " <Esc>:call UltiSnips#SetupM('', 'expand()')<cr>"
        exec "inoremap <silent> " . s:c.JumpForwardTrigger  . " <C-R>=UltiSnips#SetupM('c', 'jump_forwards()')<cr>"
        exec "snoremap <silent> " . s:c.JumpForwardTrigger  . " <Esc>:call UltiSnips#SetupM('c', 'jump_forwards()')<cr>"
    endif
    exec 'xnoremap ' . s:c.ExpandTrigger. " :call UltiSnips#SetupM('','save_last_visual_selection()')<cr>gvs"
    exec "inoremap <silent> " . s:c.JumpBackwardTrigger . " <C-R>=UltiSnips#SetupM('c', 'jump_backwards()')<cr>"
    exec "snoremap <silent> " . s:c.JumpBackwardTrigger . " <Esc>:call UltiSnips#SetupM('c', 'jump_backwards()')<cr>"

    snoremap <silent> <BS> <c-g>c
    snoremap <silent> <DEL> <c-g>c
    snoremap <silent> <c-h> <c-g>c
endf

call UltiSnips_MapKeys()

augroup UltiSnips
    autocm BufRead,BufNewFile snippets/*.snippets set filetype=snippets
augroup end

if s:c['setup_py_path_early']
  call UltiSnips#SetupPath()
endif

" vim: ts=8 sts=4 sw=4 expandtab
