" Author: Kim Silkebækken <kim.silkebaekken+vim@gmail.com>
" Source repository: https://github.com/Lokaltog/vim-distinguished

" Initialization {{{
  set background=dark

  hi clear
  if exists('syntax_on')
    syntax reset
  endif

  let g:colors_name = 'distinguished'

  if ! has('gui_running')
    if &t_Co != 256
      echoe 'The ' . g:colors_name . ' color scheme requires gvim or a 256-color terminal'

      finish
    endif
  endif
" }}}
" Color dictionary parser {{{
  function! s:ColorDictParser(color_dict)
    for [group, group_colors] in items(a:color_dict)
      exec 'hi ' . group
        \ . ' ctermfg=' . (group_colors[0] == '' ? 'NONE' :       group_colors[0])
        \ . ' ctermbg=' . (group_colors[1] == '' ? 'NONE' :       group_colors[1])
        \ . '   cterm=' . (group_colors[2] == '' ? 'NONE' :       group_colors[2])
        \
        \ . '   guifg=' . (group_colors[3] == '' ? 'NONE' : '#' . group_colors[3])
        \ . '   guibg=' . (group_colors[4] == '' ? 'NONE' : '#' . group_colors[4])
        \ . '     gui=' . (group_colors[5] == '' ? 'NONE' :       group_colors[5])
    endfor
  endfunction
" }}}

"     | Highlight group                |  CTFG |  CTBG |    CTAttributes | || |   GUIFG |    GUIBG |   GUIAttributes |
"     |--------------------------------|-------|-------|-----------------| || |---------|----------|-----------------|
call s:ColorDictParser({
  \   'Normal'                      : [    243,     '',               '',      'ffffff',  '000000',               '']
  \ , 'Visual'                      : [ 'black', 'darkgray',          '',      '585858',  'dadada',               '']
  \
  \ , 'Cursor'                      : [     '',     '',               '',      'ffffff',  'dd4010',               '']
  \ , 'lCursor'                     : [     '',     '',               '',      'ffffff',  '89b6e2',               '']
  \
  \ , 'CursorLine'                  : [     '',    235,               '',            '',  '3a3a3a',               '']
  \ , 'CursorLineNr'                : [    231,    237,               '',      'ffffff',  '585858',               '']
  \ , 'CursorColumn'                : [    231,    237,               '',      'ffffff',  '3a3a3a',               '']
  \
  \ , 'Folded'                      : [    249,    234,               '',      'b2b2b2',  '1c1c1c',               '']
  \ , 'FoldColumn'                  : [    243,    234,               '',      '767676',  '1c1c1c',               '']
  \ , 'SignColumn'                  : [    231,    233,           'bold',      'ffffff',  '121212',           'bold']
  \ , 'ColorColumn'                 : [      '',   233,               '',            '',  '262626',               '']
  \
  \ , 'StatusLine'                  : [    231,    236,           'bold',      'ffffff',  '303030',           'bold']
  \ , 'StatusLineNC'                : [    244,    232,               '',      '808080',  '080808',               '']
  \
  \ , 'LineNr'                      : [    243,    235,               '',      '767676',  '262626',               '']
  \ , 'VertSplit'                   : [    240,     '',               '',      '585858',  '1c1c1c',               '']
  \
  \ , 'WildMenu'                    : ['black', 'yellow',             '',      '1c1c1c',  'ffffff',               '']
  \ , 'Directory'                   : [    143,     '',           'bold',      'afaf5f',        '',           'bold']
  \ , 'Underlined'                  : [    130,     '',               '',      'af5f00',        '',               '']
  \
  \ , 'Question'                    : [     74,     '',           'bold',      '5fafd7',        '',           'bold']
  \ , 'MoreMsg'                     : [    214,     '',           'bold',      'ffaf00',        '',           'bold']
  \ , 'ModeMsg'                     : ['black', 'cyan',           'bold',      'ffaf00',        '',           'bold']
  \ , 'WarningMsg'                  : ['yellow', 'red',           'bold',      'ff5f00',        '',           'bold']
  \ , 'ErrorMsg'                    : [  'red',     '',               '',      'ff0000',        '',           'bold']
  \
  \ , 'Comment'                     : [     68,     '',               '',      '5f87d7',  '121212',               '']
  \ , 'vimCommentTitleLeader'       : [    238,    233,               '',      'bcbcbc',  '121212',               '']
  \ , 'vimCommentTitle'             : [    238,    233,               '',      'bcbcbc',  '121212',               '']
  \ , 'vimCommentString'            : [    238,    233,               '',      '8a8a8a',  '121212',               '']
  \
  \ , 'TabLine'                     : [    231,    238,               '',      'ffffff',  '444444',               '']
  \ , 'TabLineSel'                  : [    255,     '',           'bold',      'eeeeee',        '',           'bold']
  \ , 'TabLineFill'                 : [    240,    238,               '',      '585858',  '444444',               '']
  \ , 'TabLineNumber'               : [    160,    238,           'bold',      'd70000',  '444444',           'bold']
  \ , 'TabLineClose'                : [    245,    238,           'bold',      '8a8a8a',  '444444',           'bold']
  \
  \ , 'SpellCap'                    : [    231,     31,           'bold',      'ffffff',  '0087af',           'bold']
  \
  \ , 'SpecialKey'                  : [    239,     '',               '',      '4e4e4e',        '',               '']
  \ , 'NonText'                     : [     88,     '',               '',      '870000',        '',               '']
  \ , 'MatchParen'                  : ['white','darkgray',        'bold',      'ffffff',  '005faf',           'bold']
  \
  \ , 'Conditional'                 : [     45,     '',           'bold',      'af875f',        '',           'bold']
  \ , 'Boolean'                     : [     33,    '',               '',      'af875f',        '',           'bold']
  \ , 'Constant'                    : [    255,     '',               '',      'af875f',        '',           'bold']
  \ , 'Special'                     : [     99,     '',               '',      'afd787',        '',               '']
  \ , 'Identifier'                  : [     25,     '',               '',      '5f8787',        '',           'bold']
  \ , 'Statement'                   : [     85,     '',               '',      'd7d787',        '',           'bold']
  \ , 'PreProc'                     : [ 'blue',     '',               '',      '9e9e9e',        '',               '']
  \ , 'Type'                        : [     30,     '',               '',      '5f87af',        '',           'bold']
  \ , 'String'                      : [     27,     '',               '',      'afaf5f',        '',               '']
  \ , 'Number'                      : [    251,     '',               '',      'd7875f',        '',               '']
  \ , 'Define'                      : [    173,     '',               '',      'd7875f',        '',               '']
  \ , 'Error'                       : [  'red', 'white',              '',      'ff8700',  'af0000',               '']
  \ , 'Function'                    : [     23,     '',               '',      'd7af5f',        '',               '']
  \ , 'Include'                     : [    173,     '',               '',      'd7875f',        '',               '']
  \ , 'PreCondit'                   : [    173,     '',               '',      'd7875f',        '',               '']
  \ , 'Keyword'                     : [    75,      '',               '',      'd7875f',        '',               '']
  \ , 'Search'                      : [ 'cyan',    238,               '',      '000000',  'ffff5f', 'underline,bold']
  \ , 'Title'                       : [    231,     '',               '',      'ffffff',        '',               '']
  \ , 'Delimiter'                   : ['darkgray',  '',               '',      '949494',        '',               '']
  \ , 'StorageClass'                : [    187,     '',               '',      'd7d7af',        '',               '']
  \ , 'Operator'                    : [    99,     '',               '',      'd7af87',        '',               '']
  \
  \ , 'TODO'                        : [  'red',     '',           'bold',      'ffff87',  '875f00',           'bold']
  \
  \ , 'SyntasticWarning'            : [     8,     11,                '',      'ffff87',  '875f00',           'bold']
  \ , 'SyntasticError'              : [     8,     9,                 '',      'ffff87',  '875f00',           'bold']
  \
  \ , 'Pmenu'                       : [    248,    240,               '',      'a8a8a8',  '585858',               '']
  \ , 'PmenuSel'                    : [    253,    245,               '',      'dadada',  '8a8a8a',               '']
  \ , 'PmenuSbar'                   : ['black', 'white',              '',      'dadada',  'a8a8a8',               '']
  \
  \ , 'phpEOL'                      : [    245,     '',               '',      'dadada',        '',               '']
  \ , 'phpStringDelim'              : [     94,     '',               '',      '875f00',        '',               '']
  \ , 'phpDelimiter'                : [    160,     '',               '',      'd70000',        '',               '']
  \ , 'phpFunctions'                : [    221,     '',           'bold',      'ffd75f',        '',           'bold']
  \ , 'phpBoolean'                  : [    172,     '',           'bold',      'd78700',        '',           'bold']
  \ , 'phpOperator'                 : [    215,     '',               '',      'ffaf5f',        '',               '']
  \ , 'phpMemberSelector'           : [    138,     '',           'bold',      'af8787',        '',           'bold']
  \ , 'phpParent'                   : [    227,     '',               '',      'ffff5f',        '',               '']
  \
  \ , 'PHPClassTag'                 : [    253,     '',               '',      'dadada',        '',               '']
  \ , 'PHPInterfaceTag'             : [    253,     '',               '',      'dadada',        '',               '']
  \ , 'PHPFunctionTag'              : [    222,     '',           'bold',      'ffd787',        '',           'bold']
  \
  \ , 'pythonDocString'             : [    240,    233,               '',      '585858',  '121212',               '']
  \ , 'pythonDocStringTitle'        : [    245,    233,               '',      'dadada',  '121212',               '']
  \ , 'pythonRun'                   : [     65,     '',               '',      '5f875f',        '',               '']
  \ , 'pythonBuiltinObj'            : [     67,     '',           'bold',      '5f87af',        '',           'bold']
  \ , 'pythonSelf'                  : [    250,     '',           'bold',      'bcbcbc',        '',           'bold']
  \ , 'pythonFunction'              : [    179,     '',           'bold',      'd7af5f',        '',           'bold']
  \ , 'pythonClass'                 : [    221,     '',           'bold',      'ffd75f',        '',           'bold']
  \ , 'pythonExClass'               : [    130,     '',               '',      'af5f00',        '',               '']
  \ , 'pythonException'             : [    130,     '',           'bold',      'af5f00',        '',           'bold']
  \ , 'pythonOperator'              : [    186,     '',               '',      'd7d787',        '',               '']
  \ , 'pythonPreCondit'             : [    152,     '',           'bold',      'afd7d7',        '',           'bold']
  \ , 'pythonDottedName'            : [    166,     '',               '',      'd75f00',        '',               '']
  \ , 'pythonDecorator'             : [    124,     '',           'bold',      'af0000',        '',           'bold']
  \
  \ , 'PythonInterfaceTag'          : [    109,     '',               '',      '87afaf',        '',               '']
  \ , 'PythonClassTag'              : [    221,     '',               '',      'ffd75f',        '',               '']
  \ , 'PythonFunctionTag'           : [    109,     '',               '',      '87afaf',        '',               '']
  \ , 'PythonVariableTag'           : [    253,     '',               '',      'dadada',        '',               '']
  \ , 'PythonMemberTag'             : [    145,     '',               '',      'afafaf',        '',               '']
  \
  \ , 'CTagsImport'                 : [    109,     '',               '',      '87afaf',        '',               '']
  \ , 'CTagsClass'                  : [    221,     '',               '',      'ffd75f',        '',               '']
  \ , 'CTagsFunction'               : [    109,     '',               '',      '87afaf',        '',               '']
  \ , 'CTagsGlobalVariable'         : [    253,     '',               '',      'dadada',        '',               '']
  \ , 'CTagsMember'                 : [    145,     '',               '',      'afafaf',        '',               '']
  \
  \ , 'xmlTag'                      : [    149,     '',           'bold',      'afd75f',        '',           'bold']
  \ , 'xmlTagName'                  : [    250,     '',               '',      'bcbcbc',        '',               '']
  \ , 'xmlEndTag'                   : [    209,     '',           'bold',      'ff875f',        '',           'bold']
  \
  \ , 'cssImportant'                : [    166,     '',           'bold',      'd75f00',        '',           'bold']
  \
  \ , 'DiffAdd'                     : [    112,     22,               '',      '87d700',  '005f00',               '']
  \ , 'DiffChange'                  : [    220,     94,               '',      'ffd700',  '875f00',               '']
  \ , 'DiffDelete'                  : [    160,     '',               '',      'd70000',        '',               '']
  \ , 'DiffText'                    : [    220,     94,   'reverse,bold',      'ffd700',  '875f00',   'reverse,bold']
  \
  \ , 'diffLine'                    : [     68,     '',           'bold',      '5f87d7',        '',           'bold']
  \ , 'diffFile'                    : [    242,     '',               '',      '6c6c6c',        '',               '']
  \ , 'diffNewFile'                 : [    242,     '',               '',      '6c6c6c',        '',               '']
\ })

" HTML
hi link htmlTag            xmlTag
hi link htmlTagName        xmlTagName
hi link htmlEndTag         xmlEndTag

" PHP
hi link phpCommentTitle    vimCommentTitle
hi link phpDocTags         vimCommentString
hi link phpDocParam        vimCommentTitle

" diff
hi link diffAdded          DiffAdd
hi link diffChanged        DiffChange
hi link diffRemoved        DiffDelete

" C / C++
hi link Character       Number
hi link Boolean         Boolean
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special
