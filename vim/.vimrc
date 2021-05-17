syntax on

let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

set hidden
set ffs=unix
set t_Co=256
set ignorecase
set hidden
set wildmenu
set nocompatible
set relativenumber
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set splitbelow
"set termwinsize=10x0
set colorcolumn=90
"set autochdir
set mouse=a
set autoread
set autowrite
set showcmd

"highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': 'npm install' }
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'fisadev/fisa-vim-colorscheme'
Plug 'ryanoasis/vim-devicons'
Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sheerun/vim-polyglot'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
Plug '/home/mpaulson/personal/vim-apm'
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/vim-terminal-help'
Plug 'tpope/vim-surround'
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'posva/vim-vue'
Plug 'tomtom/tcomment_vim'
Plug 'henrik/vim-qargs'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug '907th/vim-auto-save'
Plug 'andymass/vim-matchup'
Plug 'etdev/vim-hexcolor'
Plug 'ap/vim-buftabline'
Plug 'jremmen/vim-ripgrep'
Plug 'eliba2/vim-node-inspect'
Plug 'nicklasos/vimphphtml'
Plug 'turbio/bracey.vim', { 'do': 'npm i --prefix server' }
Plug 'xuhdev/vim-latex-live-preview'
Plug 'makerj/vim-pdf'
Plug 'tpope/vim-haml'
Plug 'neowit/vim-force.com'
Plug 'APZelos/blamer.nvim'
Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
\}

call plug#end()

let g:apex_java_cmd = '/home/lakshamana/.asdf/installs/java/openjdk-16.0.1/bin/java'
let g:apex_temp_folder='/tmp'
let g:apex_properties_folder='/home/lakshamana/.vim-force'
let g:apex_tooling_force_dot_com_path='/home/lakshamana/Downloads/tooling-force.com-0.5.1.0.jar'

let g:livepreview_previewer = 'mupdf'

nnoremap <silent><F4> :NodeInspectStart<cr>
nnoremap <silent><F5> :NodeInspectRun<cr>
nnoremap <silent><F6> :NodeInspectConnect("127.0.0.1:9229")<cr>
nnoremap <silent><F7> :NodeInspectStepInto<cr>
nnoremap <silent><F8> :NodeInspectStepOver<cr>
nnoremap <silent><F9> :NodeInspectToggleBreakpoint<cr>
nnoremap <silent><F10> :NodeInspectStop<cr>

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

function! ToggleEnableBuftabline()
  let x = 1 - g:buftabline_show
  let g:buftabline_show = x
  call buftabline#update(0)
endfunction

" Buftabline
let g:buftabline_show = 1
nnoremap <silent> <Leader>bf :call ToggleEnableBuftabline()<CR>

" JSDoc mapping
nmap <silent> <C-l> <Plug>(jsdoc)

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save_events = ["CursorHold"]
" set updatetime=1000
"
" indentLine - Background (Vim, GVim)
" let g:indentLine_bgcolor_term = '#808080'
let g:indentLine_color_term = 239
let g:indentLine_char = '│'
" let g:indentLine_setColors = 0

" auto read buffers for externally modified files
au FocusGained,BufEnter * :checktime

let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1

let g:gruvbox_termcolors=256
let g:gruvbox_invert_selection = 0
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italics=1

set background=dark
colorscheme gruvbox
set termguicolors

highlight Visual guifg=NONE
highlight MatchParen guifg=#2e9fc7 guibg=NONE gui=underline cterm=underline

let g:apex_backup_folder='/tmp/apex_backup_folder'

" emmet
let g:user_emmet_mode='a'    "only enable insert mode functions.
let g:user_emmet_leader_key='<C-_>'

" vim-vu config
let g:vue_pre_processors = 'detect_on_enter'

let g:airline_theme='gruvbox'
" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

let g:fzf_branch_actions = {
      \ 'checkout': {
      \   'prompt': 'Checkout> ',
      \   'execute': 'echo system("{git} checkout {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'enter',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'alt-enter',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'create': {
      \   'prompt': 'Create> ',
      \   'execute': 'echo system("{git} checkout -b {input}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-n',
      \   'required': ['input'],
      \   'confirm': v:false,
      \ },
      \ 'delete': {
      \   'prompt': 'Delete> ',
      \   'execute': 'echo system("{git} branch -D {branch}")',
      \   'multiple': v:true,
      \   'keymap': 'ctrl-d',
      \   'required': ['branch'],
      \   'confirm': v:true,
      \ },
      \ 'merge':{
      \   'prompt': 'Merge> ',
      \   'execute': 'echo system("{git} merge {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-e',
      \   'required': ['branch'],
      \   'confirm': v:true,
      \ },
      \ 'rebase':{
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:true,
      \ },
      \}

let g:fzf_tag_actions = {
      \ 'checkout': {
      \   'prompt': 'Checkout> ',
      \   'execute': 'echo system("{git} checkout {tag}")',
      \   'multiple': v:false,
      \   'keymap': 'enter',
      \   'required': ['tag'],
      \   'confirm': v:false,
      \ },
      \ 'create': {
      \   'prompt': 'Create> ',
      \   'execute': 'echo system("{git} tag {input}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-n',
      \   'required': ['input'],
      \   'confirm': v:false,
      \ },
      \ 'delete': {
      \   'prompt': 'Delete> ',
      \   'execute': 'echo system("{git} branch -D {tag}")',
      \   'multiple': v:true,
      \   'keymap': 'ctrl-d',
      \   'required': ['tag'],
      \   'confirm': v:true,
      \ },
      \}

