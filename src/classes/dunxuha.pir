=head1 NAME

src/classes/dunxuha.pir - dunxu'a class

=cut
.namespace ["dunxu'a"]

.sub 'onload' :anon :init :load
    .local pmc p6meta, dunxuha
    p6meta = get_hll_global['dacti'], '$!P6META'
    dunxuha = p6meta.'new_class'("dunxu'a", 'parent'=>'bridi')
.end

.sub "get_dunxu'a" :method
    $P0 = self.'get_terbri'(0)
    .return ($P0)
.end

.sub "set_dunxu'a" :method
    .param pmc arg
    self.'set_terbri'(0,arg) 
.end

.sub "get_seldunxu'a" :method
    $P0 = self.'get_terbri'(1)
    .return ($P0)
.end

.sub "set_seldunxu'a" :method
    .param pmc arg
    self.'set_terbri'(1,arg)
.end

.sub "get_terdunxu'a" :method
    $P0 = self.'get_terbri'(2)
    .return ($P0)
.end

.sub "set_terdunxu'a" :method
    .param pmc arg
    self.'set_terbri'(2,arg)  
.end

.sub 'go' :method
    $P0 = getattribute self, 'mai'
    eq_num $P0, 0, no_ordinal
    $N1 = self.'get_terbri'(1)
    $N2 = self.'get_terbri'(2)
    eq_num $N1, $N2, ok
    $S0 = "not ok "
    goto test_end
  ok:
    $S0 = "ok "
  test_end:
    $S1 = $P0
    concat $S0, $S1
    goto end
  no_ordinal:
    $S0 = "ko pilno lo namcu pe zo mai noi zmadu li no"
  end:
    say $S0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

