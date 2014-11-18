######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [basics_cats.pl]
######

############################################

sub
ATSCKiseqz($) { return ($_[0] == 0); }
sub
ATSCKisneqz($) { return ($_[0] != 0); }

############################################

sub
ATSCKptrisnull($) { return ($_[0] == 0); }
sub
ATSCKptriscons($) { return ($_[0] != 0); }

############################################

sub
ATSCKpat_int($$) { return ($_[0] == $_[1]); }
sub
ATSCKpat_bool($$) { return ($_[0] == $_[1]); }
sub
ATSCKpat_char($$) { return ($_[0] == $_[1]); }
sub
ATSCKpat_float($$) { return ($_[0] == $_[1]); }

############################################

sub
ATSCKpat_con0($$) { return ($_[0] == $_[1]); }
sub
ATSCKpat_con1($$) { my $con = $_[0]; return ($con->[0] == $_[1]); }

############################################

sub
ats2plpre_lazy2cloref($) { return $_[0]->[1]; }

############################################
#
sub
ats2plpre_assert_bool0($)
{
  my($tfv) = @_;
  if (!$tfv) { exit(1); }
  return;
}
sub
ats2plpre_assert_bool1($$)
{
  ats2plpre_assert_bool0($_[0]); return;
}
#
sub
ats2plpre_assert_errmsg_bool0($$)
{
  my($tfv, $errmsg) = @_;
  if (!$tfv) { STDERR->printflush($errmsg); exit(1); }
  return;
}
sub
ats2plpre_assert_errmsg_bool1($$)
{
  ats2plpre_assert_errmsg_bool0($_[0], $_[1]); return;
}
#
############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [basics_cats.js]
######
