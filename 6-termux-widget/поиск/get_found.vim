" Настройки для vim (выбор открываемого файла или папки)

" Удаляю маппинг для клавиши <leader>t
unmap <leader>t

" Для удаления ненужной подсветки синтаксиса
syntax off

" Сохранить имя файла в переменную
function! ExportCurrentLine()
    let filename = getline(".")  " Получаю текущую строку

" Создаю команду по открытию файла
    let run_cmd = "./open_dir.sh " . shellescape(filename)


" Открываю нужный файл или папку
    call system(run_cmd)
endfunction


nnoremap <leader>t :call ExportCurrentLine()<CR>
nnoremap бе :call ExportCurrentLine()<CR>
