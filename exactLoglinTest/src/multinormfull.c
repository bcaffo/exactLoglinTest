#include <R.h>
#include <Rinternals.h>
#include <Rmath.h>
#include <R_ext/PrtUtil.h>

/**********************************************************************
 *NOTE:this is adapted from ox code. x and s are not the same as the x*
 *and s from the associated R programs                                *
 *This code simply executes the mean and variance formulas from booth *
 *and butler and returns one simulated vector.                        *
 *Author Brian Caffo                                                  *
 **********************************************************************/
SEXP multinormfull(SEXP rx, SEXP rs, SEXP rdf){

  int n, i, j, k;
  double temp, mu, sig, *x, *s, *y;

  SEXP ry;

  n = length(rx);
  x = REAL(rx);
  s = REAL(rs);
 
  PROTECT(ry = allocVector(REALSXP, n));
  y = REAL(ry);
  GetRNGstate();
  for(k = 0; k < n; k++){
    if (k > 0)
      //for(i = 0; i <= k - 1; i++){
      for(i = 0; i < k - 1; i++){
	x[k]  =  x[k] + (y[i] -  x[i]) * s[i + n * k] / s[i + n * i];
	s[k + n * k] = s[k + n * k] - pow(s[i + n * k], 2) / s[i + n * i];
      }
    if (k < n - 1){
      //for(i = 1; i <= k; i++){
      for(i = 1; i < k; i++){
	//for(j = 0; j <= i - 1; j++){
	for(j = 0; j < i - 1; j++){
	  s[i + n * (k + 1)] = s[i + n * (k + 1)] - s[j + n * i] * s[j + n * (k + 1)] / s[j + n * j];
	}
      }
    }
    mu = x[k];
    sig = sqrt(s[k + n * k]); 
    y[k] = fround(mu + sig * rt(REAL(rdf)[0]), 0);
  }
  PutRNGstate(); 
 
  UNPROTECT(1);
  return ry;
} 
