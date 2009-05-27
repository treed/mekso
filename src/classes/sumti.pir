=head1 NAME

src/classes/sumti.pir - sumti class

=cut
.namespace ['sumti']

.sub 'onload' :anon :init :load
    .local pmc p6meta, sumti
    p6meta = get_hll_global ['dacti'], '$!P6META'
    sumti = p6meta.'new_class'('sumti', 'parent'=>'bridi')
.end

.sub 'get_sumti' :method
    $P0 = self.'get_terbri'(0)
    .return ($P0)
.end

.sub 'set_sumti' :method
    .param pmc arg
    self.'set_terbri'(0,arg)
.end

.sub "get_selsu'i" :method
    $P0 = self.'get_terbri'(1)
    .return ($P0)
.end

.sub "set_selsu'i" :method
    .param pmc arg
    self.'set_terbri'(1,arg)
.end

.sub "get_tersu'i" :method
    $P0 = self.'get_terbri'(2)
    .return ($P0)
.end

.sub "set_tersu'i" :method
    .param pmc arg
    self.'set_terbri'(2,arg)
.end

.sub "go" :method
    $P0 = "troci le nu pilno zo cusku tu'a lo selbri .i la'e di'u na se jalge lo plixau"
    say $P0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

