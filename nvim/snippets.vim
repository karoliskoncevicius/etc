" Various
iabbrev kk@@ Karolis Koncevičius
iabbrev email@@ karolis@koncevicius.lt
iabbrev gmail@@ karolis.koncevicius@gmail.com
iabbrev vumail@@ karolis.koncevicius@gmc.vu.lt
iabbrev <expr> date@@ strftime("%Y-%m-%d")
iabbrev <expr> time@@ strftime("%H:%M")

" R
iabbrev rdoc@@ #' Title<CR>#'<CR>#' Description<CR>#'<CR>#' Details1<CR>#'<CR>#' Details2<CR>#'<CR>#' @param param1<CR>#' @param param2<CR>#'<CR>#' @return return<CR>#'<CR>#' @seealso seealso<CR>#'<CR>#' @examples<CR>#'   example<CR>#'<CR>#' @author author<CR>#' @export<CR>
iabbrev rscreen@@ figs <- rbind(c(0, 0.5, 0, 1), # Screen1<CR>c(0.5, 1, 0, 1)  # Screen2<CR>)<CR>colnames(figs) <- c("W", "E", "S", "N")<CR>rownames(figs) <- c("Screen1", "Screen2")<CR><CR>screenIDs <- split.screen(figs)<CR>names(screenIDs) <- rownames(figs)<CR><CR>screen(screenIDs["Screen1"])<CR><CR><CR><CR>screen(screenIDs["Screen1"])<CR><Up><Up><Up>

" Rmd
iabbrev rl@@ `r `<Left><Left>
iabbrev rc@@ ```{r}<CR><CR><CR><CR>```<Up><Up><Up><Up><Right><Right>
iabbrev rp@@ ```{r, include=TRUE, fig.dim=c(6,6)}<CR><CR><CR><CR>```<Up><Up><Up><Up><Right><Right>
