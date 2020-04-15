package Mojo::Log::Role::Color;
use Mojo::Base -role;

use Term::ANSIColor ();

our %COLORS = (
  debug => ['cyan'],
  error => ['red'],
  fatal => ['white on_red'],
  info  => ['green'],
  warn  => ['yellow'],
);

has colored => sub { $ENV{MOJO_LOG_COLORS} // -t shift->handle };

around format => sub {
  my ($next, $self) = (shift, shift);

  # set
  return $next->($self, @_) if @_;

  # get
  my $formatter = $next->($self);
  return $formatter unless $self->colored;

  return sub {
    my $level   = $_[1];
    my $message = $formatter->(@_);
    my $newline = $message =~ s!(\r?\n)$!! ? $1 : '';
    return Term::ANSIColor::colored($COLORS{$level} || $COLORS{debug}, $message)
      . $newline;
  };
};

1;
