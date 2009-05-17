# $Id$

=head1

vuhu.pir -- implementation of the VUhU selma'o

=cut

.namespace []

.sub "su'i"
    .param pmc args            :slurpy
    .local pmc iter
    iter = new 'Iterator', args
  iter_loop:
    unless iter goto iter_end
    $N1 = shift iter
    $N0 = $N0 + $N1
    goto iter_loop
  iter_end:
    say $N0
    .return ($N0)
.end

.sub "vu'u"
    .param pmc args            :slurpy
    .local pmc iter
    iter = new 'Iterator', args
    $N0 = shift iter
  iter_loop:
    unless iter goto iter_end
    $N1 = shift iter
    $N0 = $N0 - $N1
    goto iter_loop
  iter_end:
    say $N0
    .return ($N0)
.end

.sub "pi'i"
    .param pmc args            :slurpy
    .local pmc iter
    iter = new 'Iterator', args
    $N0 = shift iter
  iter_loop:
    unless iter goto iter_end
    $N1 = shift iter
    $N0 = $N0 * $N1
    goto iter_loop
  iter_end:
    say $N0
    .return ($N0)
.end

.sub "fe'i"
    .param pmc args            :slurpy
    .local pmc iter
    iter = new 'Iterator', args
    $N0 = shift iter
  iter_loop:
    unless iter goto iter_end
    $N1 = shift iter
    $N0 = $N0 / $N1
    goto iter_loop
  iter_end:
    say $N0
    .return ($N0)
.end

.sub "fa'i"
    .param num a
    $N0 = 1 / a
    say $N0
    .return ($N0)
.end

.sub "te'a"
    .param num a
    .param num b
    $N0 = a ** b
    say $N0
    .return ($N0)
.end

.sub 'gei'
    .param num a
    .param num b
    .param num c
    $N0 = c ** a
    $N0 *= b
    say $N0
    .return ($N0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir: