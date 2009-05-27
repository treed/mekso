=head1 NAME

src/classes/cusku.pir - bridi class

=cut
.namespace ['cusku']

.sub 'onload' :anon :init :load
    .local pmc p6meta, bridi
    p6meta = get_hll_global['dacti'], '$!P6META'
    cusku = p6meta.'new_class'('cusku', 'parent'=>'bridi')
.end

.sub 'get_cusku' :method
    $P0 = self.'get_terbri'(0)
    .return ($P0)
.end

.sub 'set_cusku' :method
    .param pmc arg
    self.'set_terbri'(0,arg) 
.end

.sub 'get_selsku' :method
    $P0 = self.'get_terbri'(1)
    .return ($P0)
.end

.sub 'set_selsku' :method
    .param pmc arg
    self.'set_terbri'(1,arg)
.end

.sub 'get_tersku' :method
    $P0 = self.'get_terbri'(2)
    .return ($P0)
.end

.sub 'set_tersku' :method
    .param pmc arg
    self.'set_terbri'(2,arg)  
.end

.sub 'get_velsku' :method
    $P0 = self.'get_terbri'(3)
    .return ($P0)
.end

.sub 'set_velsku' :method
    .param pmc arg
    self.'set_terbri'(3,arg)
.end

.sub 'go' :method
    $P0 = self.'selsku'()
    say $P0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

