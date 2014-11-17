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
ATSCKiseqz { return ($_[0] == 0); }
sub
ATSCKisneqz { return ($_[0] != 0); }

############################################

sub
ATSCKptrisnull { return ($_[0] == 0); }
sub
ATSCKptriscons { return ($_[0] != 0); }

############################################

sub
ATSCKpat_int { return ($_[0] == $_[1]); }
sub
ATSCKpat_bool { return ($_[0] == $_[1]); }
sub
ATSCKpat_char { return ($_[0] == $_[1]); }
sub
ATSCKpat_float { return ($_[0] == $_[1]); }

############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [basics_cats.js]
######
