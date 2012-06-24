#include <R.h>
#include <Rinternals.h>
#include <Rmath.h>
#include <R_ext/PrtUtil.h>
#include <stdio.h>
static int once = 0;

/**************************************************************************************
 *NOTE:this is adapted from ox code. x and s are not the same as the x and s from the *
 *remaning R programs                                                                 *
 *Returns a simulated vector and calculates the mean and variance from caffo and booth*
 *Author: Brian Caffo                                                                 *
 **************************************************************************************/
SEXP multinorm(SEXP rx, SEXP rs, SEXP ry_fix, SEXP ry_old, SEXP rdf, SEXP rk){

  int n, i, j, k;
  double  mu, sig, *x, *s, *y, *y_fix, *y_old, *xtwo;

  double hj, hj0;

  SEXP ry, rxtwo, rval;

  n = length(rx);
  x = REAL(rx);
  s = REAL(rs);
  y_fix = REAL(ry_fix);
  y_old = REAL(ry_old);
  
  PROTECT(ry    = allocVector(REALSXP, n));
  PROTECT(rxtwo = allocVector(REALSXP, n));
  PROTECT(rval  = allocVector(VECSXP, 2));
  y = REAL(ry);  
  xtwo = REAL(rxtwo);

  for (i = 0; i < n; i++)
    xtwo[i] = x[i];

  GetRNGstate();
  for(k = 0; k < n; k++){
    if (once == 0 && n == 15 && k == 9)
      hj0 = s[k + n * k];	// HJ -- save initial value
    if (k > 0) {
      //for(i = 0; i <= k - 1; i++){
      for(i = 0; i < k - 1; i++){
	x[k]    =    x[k] + (    y[i] -    x[i]) * s[i + n * k] / s[i + n * i];
	xtwo[k] = xtwo[k] + (y_old[i] - xtwo[i]) * s[i + n * k] / s[i + n * i];
	s[k + n * k] = s[k + n * k] - pow(s[i + n * k], 2) / s[i + n * i];
	hj = s[k + n * k];	// HJ
	if (once == 0 && n == 15 && k == 9 && hj < 0)	// HJ -- print initial and bad value
	  Rprintf("i=%d, s[k + n * k]: %5.2g -> %5.2g\n", i, hj0, hj);
      }
      // HJ -- if we had extended the loop above to "i==k-1"
      // hj = s[k + n * k] - pow(s[i + n * k], 2) / s[i + n * i];
	// if (once == 0 && n == 15 && k == 9)	// HJ -- print initial and current value
	  // Rprintf("(i=%d, s[k + n * k]: %5.2g -> %5.2g)\n", i, hj0, hj);
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

    hj = s[k + n * k];	// HJ
    if (once == 0 && hj < 0) {
      if (n == 15 && k == 9)	// HJ -- print initial and bad value
	Rprintf("n=%d, k=%d, s[k + n * k]: %5.2g ---> %5.2g\n", n, k, hj0, hj);
	once = 1;
    }
    sig = sqrt(s[k + n * k]); 
    if (k < INTEGER(rk)[0]) {
      y[k] = y_fix[k];
    }
    else {
      y[k] = fround(mu + sig * rt(REAL(rdf)[0]), 0);
    }
  }
  PutRNGstate();

  SET_VECTOR_ELT(rval, 0, ry);
  SET_VECTOR_ELT(rval, 1, rxtwo);
  UNPROTECT(3);
  return rval;
} 
