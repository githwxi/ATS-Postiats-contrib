######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [bool_cats.pl]
######

############################################
#
sub
ats2plpre_print_bool($)
{
  ats2plpre_fprint_bool(STDOUT, $_[0]); return;
}
sub
ats2plpre_prerr_bool($)
{
  ats2plpre_fprint_bool(STDERR, $_[0]); return;
}
#
sub
ats2plpre_fprint_bool($$)
{
  if($_[1]) { print {$_[0]} "true"; } else { print {$_[0]} "false"; }; return;
}
#
############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [bool_cats.pl]
######

