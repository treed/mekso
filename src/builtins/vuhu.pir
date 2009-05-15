# $Id$

=head1

vuhu.pir -- implementation of the VUhU selma'o

=cut

.namespace []

.sub 'suhi'
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

.sub 'vuhu'
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

.sub 'pihi'
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

.sub 'fehi'
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

.sub 'teha'
    .param num a
    .param num b
    $N0 = a ** b
    say $N0
    .return ($N0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
