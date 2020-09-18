python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))

function! TokenAdd(token1, token2)
py << EndOfPython

from token_toggle import add_token

add_token(token1, token2)

EndOfPython
endfunction

function! TokenToggle()
py << EndOfPython

from token_toggle import token_toggle

# get token under cursor
token_under_cursor = vim.eval('expand("<cword>")')

len_of_token = len(token_under_cursor)

if len_of_token:
    toggled_token = token_toggle(token_under_cursor)
    vim.command('normal viwc%s' % toggled_token)
    if len_of_token > 1:
        vim.command('normal b')

EndOfPython
endfunction

command! TokenToggle call TokenToggle()

command! -nargs=+ TokenAdd <token1> <token2> call TokenAdd(<args>)
