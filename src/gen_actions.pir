
.namespace []
.sub "_block11"  :anon :subid("10_1242369902")
.annotate "line", 19
    get_hll_global $P14, ["mekso";"Grammar";"Actions"], "_block13" 
.annotate "line", 1
    .return ($P14)
.end


.namespace ["mekso";"Grammar";"Actions"]
.sub "_block13" :init :load :subid("11_1242369902")
.annotate "line", 19
    .const 'Sub' $P157 = "23_1242369902" 
    capture_lex $P157
    .const 'Sub' $P145 = "22_1242369902" 
    capture_lex $P145
    .const 'Sub' $P133 = "21_1242369902" 
    capture_lex $P133
    .const 'Sub' $P121 = "20_1242369902" 
    capture_lex $P121
    .const 'Sub' $P67 = "16_1242369902" 
    capture_lex $P67
    .const 'Sub' $P41 = "14_1242369902" 
    capture_lex $P41
    .const 'Sub' $P15 = "12_1242369902" 
    capture_lex $P15
        $P0 = get_root_global ['parrot'], 'P6metaclass'
        $P1 = split '::', 'mekso::Grammar::Actions'
        push_eh subclass_done
        $P2 = $P0.'new_class'($P1)
      subclass_done:
        pop_eh
.annotate "line", 83
    .const 'Sub' $P157 = "23_1242369902" 
    capture_lex $P157
.annotate "line", 19
    .return ($P157)
.end


.namespace ["mekso";"Grammar";"Actions"]
.sub "TOP"  :subid("12_1242369902") :method :outer("11_1242369902")
    .param pmc param_18
.annotate "line", 19
    .const 'Sub' $P28 = "13_1242369902" 
    capture_lex $P28
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "$/", param_18
.annotate "line", 20
    get_hll_global $P19, ["PAST"], "Block"
    find_lex $P20, "$/"
    unless_null $P20, vivify_24
    new $P20, "Undef"
  vivify_24:
    $P21 = $P19."new"("declaration" :named("blocktype"), $P20 :named("node"), "mekso" :named("hll"))
    .lex "$past", $P21
.annotate "line", 21
    find_lex $P23, "$/"
    set $P24, $P23["statement"]
    unless_null $P24, vivify_25
    new $P24, "Undef"
  vivify_25:
    defined $I25, $P24
    unless $I25, for_undef_26
    iter $P22, $P24
    new $P35, 'ExceptionHandler'
    set_addr $P35, loop34_handler
    $P35."handle_types"(65, 67, 66)
    push_eh $P35
  loop34_test:
    unless $P22, loop34_done
    shift $P26, $P22
  loop34_redo:
    .const 'Sub' $P28 = "13_1242369902" 
    capture_lex $P28
    $P28($P26)
  loop34_next:
    goto loop34_test
  loop34_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P36, exception, 'type'
    eq $P36, 65, loop34_next
    eq $P36, 67, loop34_redo
  loop34_done:
    pop_eh 
  for_undef_26:
    find_lex $P37, "$/"
.annotate "line", 24
    find_lex $P38, "$past"
    unless_null $P38, vivify_29
    new $P38, "Undef"
  vivify_29:
    $P39 = $P37."!make"($P38)
.annotate "line", 19
    .return ($P39)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P40, exception, "payload"
    .return ($P40)
    rethrow exception
.end


.namespace ["mekso";"Grammar";"Actions"]
.sub "_block27"  :anon :subid("13_1242369902") :outer("12_1242369902")
    .param pmc param_29
.annotate "line", 21
    .lex "$_", param_29
.annotate "line", 22
    find_lex $P30, "$past"
    unless_null $P30, vivify_27
    new $P30, "Undef"
  vivify_27:
    find_lex $P31, "$_"
    unless_null $P31, vivify_28
    new $P31, "Undef"
  vivify_28:
    $P32 = $P31."ast"()
    $P33 = $P30."push"($P32)
.annotate "line", 21
    .return ($P33)
.end


.namespace ["mekso";"Grammar";"Actions"]
.sub "statement"  :subid("14_1242369902") :method :outer("11_1242369902")
    .param pmc param_44
