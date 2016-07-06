library(ggplot2)

library(data.table)

# Colin

x <- data.frame(
  x = c(rep("5", 10), rep("6", 10)),
  y = c(seq(1, 8, 1), NA, NA,
        seq(1, 4, 1), rep(NA, 6))
  

)

colours <- c("#a50026",
  "#d73027",
  "#f46d43",
  "#fdae61",
  "#fee08b",
  "#d9ef8b",
  "#a6d96a",
  "#66bd63",
  "#1a9850",
  "#006837")

ggplot(x, aes(x=y, y=x, fill=factor(y))) +
  geom_raster() +
  coord_cartesian(xlim=c(0,10)) +
  scale_fill_manual(values = colours) 

# Dmitry

df <- data.table(letter = c("a","b","c","d","e","f","g","h","i","j"),
                score = 1:10,
                max_score = 10)

df <- data.table(letter = c("a","b","c","d","e"),
                 score = 1:5,
                 max_score = 10)

list_colors <- c("1" = "#a50026", "2" = "#d73027",
                 "3" = "#f46d43","4" = "#fdae61",
                 "5" = "#fee08b","6" = "#d9ef8b",
                 "7" = "#a6d96a","8" = "#66bd63",
                 "9" = "#1a9850","10" = "#006837")

ggplot(df) +
  geom_bar(stat = "identity", aes(x = letter, y = max_score), fill = "grey") +
  geom_bar(stat = "identity", aes(x = letter, y = score, fill = as.character(score))) +
  scale_fill_manual("Score", values = list_colors) +
  coord_flip()






ggplot(df)+
  geom_bar(aes(x=score))


ggplot(df) +
  geom_bar(stat = "identity", aes(x = letter, y = max_score), fill = "grey") +
  geom_bar(stat = "identity", aes(x = letter, y = score, fill = as.character(score))) +
  geom_text(aes(x=score, y=max_score, label = paste0(score, "/", max_score), hjust = 1, vjust = 0.5), nudge_y = -0.25)+
  #scale_fill_brewer(palette = "RdYlGn") +
  scale_fill_manual("Score", values = list_colors) +
  coord_flip()


## waffle-based: https://github.com/hrbrmstr/waffle

#devtools::install_github("hrbrmstr/waffle")
library(waffle)

parts <- c(80, 30, 20, 10)

waffle(parts, rows=8)

parts <- c(`Un-breached\nUS Population`=(318-11-79), `Premera`=11, `Anthem`=79)
waffle(parts, rows=8, size=1, colors=c("#969696", "#1879bf", "#009bda"))

waffle(parts/10, rows=3, colors=c("#969696", "#1879bf", "#009bda")) 


