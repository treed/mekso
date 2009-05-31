=head1 NAME

src/classes/cipra.pir - cipra class

=cut
.namespace ['cipra']

.sub 'onload' :anon :init :load
    .local pmc p6meta, cipra
    p6meta = get_hll_global['dacti'], '$!P6META'
    cipra = p6meta.'new_class'('cipra', 'parent'=>'bridi')
.end

.sub 'get_cipra' :method
    $P0 = self.'get_terbri'(0)
    .return ($P0)
.end

.sub 'set_cipra' :method
    .param pmc arg
    self.'set_terbri'(0,arg) 
.end

.sub 'get_selcipra' :method
    $P0 = self.'get_terbri'(1)
    .return ($P0)
.end

.sub 'set_selcipra' :method
    .param pmc arg
    self.'set_terbri'(1,arg)
.end

.sub 'get_tercipra' :method
    $P0 = self.'get_terbri'(2)
    .return ($P0)
.end

.sub 'set_tercipra' :method
    .param pmc arg
    self.'set_terbri'(2,arg)  
.end

.sub 'go' :method
    $P0 = getattribute self, 'mei'
    eq_num $P0, 0, no_tests
    $S0 = "1.."
    $S1 = $P0
    concat $S0, $S1
    goto end
  no_tests:
    $S0 = "no namcu cu se dunda zo cipra"
  end:
    say $S0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

