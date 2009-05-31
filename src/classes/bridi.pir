=head1 NAME

src/classes/bridi.pir - bridi class

=cut
.namespace ['bridi']

.sub 'onload' :anon :init :load
    .local pmc p6meta, bridi
    p6meta = get_hll_global['dacti'], '$!P6META'
    bridi = p6meta.'new_class'('bridi', 'parent'=>'dacti', 'attr'=>'bridi selbri terbri mei mai')
.end

.sub 'new' :method
    .param pmc args :slurpy
    .param int mei :named('mei') :optional
    .param int mei_flag :opt_flag
    .param int mai :named('mai') :optional
    .param int mai_flag :opt_flag
    .local pmc iter, bridi
    .local string selbri
    selbri = typeof self
    bridi = new selbri
    bridi.'set_selbri'(selbri)
    $P0 = new 'ResizablePMCArray'
    bridi.'set_terbri'($P0)
    iter = new 'Iterator', args
  iter_loop:
    unless iter goto iter_end
    $P1 = shift iter
    bridi.'add_terbri'($P1)
    goto iter_loop
  iter_end:
    $P2 = new 'BigNum'
    if mei_flag goto mei_set
    $P2 = 0
    goto mei_done
  mei_set:
    $P2 = mei
  mei_done:
    $P3 = new 'BigNum'
    if mai_flag goto mai_set
    $P3 = 0
    goto mai_done
  mai_set:
    $P3 = mai
  mai_done:
    setattribute bridi, 'mei', $P2
    setattribute bridi, 'mai', $P3
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

.sub 'get_terbri' :method :multi(_,'Integer')
    .param int arg
    $P0 = getattribute self, 'terbri'
    $P1 = $P0[arg]
    .return ($P1)
.end

.sub 'set_terbri' :method :multi(_,I,_)
    .param int key
    .param pmc arg
    $P0 = getattribute self, 'terbri'
    $P0[key] = arg
.end

.sub 'add_terbri' :method
    .param pmc arg
    $P0 = getattribute self, 'terbri'
    push $P0, arg
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

