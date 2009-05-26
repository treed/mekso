=head1 NAME

src/classes/sumti.pir - sumti class

=cut
.namespace ['sumti']

.sub 'onload' :anon :init :load
    .local pmc p6meta, sumti
    p6meta = get_hll_global ['dacti'], '$!P6META'
    sumti = p6meta.'new_class'('sumti', 'parent'=>'bridi')
    addattribute sumti, "sumti"
    addattribute sumti, "selsu'i"
    addattribute sumti, "tersu'i"
.end

.sub 'sumti' :method :multi(_)
    $P0 = getattribute self, "sumti"
    .return ($P0)
.end

.sub 'sumti' :method :multi(_,_)
    .param pmc arg
    setattribute self, "sumti", arg
.end

.sub "selsu'i" :method :multi(_)
    $P0 = getattribute self, "selsu'i"
    .return ($P0)
.end

.sub "selsu'i" :method :multi(_,_)
    .param pmc arg
    setattribute self, "selsu'i", arg
.end

.sub "tersu'i" :method :multi(_)
    $P0 = getattribute self, "tersu'i"
    .return ($P0)
.end

.sub "tersu'i" :method :multi(_,_)
    .param pmc arg
    setattribute self, "tersu'i", arg
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

