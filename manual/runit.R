runit <- function(){
  require(tools)
  Sweave('exactLoglinTest.Rnw')
  system('latex exactLoglinTest.tex')
  system('bibtex exactLoglinTest')
  system('latex exactLoglinTest.tex')
  system('latex exactLoglinTest.tex')
  system('dvips exactLoglinTest.dvi -o')
  system('dvipdf exactLoglinTest.dvi')
}

runit()
