######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [string_cats.pl]
######

############################################
#
sub
ats2plpre_print_string($)
{
  ats2plpre_fprint_string(STDOUT, $_[0]); return;
}
sub
ats2plpre_prerr_string($)
{
  ats2plpre_fprint_string(STDERR, $_[0]); return;
}
#
sub
ats2plpre_fprint_string($$) { print {$_[0]} "$_[1]"; return; }
#
############################################

######
1; #note that it is needed by 'use' or 'require'
######

###### end of [string_cats.pl] ######