.annotate "line", 28
    .const 'Sub' $P54 = "15_1242369902" 
    capture_lex $P54
    new $P43, 'ExceptionHandler'
    set_addr $P43, control_42
    $P43."handle_types"(58)
    push_eh $P43
    .lex "$/", param_44
.annotate "line", 29
    get_hll_global $P45, ["PAST"], "Op"
    find_lex $P46, "$/"
    unless_null $P46, vivify_30
    new $P46, "Undef"
  vivify_30:
    $P47 = $P45."new"("say" :named("name"), "call" :named("pasttype"), $P46 :named("node"))
    .lex "$past", $P47
.annotate "line", 30
    find_lex $P49, "$/"
    set $P50, $P49["expression"]
    unless_null $P50, vivify_31
    new $P50, "Undef"
  vivify_31:
    defined $I51, $P50
    unless $I51, for_undef_32
    iter $P48, $P50
    new $P61, 'ExceptionHandler'
    set_addr $P61, loop60_handler
    $P61."handle_types"(65, 67, 66)
    push_eh $P61
  loop60_test:
    unless $P48, loop60_done
    shift $P52, $P48
  loop60_redo:
    .const 'Sub' $P54 = "15_1242369902" 
    capture_lex $P54
    $P54($P52)
  loop60_next:
    goto loop60_test
  loop60_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P62, exception, 'type'
    eq $P62, 65, loop60_next
    eq $P62, 67, loop60_redo
  loop60_done:
    pop_eh 
  for_undef_32:
    find_lex $P63, "$/"
.annotate "line", 33
    find_lex $P64, "$past"
    unless_null $P64, vivify_35
    new $P64, "Undef"
  vivify_35:
    $P65 = $P63."!make"($P64)
.annotate "line", 28
    .return ($P65)
  control_42:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P66, exception, "payload"
    .return ($P66)
    rethrow exception
.end


.namespace ["mekso";"Grammar";"Actions"]
.sub "_block53"  :anon :subid("15_1242369902") :outer("14_1242369902")
    .param pmc param_55
.annotate "line", 30
    .lex "$_", param_55
.annotate "line", 31
    find_lex $P56, "$past"
    unless_null $P56, vivify_33
    new $P56, "Undef"
  vivify_33:
    find_lex $P57, "$_"
    unless_null $P57, vivify_34
    new $P57, "Undef"
  vivify_34:
    $P58 = $P57."ast"()
    $P59 = $P56."push"($P58)
.annotate "line", 30
    .return ($P59)
.end


.namespace ["mekso";"Grammar";"Actions"]
.sub "expression"  :subid("16_1242369902") :method :outer("11_1242369902")
    .param pmc param_70
    .param pmc param_71
.annotate "line", 46
    .const 'Sub' $P86 = "18_1242369902" 
    capture_lex $P86
    .const 'Sub' $P78 = "17_1242369902" 
    capture_lex $P78
    new $P69, 'ExceptionHandler'
    set_addr $P69, control_68
    $P69."handle_types"(58)
    push_eh $P69
    .lex "$/", param_70
    .lex "$key", param_71
.annotate "line", 47
    find_lex $P74, "$key"
    unless_null $P74, vivify_36
    new $P74, "Undef"
  vivify_36:
    set $S75, $P74
    iseq $I76, $S75, "end"
    if $I76, if_73
.annotate "line", 50
    .const 'Sub' $P86 = "18_1242369902" 
    capture_lex $P86
    $P119 = $P86()
    set $P72, $P119
.annotate "line", 47
    goto if_73_end
  if_73:
    .const 'Sub' $P78 = "17_1242369902" 
    capture_lex $P78
    $P84 = $P78()
    set $P72, $P84
  if_73_end:
.annotate "line", 46
    .return ($P72)
  control_68:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, "payload"
    .return ($P120)
    rethrow exception
.end


.namespace ["mekso";"Grammar";"Actions"]
.sub "_block85"  :anon :subid("18_1242369902") :outer("16_1242369902")
.annotate "line", 50
    .const 'Sub' $P107 = "19_1242369902" 
    capture_lex $P107
