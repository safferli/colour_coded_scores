library(ggplot2)


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

library(data.table)

df <- data.table(letter = letters[1:10],
                score = 1:10,
                max_score = 10)

df <- data.table(letter = letters[1:5],
                 score = 1:5,
                 max_score = 10)

list_colors <- c("1" = "#a50026", "2" = "#d73027",
                 "3" = "#f46d43", "4" = "#fdae61",
                 "5" = "#fee08b", "6" = "#d9ef8b",
                 "7" = "#a6d96a", "8" = "#66bd63",
                 "9" = "#1a9850", "10" = "#006837")

ggplot(df) +
  geom_bar(stat = "identity", aes(x = letter, y = max_score), fill = "grey") +
  geom_bar(stat = "identity", aes(x = letter, y = score, fill = as.character(score))) +
  scale_fill_manual("Score", values = list_colors) +
  coord_flip()







## waffle-based: https://github.com/hrbrmstr/waffle

#devtools::install_github("hrbrmstr/waffle")
library(waffle)


f.colourrank <- function(score){
  input <- as.integer(score)
  score <- c(rep(1L, input), (10L-input))
  
  # http://colorbrewer2.org/?type=diverging&scheme=RdYlGn&n=10
  colours <- c("#a50026", "#d73027", "#f46d43", "#fdae61", "#fee08b", "#d9ef8b", "#a6d96a", "#66bd63", "#1a9850", "#006837")
  # light grey: #F6F6F6
  colours[input+1L] <- "#F6F6F6"
  
  # hrbrmstr is American it seems... 
  waffle::waffle(score, rows = 1, colors = colours, legend_pos = "none")
}

f.colourrank(5)
f.colourrank(0)
f.colourrank(10)

