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
ats2plpre_print_string($) { print STDOUT "$_[0]"; return; }
sub
ats2plpre_print_string($) { print STDERR "$_[0]"; return; }
#
############################################

######
1; #note that it is needed by 'use' or 'require'
######

###### end of [string_cats.pl] ######
