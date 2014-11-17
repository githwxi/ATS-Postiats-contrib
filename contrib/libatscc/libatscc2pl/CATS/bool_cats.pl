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
  if($_[0]) { print STDOUT "true"; } else { print STDOUT "false"; }; return;
}
sub
ats2plpre_prerr_bool($)
{
  if($_[0]) { print STDERR "true"; } else { print STDERR "false"; }; return;
}
#
############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [bool_cats.pl]
######

