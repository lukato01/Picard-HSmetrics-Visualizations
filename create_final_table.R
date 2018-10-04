#!/usr/bin/env Rscript --vanilla

setwd( "/sc/orga/work/lukato01/offtargetanalysis" )
suppressMessages(library(gdata))

cbind.all <- function (...) 
{
  nm <- list(...)
  nm <- lapply(nm, as.matrix)
  n <- max(sapply(nm, nrow))
  do.call(cbind, lapply(nm, function(x) rbind(x, matrix(, n - 
                                                          nrow(x), ncol(x)))))
}


path = "/sc/orga/work/lukato01/offtargetanalysis"
df_combined <- data.frame() 
file.names <- dir(path, pattern =".part1")
for(i in 1:length(file.names)) {
  file <- read.table(file.names[i],header=TRUE, sep="\t")
  b <- as.data.frame(t(file))
  chunks <- unlist(strsplit(file.names[i], "_"))
  b <- rename.vars( b, c("V1") , c(chunks[1]))
  df_combined <- cbind.all(df_combined, b)

}

write.csv(df_combined, file="CARRIER.csv")
