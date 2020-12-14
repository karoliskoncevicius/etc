" various
iabbrev kk,, Karolis Koncevičius
iabbrev email,, karolis@koncevicius.lt
iabbrev gmail,, karolis.koncevicius@gmail.com
iabbrev vumail,, karolis.koncevicius@gmc.vu.lt
iabbrev <expr> date,, strftime("%Y-%m-%d")
iabbrev <expr> time,, strftime("%H:%M")

" r
iabbrev !r,, #!/usr/bin/env Rscript<CR><CR>
iabbrev rdoc,, #' Title<CR>#'<CR>#' Description<CR>#'<CR>#' Details1<CR>#'<CR>#' Details2<CR>#'<CR>#' @param param1<CR>#' @param param2<CR>#'<CR>#' @return return<CR>#'<CR>#' @seealso seealso<CR>#'<CR>#' @examples<CR>#'   example<CR>#'<CR>#' @author author<CR>#' @export<CR>
iabbrev rscreen,, figs <- rbind(c(0, 0.5, 0, 1), # Screen1<CR>c(0.5, 1, 0, 1)  # Screen2<CR>)<CR>colnames(figs) <- c("W", "E", "S", "N")<CR>rownames(figs) <- c("Screen1", "Screen2")<CR><CR>screenIDs <- split.screen(figs)<CR>names(screenIDs) <- rownames(figs)<CR><CR>screen(screenIDs["Screen1"])<CR><CR><CR><CR>screen(screenIDs["Screen1"])<CR><Up><Up><Up>

" rmd
iabbrev rl,, `r `<Left><Left>
iabbrev rc,, ```{r}<CR><CR><CR><CR>```<Up><Up><Up><Up><Right><Right>
iabbrev rp,, ```{r, include=TRUE, fig.dim=c(6,6)}<CR><CR><CR><CR>```<Up><Up><Up><Up><Right><Right>

" headers
inoreabbrev ,,H <esc>:center<cr>2hv0r=A<space><esc>40A=<esc>d80<bar>0:execute "normal! 0r" . &commentstring[0]<cr>gUgU<esc>
inoreabbrev ,,h <space><esc>80A-<esc>d75<bar>:execute "normal! 0i" . &commentstring[0] . "--- "<cr>gugu<esc>

