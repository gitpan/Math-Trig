# $Id: Trig.pm,v 1.4 1997/02/26 17:28:42 willijar Exp $  

=head1 NAME

    Math::Trig - Inverse and hyperbolic trigonemetric Functions

=head1 SYNOPSIS

    use Math::Trig qw(tan sec csc cot asin acos atan asec acsc acot sinh cosh tanh sech csch coth asinh acosh atanh asech acsch acoth);
    $v=tan($x);
    $v=sec($x);
    $v=csc($x);
    $v=cot($x);
    $v=asin($x);
    $v=acos($x);
    $v=atan($x);
    $v=asec($x);
    $v=acsc($x);
    $v=acot($x);
    $v=sinh($x);
    $v=cosh($x);
    $v=tanh($x);
    $v=sech($x);
    $v=csch($x);
    $v=coth($x);
    $v=asinh($x);
    $v=acosh($x);
    $v=atanh($x);
    $v=asech($x);
    $v=acsch($x);
    $v=acoth($x);

=head1 DESCRIPTION

This module exports the missing inverse and hyperbolic trigonometric
functions of real numbers.  The inverse functions return values
cooresponding to the principal values.  Specifying an argument outside
of the domain of the function will cause B<undef> to be returned.

=item B<tan> returns tangent of real argument.

=item B<sec> returns secant of real argument.

=item B<csc> returns cosecant of real argument.

=item B<cot> returns cotangent of real argument.

=item B<asin> returns inverse sine of real argument.

=item B<acos> returns inverse cosine of real argument.

=item B<atan> returns inverse tangent of real argument.

=item B<asec> returns inverse secant of real argument.

=item B<acsc> returns inverse cosecant of real argument.

=item B<acot> returns inverse cotangent of real argument.

=item B<sinh> returns hyperbolic sine of real argument.

=item B<cosh> returns hyperbolic cosine of real argument.

=item B<tanh> returns hyperbolic tangent of real argument.

=item B<sech> returns hyperbolic secant of real argument.

=item B<csch> returns hyperbolic cosecant of real argument.

=item B<coth> returns hyperbolic cotangent of real argument.

=item B<asinh> returns inverse hyperbolic sine of real argument.

=item B<acosh> returns inverse hyperbolic cosine of real argument.

(positive value only)

=item B<atanh> returns inverse hyperbolic tangent of real argument.

=item B<asech> returns inverse hyperbolic secant of real argument.

(positive value only)

=item B<acsch> returns inverse hyperbolic cosecant of real argument.

=item B<acoth> returns inverse hyperbolic cotangent of real argument.

=head1 HISTORY

$Log: Trig.pm,v $
Revision 1.4  1997/02/26 17:28:42  willijar
Revised verions from Jason Smith fixing error in sinh and cosh which
where the wrong way round. jason also provided many new functions to
complete the set. Also fixed bug which prevented pod2man correctly
creating man page

Revision 1.2  1995/12/28 16:32:37  willijar
Moved hyoerbolic functions into here.

Revision 1.1  1995/12/24 16:06:26  willijar
Initial revision

=head1 BUGS

Some functions may return B<undef> even within their domain.  It will
usually only occur very close to a domain boundary or when evaluating
a very large or small argument though.  This is usually caused by things
like internally adding 1 to 1e20 while evaluating the function with the
other trigonometric and exponential functions.

Let me know about any others.

I welcome additions such as the inverse trigonemetric functions and
the complex versions of the functions to be included in this module.

=head1 AUTHOR

Initial Version John A.R. Williams <J.A.R.Williams@aston.ac.uk>
Bug fixes and many additonal functions Jason Smith <smithj4@rpi.edu>

=cut

require Exporter;
package Math::Trig;
@ISA=qw(Exporter);
@EXPORT_OK=qw(tan sec csc cot asin acos atan asec acsc acot sinh cosh tanh sech csch coth asinh acosh atanh asech acsch acoth);

sub tan { return sin($_[0])/cos($_[0]); }

sub sec { return 1/cos($_[0]); }

sub csc { return 1/sin($_[0]); }

sub cot { return cos($_[0])/sin($_[0]); }

sub asin { return ($_[0]<-1 or $_[0]>1) ? undef : atan2($_[0],sqrt(1-$_[0]*$_[0])); }

sub acos { return ($_[0]<-1 or $_[0]>1) ? undef : atan2(sqrt(1-$_[0]*$_[0]),$_[0]); }

sub atan {
    if ($_[0]==0) {
return 0;
    } elsif ($_[0]>0) {
return atan2(sqrt(1+$_[0]*$_[0]),sqrt(1+1/($_[0]*$_[0])));
    } else {
return -atan2(sqrt(1+$_[0]*$_[0]),sqrt(1+1/($_[0]*$_[0])));
    }
}

sub asec { return ($_[0]>-1 and $_[0]<1) ? undef : acos(1/$_[0]); }

sub acsc { return ($_[0]>-1 and $_[0]<1) ? undef : asin(1/$_[0]); }

sub acot {
    if ($_[0]==0) {
return atan2(1,1)*2.0;  # pi/2.
    } elsif ($_[0]<0) {
return atan2(1,1)*4.0 + atan(1/$_[0]);
    } else {
return atan(1/$_[0]);
    }
}

sub sinh { return (exp($_[0])-exp(-$_[0]))/2; }

sub cosh { return (exp($_[0])+exp(-$_[0]))/2; }

sub tanh {
    my($ep,$em) = (exp($_[0]),exp(-$_[0]));
    if ($ep == INF) {
return 1;
    } elsif ($em == INF) {
return -1;
    } else {
return ($ep-$em)/($ep+$em);
    }
}

sub sech { return 2/(exp($_[0])+exp(-$_[0])); }

sub csch { return ($_[0]==0) ? undef : 2/(exp($_[0])-exp(-$_[0])); }

sub coth {
    my($ep,$em) = (exp($_[0]),exp(-$_[0]));
    if ($_[0]==0) {
return undef;
    } elsif ($ep == INF) {
return 1;
    } elsif ($em == INF) {
return -1;
    } else {
return (exp($_[0])+exp(-$_[0]))/(exp($_[0])-exp(-$_[0]));
    }
}

sub asinh { return log($_[0]+sqrt(1+$_[0]*$_[0])); }

sub acosh { return ($_[0]<1) ? undef : asinh(sqrt($_[0]*$_[0]-1)); }  # Returns positive value only!

sub atanh { return ($_[0]<-1 or $_[0]>1) ? undef : asinh($_[0]/sqrt(1-$_[0]*$_[0])); }

sub asech { return ($_[0]<0 or $_[0]>1) ? undef : asinh(sqrt(1-$_[0]*$_[0])/$_[0]); }  # Returns positive value only!

sub acsch { return ($_[0]==0) ? undef : asinh(1/$_[0]); }

sub acoth {
    if ($_[0]>-1 and $_[0]<1) {
return undef;
    } elsif ($_[0]<=-1) {
return -asinh(1/sqrt($_[0]*$_[0]-1));
    } else {
return asinh(1/sqrt($_[0]*$_[0]-1));
    }
}

1;

