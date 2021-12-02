#' ---
#' title: "Class 05 Data Visualization"
#' author: "Barry Grant (PID 911)"
#' output: github_document
#' ---


# Lets start with a scatterplot
# Before we can use it we need to load it up!
library(ggplot2)

# Every ggplot has a data + aes + geoms
ggplot(data=cars) +
  aes(x=speed, y=dist) +
  geom_point() +
  geom_smooth()

# Change to a liner model 
p <- ggplot(data=cars) +
  aes(x=speed, y=dist) +
  geom_point() +
  geom_smooth(method="lm")

p + labs(title="Speed and Stopping Distances of Cars",
         x="Speed (MPH)",
         y="Stopping distance (ft)")

# Base graphics is shorter but not as nice 
plot(cars)


# Lets try a more complicated dataset of gene expression
# First read the dataset
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# Q. How many genes
nrow(genes)

# Q. How to access State col
table( genes$State )

# Q. What % are up/down
prec <- table( genes$State ) / nrow(genes) * 100
round( prec, 2 )

# Time to plot
ggplot(genes) +
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point() +
  scale_colour_manual(values=c("blue","gray","red")) +
  labs(title="Gene Expresion Changes Upon Drug Treatment",
       x="Control (no drug) ",
       y="Drug Treatment")

## Gapmider dataset
library(gapminder)
head(gapminder)
ggplot(gapminder) +
  aes(x=year, y=lifeExp, col=continent) +
  geom_jitter(width=0.4, alpha=0.3) +
  #geom_boxplot(aes(group=year), alpha=0.2) +
  geom_violin(aes(group=year), alpha=0.2, draw_quantiles = c(0.5))


# Convert it to interactive plot
#library(plotly)
#ggplotly()

 