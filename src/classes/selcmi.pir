=head1 NAME

src/classes/selcmi.pir - cmima class

=cut
.namespace ['selcmi']

.sub 'onload' :anon :init :load
    .local pmc p6meta, sumti
    p6meta = get_hll_global ['dacti'], '$!P6META'
    sumti = p6meta.'new_class'('selcmi', 'parent'=>'bridi')
    addattribute sumti, "cmima"
    addattribute sumti, "selcmi"
    $P0 = get_hll_global 'Array'
    setattribute sumti, "selcmi", $P0.'new'()
.end

.sub 'cmima' :method :multi(_)
    $P0 = getattribute self, "cmima"
    .return ($P0)
.end

.sub 'cmima' :method :multi(_,_)
    .param pmc arg
    setattribute self, "cmima", arg
.end

.sub "selcmi" :method :multi(_)
    $P0 = getattribute self, "selcmi"
    .return ($P0)
.end

.sub "selcmi" :method :multi(_,_)
    .param pmc arg
    setattribute self, "selcmi", arg
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

