.sub 'onload' :anon :init :load
    .local pmc p6meta, bridi
    p6meta = get_hll_global['dacti'], '$!P6META'
    bridi = p6meta.'new_class'('bridi', 'parent'=>'dacti')
    addattribute bridi, "bridi"
    addattribute bridi, "selbri"
    addattribute bridi, "terbri"
    $P0 = get_hll_global['selcmi']
    setattribute self, 'terbri', $P0.'new'()
.end

.sub 'bridi' :method :multi(_)
    $P0 = getattribute self, 'bridi'
    .return ($P0)
.end

.sub 'bridi' :method :multi(_,_)
    .param pmc arg
    setattribute self, 'bridi', arg
.end

.sub 'selbri' :method :multi(_)
    $P0 = getattribute self, 'selbri'
    .return ($P0)
.end

.sub 'selbri' :method :multi(_,_)
    .param pmc arg
    setattribute self, 'selbri', arg
.end

.sub 'terbri' :method :multi(_)
    $P0 = getattribute self, 'terbri'
    .return ($P0)
.end

.sub 'terbri' :method :multi(_,_)
    .param pmc arg
    setattribute self, 'terbri', arg
.end

.sub 'terbri' :method :multi(_,I)
    .param pmc arg
    $P0 = getattribute self, 'terbri'
    $P1 = $P0.'selcmi'()
    $P2 = $P1.'get_pmc_keyed_int'(arg)
    .return ($P2)
.end

.sub 'add_terbri' :method
    .param pmc arg
    arg."selsu'i"(self)
    $P0 = getattribute self, 'terbri'
    arg."tersu'i"($P0.'getnumber'())
    $P0.'push_pmc' arg
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

