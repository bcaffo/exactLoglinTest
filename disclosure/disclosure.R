czech <- data.frame(y =
                    c(44, 40, 112, 67,
                      129, 145, 12, 23,
                      35, 12, 80, 33,
                      109, 67, 7, 9,
                      23, 32, 70, 66,
                      50, 80, 7, 13,
                      24, 25, 73, 57,
                      51, 63, 7, 16,
                      5, 7, 21, 9,
                      9, 17, 1, 4,
                      4, 3, 11, 8,
                      14, 17, 5, 2,
                      7, 3, 14, 14,
                      9, 16, 2, 3,
                      4, 0, 13, 11,
                      5, 14, 4, 4))
czech <- cbind(czech,
               expand.grid(A = c("no", "yes"),
                           B = c("no", "yes"),
                           C = c("no", "yes"),
                           D = c("<140", ">=140"),
                           E = c("<3", ">=3"),
                           F = c("neg", "pos")))


cell.stat <- function(y = NULL, mu = NULL,rowlabels = F){
  if (rowlabels) 1 : 64
  else y
}
 
czech.mcx <- mcexact(y ~ (A + B + C + D + E + F) ^ 2,
                     data = czech,
                     method = "cab",
                     nosim = 10 ^ 5,
                     batchsize = 100,
                     p = .4,
                     savechain = TRUE,
                     stat = cell.stat)
 
chain <- czech.mcx$chain[,order(czech.mcx$ord)]
chain <- chain[, czech$y > 0 & czech$y <= 2]
colnames(chain) <- (1 : 64)[czech$y > 0 & czech$y <= 2]
apply(chain, 2, function(x) table(x) / nrow(chain))
