# $Id$

=head1

vuhu1.pir -- implementation of the VUhU1 selma'o

=cut

.namespace []

.sub 'suhi'
    .param num a            
    .param num b
    $N0 = a + b
    print "$N0\n"
    .return ($N0)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

