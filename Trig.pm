# $Id: Trig.pm,v 1.2 1995/12/28 16:32:37 willijar Exp $  
=head1 NAME

    Math::Trig - Inverse and hyperbolic trigonemetric Functions

=head1 SYNOPSIS

    use Math::Trig qw(tan asin acos sinh cosh tanh sech cosech);
    $v=tan($x);
    $v=asin($x);
    $v=acos($x);
    $v=sinh($x);
    $v=cosh($x);
    $v=tanh($x);
    $v=sech($x);
    $v=cosech($x);

=head1 DESCRIPTION

This module exports the missing inverse and hyperbolic trigonemtric
functions of real numbers.

=item B<tan> returns tan of real argument
=item B<asin> returns inverse sine of real argument
=item B<acos> returns inverse cosine of real argument
=item B<sinh> returns hyperbolic sine of real argument
=item B<cosh> returns hyperbolic cosine of real argument
=item B<tanh> returns hyperbolic tan of real argument
=item B<sech> returns hyperbolic secant of real argument
=item B<cosech> returns hyperbolic cosecant of real argument

=head1 HISTORY

$Log: Trig.pm,v $
Revision 1.2  1995/12/28 16:32:37  willijar
Moved hyoerbolic functions into here.

Revision 1.1  1995/12/24 16:06:26  willijar
Initial revision

=head1 BUGS

Let me know.

I welcome additions such as the inverse trigonemetric functions and
the complex versions of the functions to be included in this module.

=head1 AUTHOR

John A.R. Williams <J.A.R.Williams@aston.ac.uk>

=cut

require Exporter;
package Math::Trig;
@ISA=qw(Exporter);
@EXPORT_OK=qw(tan asin acos sinh cosh tanh sech cosech);

sub tan { return sin($_[0])/cos($_[0]); }

sub asin { return atan2 ($_[0],sqrt(1-$_[0]*$_[0])); }

sub acos { return atan2 (sqrt(1-$_[0]*$_[0]),$_[0]); }

sub sinh { (exp($_[0])+exp(-$_[0]))/2; }

sub cosh { (exp($_[0])-exp(-$_[0]))/2; }

sub tanh {
    my($ep,$em) = (exp($_[0]),exp(-$_[0]));
    ($ep==0 and $em==0) ? 1 : ($ep-$em)/($ep+$em);
}

sub sech { 2/(exp($_[0])+exp(-$_[0])); }

sub cosech { 2/(exp($_[0])-exp(-$_[0])); }

1;
