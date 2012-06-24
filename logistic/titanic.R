dat <- read.table("titanic.dat")
names(dat) <- c("class", "age", "sex", "surv")
titanic <- as.data.frame(table(dat))
titanic$alpha <- factor(rep(1 : 16, 2))  
names(titanic)[5] <- "y"

fit <- glm(y ~  factor(surv) +
           (factor(class) + factor(age)) : factor(surv) +
           factor(alpha),
           family = poisson(link = log),
           data = titanic,
           x = TRUE)

  
cell.stat <- function(y = NULL, mu = NULL, rowlabels = F){
  if (rowlabels) 1 : 32
  else y
}

titanic.mcx <- mcexact(y ~  factor(surv) +
                       (factor(class) + factor(age)) : factor(surv) +
                       factor(alpha),
                       dat = titanic,
                       nosim = 10 ^ 3,
                       method = "cab",
                       p = .1,
                       batch = 100,
                       stat = cell.stat,
                       savechain = TRUE)

#unshuffle the first 32 rows
temp <- (matrix(as.integer(as.character(titanic$sex))) *
         matrix(as.integer(as.character(titanic$surv))))

#check to make sure, estimate should be -2.4201 (.1404)
titanic$temp <- temp
fit2 <- update(fit, y ~  factor(surv) +
               (factor(class) + factor(age)) : factor(surv) +
               factor(alpha) + temp)

slambda.obs <- as.vector(titanic$y %*% temp)
slambda <- titanic.mcx$chain[,order(titanic.mcx$ord)] %*% temp
slambda <- slambda[order(slambda)]

logsume <- function(x){
  if (length(x) == 1) x
  else {
    temp <- sapply(seq(2, length(x), by = 2),
                   function(i) {
                     x[i-1] + log1p(exp(x[i] - x[i-1]))
                   }
                   )
    logsume(temp)
  }
}

  
npoint <- 50
lambda <- seq(-3, 0, length = npoint)
loglike <- sapply(1 : npoint,
                  function(i){
                    print(c(lambda[i],
                            slambda.obs * lambda[i],
                            logsume(slambda * lambda[i]),
                            slambda.obs * lambda[i] - logsume(slambda * lambda[i])))
                    slambda.obs * lambda[i]  - logsume(slambda * lambda[i])                    
                  }
                  )

loglike <- loglike - max(loglike)
plot(lambda, exp(loglike), type = "l")













#this works really well if x <- x[order(x)]
logsume <- function(x){
  m <- max(x)
  if (m < 0)
      m <- min(x)
  
  m <- min(x)
  m + log(sum(exp(x - m)))
}



