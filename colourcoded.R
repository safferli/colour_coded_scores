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

df <- data.frame(
  letter = letters[1:5],
  score = 1:5,
  max_score = 10, stringsAsFactors = FALSE
)

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

library(ggplot2)
#devtools::install_github("hrbrmstr/waffle")
library(waffle)
library(RColorBrewer)


f.colourrank <- function(score, palette = "RdYlGn"){
  input <- as.integer(score)
  # have each "score" as individual group, have the "missing" scores as one large remaining group
  score <- c(rep(1L, input), (10L-input))
  
  # pick your brewer.pal() palette: "RdYlGn", or "YlGn"
  colours <- colorRampPalette(brewer.pal(9, palette))(10)
  # NA ranks: light grey (#F6F6F6)
  # the large remaining group ("missing scores") is now grey
  colours[input+1L] <- "#F6F6F6"
  
  # hrbrmstr is American it seems... 
  waffle::waffle(score, rows = 1, colors = colours, legend_pos = "none")+
    annotate(geom = "text", x=input, y=1, size = 5, fontface = "bold", label = paste0(input, "/10"))
}

f.colourrank(10)
f.colourrank(10, palette="YlGn")
f.colourrank(5)
f.colourrank(0)