" multicursors plugin mappings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d

" mappings
nnoremap <silent> <leader>fzf :<C-u>CocFzfList<CR>
nnoremap <silent> <leader>a       :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <leader>dg       :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <leader>c       :<C-u>CocFzfList commands<CR>
nnoremap <silent> <leader>e       :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <leader>w       :<C-u>CocFzfList location<CR>
nnoremap <silent> <leader>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent> <leader>s       :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <leader>_lr       :<C-u>CocFzfListResume<CR>

" vim TODO
"nmap <Leader>tu <Plug>BujoChecknormal
"nmap <Leader>th <Plug>BujoAddnormal
"let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

" Vim with me
"nnoremap <leader>vwm :colorscheme gruvbox<bar>:set background=dark<CR>
nmap <leader>vtm :highlight Pmenu ctermbg=gray guibg=gray

inoremap <C-c> <esc>

command! -nargs=0 CocPrettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=500

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
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
nmap <silent> gd :call CocAction('jumpDefinition')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

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
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'Editor.action.organizeImport')

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
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Sweet Sweet FuGITive
nnoremap <leader>g2 :diffget //2<CR>
nnoremap <leader>g3 :diffget //3<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gvd :Gvdiffsplit!<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Git log<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>gbs :Gbranches<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr("t:NERDTreeBufName") != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-apex', 
  \ 'coc-tabnine', 
  \ 'coc-yaml', 
  \ 'coc-css', 
  \ 'coc-phpls', 
  \ ]

nmap <Leader>p :Prettier<CR>
nmap <Leader>P :CocPrettier<CR>
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup  Better display for messages set cmdheight=2  You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

nmap <C-b> :NERDTreeToggle<CR>
" vmap <C-_> <plug>NERDCommenterToggle
" nmap <C-_> <plug>NERDCommenterToggle

" open NERDTree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }                         


let g:NERDTreeIgnore = ['^node_modules$', '^dist$', '.nuxt$']

" vim terminal
let g:terminal_cwd=2
let g:terminal_close=1
let g:terminal_list=0
let g:terminal_kill='term'

" vim-prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
" let g:prettier#autoformat = 1
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_config_files = [
  \ '.prettierrc',
  \ '.prettierrc.json',
  \ '.prettierrc.js',
  \ '.prettierrc.toml',
  \ ]
" Max line length that prettier will wrap on: a number or 'auto' (use
" textwidth).
" default: 'auto'
let g:prettier#config#print_width = 'auto'

" number of spaces per indentation level: a number or 'auto' (use
" softtabstop)
" default: 'auto'
let g:prettier#config#tab_width = 'auto'

" use tabs instead of spaces: true, false, or auto (use the expandtab setting).
" default: 'auto'
let g:prettier#config#use_tabs = 'auto'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown or empty string
" (let prettier choose).
" default: ''
let g:prettier#config#parser = ''

" cli-override|file-override|prefer-file
" default: 'file-override'
let g:prettier#config#config_precedence = 'file-override'

" always|never|preserve
" default: 'preserve'
let g:prettier#config#prose_wrap = 'preserve'

" css|strict|ignore
" default: 'css'
let g:prettier#config#html_whitespace_sensitivity = 'css'

" false|true
" default: 'false'
let g:prettier#config#require_pragma = 'false'

let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#print_width = 100
let g:prettier#config#semi = 'false'

" let g:ft = ''
" function! NERDCommenter_before()
"   if &ft == 'vue'
"     let g:ft = 'vue'
"     let stack = synstack(line('.'), col('.'))
"     if len(stack) > 0
"       let syn = synIDattr((stack)[0], 'name')
"       if len(syn) > 0
"         exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
"       endif
"     endif
"   endif
" endfunction
" function! NERDCommenter_after()
"   if g:ft == 'vue'
"     setf vue
"     let g:ft = ''
"   endif
" endfunction

" prettier command for coc
"command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Custom mappings
inoremap <C-H> <C-W>
nmap <C-T> :tabnew <CR> :tablast<CR>
nmap <C-Q> :tabclose <CR>
nmap <leader>s ysiw
nnoremap <A-d>d :Gvdiff<CR>
nnoremap <A-d>h :Gvdiff HEAD<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <leader>; gv
nnoremap <leader>P li<space><esc>P
"nnoremap <leader>t :term <CR>
"tmap <leader>t <C-D><CR>
nnoremap <C-F>b :NERDTreeFind<CR>

" blamer.nvim
let g:blamer_enabled = 1
nnoremap <Leader>bl :BlamerToggle<CR>

" buftabline
nnoremap <A-/> :bnext<CR>
nnoremap <A-,> :bprev<CR>
nnoremap <Leader>bb :buffers<CR>:buffer<Space>
nnoremap <Leader>bd :buffers<CR>:bdelete<Space>
nnoremap <leader>W :MatchupWhereAmI?<CR>
com! -bar W exe 'w !sudo tee >/dev/null %:p:S' | setl nomod

" Search in all currently opened buffers
function! Vimgrepall(pattern)
  call setqflist([])
  exe 'bufdo vimgrepadd ' . a:pattern . ' %'
  exe 'copen'
endfunction

command! -nargs=1 Vim call Vimgrepall(<f-args>)

function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" .  (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '',
\   'down':    '30%'
\})

nnoremap <leader>i :Vim<space>

function! RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = '\%>'.(line("'<")-1).'l'.
          \ '\%<'.(line("'>")+1).'l'.
          \ g:srchstr"'"))'>'">'"))
  else
    let g:srchstr = ''
  endif
endfunction

vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>
