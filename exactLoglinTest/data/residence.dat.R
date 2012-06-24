residence.dat <- data.frame(y = c(
                                11607   , 100     , 366    , 124,
                                87      , 13677   , 515    , 302,
                                172     , 225     , 17819  , 270,
                                63      , 176     , 286    , 10192),
                            res.1985 = factor(rep(c("NE", "MW", "S", "W"), 4)),
                            res.1980 = factor(rep(c("NE", "MW", "S", "W"), rep(4, 4))),
                            sym.pair = factor(
                              c(1, 2, 3, 4,
                                2, 5, 6, 7,
                                3, 6, 8, 9,
                                4, 7, 9, 10)))
                                              