.annotate "line", 51
    get_hll_global $P87, ["PAST"], "Op"
    find_lex $P88, "$/"
    set $P89, $P88["type"]
    unless_null $P89, vivify_37
    new $P89, "Undef"
  vivify_37:
.annotate "line", 52
    find_lex $P90, "$/"
    set $P91, $P90["top"]
    unless_null $P91, vivify_38
    new $P91, "Hash"
  vivify_38:
    set $P92, $P91["pasttype"]
    unless_null $P92, vivify_39
    new $P92, "Undef"
  vivify_39:
.annotate "line", 53
    find_lex $P93, "$/"
    set $P94, $P93["top"]
    unless_null $P94, vivify_40
    new $P94, "Hash"
  vivify_40:
    set $P95, $P94["pirop"]
    unless_null $P95, vivify_41
    new $P95, "Undef"
  vivify_41:
.annotate "line", 54
    find_lex $P96, "$/"
    set $P97, $P96["top"]
    unless_null $P97, vivify_42
    new $P97, "Hash"
  vivify_42:
    set $P98, $P97["lvalue"]
    unless_null $P98, vivify_43
    new $P98, "Undef"
  vivify_43:
.annotate "line", 55
    find_lex $P99, "$/"
    unless_null $P99, vivify_44
    new $P99, "Undef"
  vivify_44:
    $P100 = $P87."new"($P89 :named("name"), $P92 :named("pasttype"), $P95 :named("pirop"), $P98 :named("lvalue"), $P99 :named("node"))
.annotate "line", 51
    .lex "$past", $P100
.annotate "line", 57
    find_lex $P102, "$/"
    unless_null $P102, vivify_45
    new $P102, "Undef"
  vivify_45:
    $P103 = $P102."list"()
    defined $I104, $P103
    unless $I104, for_undef_46
    iter $P101, $P103
    new $P114, 'ExceptionHandler'
    set_addr $P114, loop113_handler
    $P114."handle_types"(65, 67, 66)
    push_eh $P114
  loop113_test:
    unless $P101, loop113_done
    shift $P105, $P101
  loop113_redo:
    .const 'Sub' $P107 = "19_1242369902" 
    capture_lex $P107
    $P107($P105)
  loop113_next:
    goto loop113_test
  loop113_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, 65, loop113_next
    eq $P115, 67, loop113_redo
  loop113_done:
    pop_eh 
  for_undef_46:
    find_lex $P116, "$/"
.annotate "line", 60
    find_lex $P117, "$past"
    unless_null $P117, vivify_49
    new $P117, "Undef"
  vivify_49:
    $P118 = $P116."!make"($P117)
.annotate "line", 50
    .return ($P118)
.end


.namespace ["mekso";"Grammar";"Actions"]
.sub "_block106"  :anon :subid("19_1242369902") :outer("18_1242369902")
    .param pmc param_108
.annotate "line", 57
    .lex "$_", param_108
.annotate "line", 58
    find_lex $P109, "$past"
    unless_null $P109, vivify_47
    new $P109, "Undef"
  vivify_47:
    find_lex $P110, "$_"
    unless_null $P110, vivify_48
    new $P110, "Undef"
  vivify_48:
    $P111 = $P110."ast"()
    $P112 = $P109."push"($P111)
.annotate "line", 57
    .return ($P112)
.end


.namespace ["mekso";"Grammar";"Actions"]
.sub "_block77"  :anon :subid("17_1242369902") :outer("16_1242369902")
.annotate "line", 48
    find_lex $P79, "$/"
    find_lex $P80, "$/"
    set $P81, $P80["expr"]
    unless_null $P81, vivify_50
    new $P81, "Undef"
  vivify_50:
    $P82 = $P81."ast"()
    $P83 = $P79."!make"($P82)
.annotate "line", 47
    .return ($P83)
.end


.namespace ["mekso";"Grammar";"Actions"]
.sub "term"  :subid("20_1242369902") :method :outer("11_1242369902")
    .param pmc param_124
    .param pmc param_125
