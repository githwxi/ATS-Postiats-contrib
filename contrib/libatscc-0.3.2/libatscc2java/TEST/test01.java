/*
** For testing atscc2java
*/

/* ****** ****** */

import static
libatscc2java.int_cats.*;
import static
libatscc2java.bool_cats.*;

/* ****** ****** */

public
class test01
{
//
  static
  int fact(int n)
  {
    boolean test = n > 0;
    return test ? n*fact(ats2javapre_sub_int0_int0(n, 1)) : 1;
  }
//
  public
  static
  void main(String argv[])
  {
    System.out.print("fact(10) = "); System.out.println(fact(10));
  }
//
} /* end of [test01] */

/* ****** ****** */

/* end of [test01.java] */
