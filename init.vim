call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'tpope/vim-surround'
	Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
	Plug 'preservim/nerdcommenter'
	" Plug 'glidenote/memolist.vim'
	Plug 'jparise/vim-graphql'
	Plug 'morhetz/gruvbox'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'christianrondeau/vim-base64'
	Plug 'airblade/vim-gitgutter'
	Plug 'Bakudankun/BackAndForward.vim'
	Plug 'leafgarland/typescript-vim'
	" Plug 'peitalin/vim-jsx-typescript'
  Plug 'posva/vim-vue'
  Plug 'digitaltoad/vim-pug'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  " Plug 'ludovicchabant/vim-gutentags'
  " Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  " Plug 'bronson/vim-trailing-whitespace'
  Plug 'vim-test/vim-test'
  " Plug 'w0rp/ale'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
	Plug 'ryanoasis/vim-devicons'
  Plug 'kristijanhusak/defx-icons'
  " Plug 'towolf/vim-helm'
  " Plug 'sjl/gundo.vim'
  " Plug 'ianbollinger/cabal.vim'
  " Plug 'cespare/vim-toml'
call plug#end()

let g:NERDCreateDefaultMappings = 1

set termguicolors
set wildignore+=*node_modules/**
set wildignore+=*vendor/**

lang en_US.UTF-8

nmap <leader>ve :<C-u>edit ~/.config/nvim/init.vim<CR>
nmap <leader>vs :<C-u>source ~/.config/nvim/init.vim<CR>
nmap <leader>vu :<C-u>:UltiSnipsEdit<CR>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

nmap <leader>n :<C-u>call coc#float#scroll(1)<CR>
nmap <leader>p :<C-u>call coc#float#scroll(0)<CR>
nmap <space>\ :<C-u>call coc#float#close_all()<CR>

nmap <C-2> @q

nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>


inoremap <C-z> <C-c>
vnoremap <C-z> <C-c>

inoremap <C-c> <ESC>
vnoremap <C-c> <ESC>

" inoremap <C-c> <Esc>

cabb W w
cabb Q q
map Q <Nop>

nnoremap <space>t  :<C-u>tabnew<CR>
nnoremap <space>[  gT
nnoremap <space>]  gt
noremap <space>1 1gt
noremap <space>2 2gt
noremap <space>3 3gt
noremap <space>4 4gt
noremap <space>5 5gt
noremap <space>6 6gt
noremap <space>7 7gt
noremap <space>8 8gt
noremap <space>9 9gt
noremap <space>0 :<C-U>tablast<CR>

cnoremap <C-a> <C-b>

set clipboard=unnamed

colorscheme gruvbox

set expandtab
set tabstop=2
set shiftwidth=2

set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set noswapfile

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Show line numbers
set number

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-r> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocActionAsync('doHover')
"  endif
"endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

nnoremap <silent><nowait> <space>h  :<C-u>CocList mru<CR>
nnoremap <silent><nowait> <space>r  :<C-u>CocList grep<CR>
nnoremap <silent><nowait> <C-p>     :<C-u>CocList files<CR>
nnoremap <silent><nowait> <space>m  :<C-u>CocList cmdhistory<CR>

nnoremap <silent><nowait> <space>/  :<C-u>set nohlsearch<CR>
nnoremap <silent><nowait> <space>u  :<C-u>GitGutterUndoHunk<CR>
nnoremap <silent><nowait> <space>n  :<C-u>GitGutterNextHunk<CR>
nnoremap <silent><nowait> <space>p  :<C-u>GitGutterPrevHunk<CR>

nmap g<C-o> :<C-u>Back<CR>
nmap g<C-i> :<C-u>Forward<CR>

let g:coc_explorer_global_presets = {
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   }
\ }

nnoremap <silent><C-n> :<C-u>Defx -search=`expand('%:p')`<CR>
call defx#custom#option('_', {
      \ 'winwidth': 40,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 1,
      \ 'buffer_name': 'exlorer',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> s
  \ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
  nnoremap <silent><buffer><expr> v
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> t
  \ defx#do_action('open','tabnew')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> a
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> <BS>
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> R
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

call defx#custom#option('_', {
\ 'winwidth': 50,
\ 'direction': 'topleft',
\ 'toggle': 1,
\ 'columns': 'indent:git:icons:filename:mark',
\ })

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" let g:coc_snippet_next = '<tab>'

let g:go_fmt_command = "goimports"
nmap <silent> <leader>gr :<C-u>call go#lsp#Restart()<CR>
nmap <silent> <leader>cr :<C-u>CocRestart<CR>


" FZF
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:previewShell = "$HOME/.config/nvim/plugins/fzf.vim/bin/preview.sh"
let $FZF_DEFAULT_OPTS = "--layout=reverse --info=inline --bind ctrl-b:page-up,ctrl-f:page-down,ctrl-u:up+up+up,ctrl-d:down+down+down"
let g:fzf_custom_options = ['--preview', previewShell.' {}']

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': fzf_custom_options}, <bang>)

command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gitfiles(<q-args>, {'options': fzf_custom_options}, <bang>)

command! -bang -nargs=? -complete=dir Buffers
    \ call fzf#vim#buffers({'options': fzf_custom_options}, <bang>)

command! -bang -nargs=? History
    \ call fzf#vim#history({'options': fzf_custom_options}, <bang>)

command! -bang -nargs=? SearchHistory
    \ call fzf#vim#search_history({'options': fzf_custom_options}, <bang>)

command! -bang -nargs=? CommandHistory
    \ call fzf#vim#command_history({'options': fzf_custom_options}, <bang>)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden -g "!{node_modules,.git}" --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

nnoremap <space>T :<C-u>Rg TODO:<CR>

let g:fzf_history_dir = '~/.local/share/fzf-history'

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <silent> <space>f :<C-u>Files<CR>
nnoremap <silent> <C-p>    :<C-u>Files<cr>
nnoremap <silent> <space>h :<C-u>History<CR>
nnoremap <silent> <space>r :<C-u>Rg<CR>
nnoremap <silent> <space>g :<C-u>GFiles?<CR>
nnoremap <silent> <space>b :<C-u>GBrowse<CR>
nnoremap <silent> <space>s :<C-u>Gstatus<CR>
nnoremap <silent> <space>d :<C-u>Gdiff<CR>
nnoremap <silent> <C-_>    :<C-u>SearchHistory<CR>
nnoremap <silent> <space>l :<C-u>BLines<CR>
nnoremap <silent> <space>L :<C-u>Commits<CR>
nnoremap <silent> <space>c :<C-u>CommandHistory<CR>
nnoremap          <space>/ :<C-u>nohlsearch<CR>
nnoremap <silent> <space>: :<C-u>Commands<CR>
nnoremap <silent> <space>w :<C-u>Windows<CR>
nnoremap <silent> <space>m :<C-u>Marks<CR>

autocmd FileType go nmap <leader>run <Plug>(go-run-vertical)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>a <Plug>(go-alternate-vertical)
autocmd FileType go nmap <leader>d <Plug>(go-diagnostics)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-browser)
autocmd FileType go nmap <leader>s <Plug>(go-decls)
autocmd FileType go nmap <leader>f <Plug>(go-decls-dir)
autocmd FileType go nmap <leader>gi :<C-u>GoImpl<CR>

nnoremap <leader>ftoh :<C-u>%s/[\uff01-\uff5e]/\=nr2char(char2nr(submatch(0))-65248)/g<CR>


nnoremap z<CR> 5kz<CR>5j
nnoremap zb 5jzb5k
nnoremap <C-f> 5k<C-f>5j
nnoremap <C-b> 5j<C-b>5k

let g:ale_linters = {
      \ 'html': [],
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'vue': ['eslint', 'prettier']
      \ }
let g:ale_fixers = {
      \ 'html': [],
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'vue': ['eslint', 'prettier']
      \ }
let g:ale_linter_aliases = {'vue': 'css'}
let g:ale_fix_on_save = 1

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

autocmd FileType typescript nmap <leader>t :<C-u>call CocAction('runCommand', 'jest.fileTest', ['%'])<CR>
autocmd FileType typescript nmap <leader>T :<C-u>call CocAction('runCommand', 'jest.projectTest')<CR>

let g:gundo_prefer_python3 = 1
nnoremap <leader>r :<C-u>GundoToggle<CR>
      \ 'javascript': ['eslint'],
      \ 'vue': ['eslint']
      \ }
let g:ale_linter_aliases = {'vue': 'css'}

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