.annotate "line", 68
    new $P123, 'ExceptionHandler'
    set_addr $P123, control_122
    $P123."handle_types"(58)
    push_eh $P123
    .lex "$/", param_124
    .lex "$key", param_125
.annotate "line", 69
    find_lex $P126, "$/"
    find_lex $P127, "$key"
    unless_null $P127, vivify_51
    new $P127, "Undef"
  vivify_51:
    find_lex $P128, "$/"
    unless_null $P128, vivify_52
    new $P128, "Hash"
  vivify_52:
    set $P129, $P128[$P127]
    unless_null $P129, vivify_53
    new $P129, "Undef"
  vivify_53:
    $P130 = $P129."ast"()
    $P131 = $P126."!make"($P130)
.annotate "line", 68
    .return ($P131)
  control_122:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P132, exception, "payload"
    .return ($P132)
    rethrow exception
.end


.namespace ["mekso";"Grammar";"Actions"]
.sub "value"  :subid("21_1242369902") :method :outer("11_1242369902")
    .param pmc param_136
    .param pmc param_137
.annotate "line", 73
    new $P135, 'ExceptionHandler'
    set_addr $P135, control_134
    $P135."handle_types"(58)
    push_eh $P135
    .lex "$/", param_136
    .lex "$key", param_137
.annotate "line", 74
    find_lex $P138, "$/"
    find_lex $P139, "$key"
    unless_null $P139, vivify_54
    new $P139, "Undef"
  vivify_54:
    find_lex $P140, "$/"
    unless_null $P140, vivify_55
    new $P140, "Hash"
  vivify_55:
    set $P141, $P140[$P139]
    unless_null $P141, vivify_56
    new $P141, "Undef"
  vivify_56:
    $P142 = $P141."ast"()
    $P143 = $P138."!make"($P142)
.annotate "line", 73
    .return ($P143)
  control_134:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P144, exception, "payload"
    .return ($P144)
    rethrow exception
.end


.namespace ["mekso";"Grammar";"Actions"]
.sub "integer"  :subid("22_1242369902") :method :outer("11_1242369902")
    .param pmc param_148
.annotate "line", 78
    new $P147, 'ExceptionHandler'
    set_addr $P147, control_146
    $P147."handle_types"(58)
    push_eh $P147
    .lex "$/", param_148
.annotate "line", 79
    find_lex $P149, "$/"
    get_hll_global $P150, ["PAST"], "Val"
    find_lex $P151, "$/"
    unless_null $P151, vivify_57
    new $P151, "Undef"
  vivify_57:
    set $S152, $P151
    find_lex $P153, "$/"
    unless_null $P153, vivify_58
    new $P153, "Undef"
  vivify_58:
    $P154 = $P150."new"($S152 :named("value"), "Integer" :named("returns"), $P153 :named("node"))
    $P155 = $P149."!make"($P154)
.annotate "line", 78
    .return ($P155)
  control_146:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P156, exception, "payload"
    .return ($P156)
    rethrow exception
.end


.namespace ["mekso";"Grammar";"Actions"]
.sub "quote"  :subid("23_1242369902") :method :outer("11_1242369902")
    .param pmc param_160
.annotate "line", 83
    new $P159, 'ExceptionHandler'
    set_addr $P159, control_158
    $P159."handle_types"(58)
    push_eh $P159
    .lex "$/", param_160
.annotate "line", 84
    find_lex $P161, "$/"
    get_hll_global $P162, ["PAST"], "Val"
    find_lex $P163, "$/"
    set $P164, $P163["string_literal"]
    unless_null $P164, vivify_59
    new $P164, "Undef"
  vivify_59:
    $P165 = $P164."ast"()
    find_lex $P166, "$/"
    unless_null $P166, vivify_60
    new $P166, "Undef"
  vivify_60:
    $P167 = $P162."new"($P165 :named("value"), $P166 :named("node"))
    $P168 = $P161."!make"($P167)
.annotate "line", 83
    .return ($P168)
  control_158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P169, exception, "payload"
    .return ($P169)
    rethrow exception
.end

