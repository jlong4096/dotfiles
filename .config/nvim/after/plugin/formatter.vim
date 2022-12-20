augroup FormatAutogroup
autocmd!
autocmd BufWritePost *.lua,*.js,*.ts,*.go FormatWrite
augroup END
