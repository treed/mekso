=head1 NAME

src/classes/bridi.pir - bridi class

=cut
.namespace ['bridi']

.sub 'onload' :anon :init :load
    .local pmc p6meta, bridi
    p6meta = get_hll_global['dacti'], '$!P6META'
    bridi = p6meta.'new_class'('bridi', 'parent'=>'dacti')
    addattribute bridi, "bridi"
    addattribute bridi, "selbri"
    addattribute bridi, "terbri"
.end

.sub 'new' :method
    .param pmc args :slurpy
    .local pmc iter
    .local pmc bridi
    bridi = new self.'name' 
    bridi.'set_selbri'(self.'name')
    $P0 = new 'Array'
    bridi.'set_terbri'($P0)
    iter = new 'Iterator', args
  iter_loop:
    unless iter goto iter_end
    $P1 = shift iter
    bridi.'add_terbri'($P1)
    goto iter_loop
  iter_end:
    bridi.'go'()
    .return (bridi)
.end

.sub 'get_bridi' :method
    $P0 = getattribute self, 'bridi'
    .return ($P0)
.end

.sub 'set_bridi' :method
    .param pmc arg
    setattribute self, 'bridi', arg
.end

.sub 'get_selbri' :method
    $P0 = getattribute self, 'selbri'
    .return ($P0)
.end

.sub 'set_selbri' :method
    .param pmc arg
    setattribute self, 'selbri', arg
.end

.sub 'get_terbri' :method :multi(_)
    $P0 = getattribute self, 'terbri'
    .return ($P0)
.end

.sub 'set_terbri' :method :multi(_,_)
    .param pmc arg
    setattribute self, 'terbri', arg
.end

.sub 'get_terbri' :method :multi(_,I)
    .param pmc arg
    $P0 = getattribute self, 'terbri'
    $P1 = $P0.'get_pmc_keyed_int'(arg)
    .return ($P1)
.end

.sub 'set_terbri' :method :multi(_,I,_)
    .param int key
    .param pmc arg
    arg."set_selsu'i"(self)
    $I0 = key + 1
    arg."set_tersu'i"($I0)
    $P0 = getattribute self, 'terbri'
    $P0.'set_pmc_keyed_int'(key, arg)
.end

.sub 'add_terbri' :method
    .param pmc arg
    arg."set_selsu'i"(self)
    $P0 = getattribute self, 'terbri'
    $I0 = $P0.'getnumber'() + 1
    arg."set_tersu'i"($I0)
    $P0.'push_pmc' arg
.end

.sub 'go' :method
    $P0 = "troci le nu pilno zo cusku tu'a lo selbri .i la'e di'u na se jalge lo plixau"
    say $P0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

