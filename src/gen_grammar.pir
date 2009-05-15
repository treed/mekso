      .sub '__onload' :load :init
          .local pmc optable
          ## namespace mekso::Grammar
          .local pmc p6meta
          p6meta = get_root_global ['parrot'], 'P6metaclass'
          $P0 = p6meta.'get_proto'('mekso::Grammar')
          unless null $P0 goto onload_324
          p6meta.'new_class'('mekso::Grammar', 'parent'=>'PCT::Grammar')
        onload_324:
          optable = new ['PGE';'OPTable']
          set_hll_global ["mekso";"Grammar"], '$optable', optable
          $P0 = get_hll_global ["mekso";"Grammar"], 'term'
          optable.'newtok'("term:", 'precedence'=>"=", 'parsed'=>$P0)
          optable.'newtok'("infix:*", 'looser'=>"term:", 'pirop'=>"mul")
          optable.'newtok'("infix:/", 'equiv'=>"infix:*", 'pirop'=>"div")
          optable.'newtok'("infix:+", 'looser'=>"infix:*", 'pirop'=>"add")
          optable.'newtok'("infix:-", 'equiv'=>"infix:+", 'pirop'=>"sub")
          .return ()
      .end

## <mekso::Grammar::TOP>
.namespace ["mekso";"Grammar"]
      .sub "TOP" :method 
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc mob
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = get_hll_global ['PGE'], '$!MATCH'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(self, adverbs :flat :named)
          .local int lastpos
          lastpos = length target
          if cpos > lastpos goto fail_rule
          .local pmc cstack :unique_reg
          cstack = new 'ResizableIntegerArray'
          .local pmc ustack :unique_reg
          ustack = new 'ResizablePMCArray'
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, rep, cutmark :unique_reg
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          local_branch cstack, R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          local_return cstack
        fail_match:
          cutmark = -3
          goto fail_cut
        R: # concat
        R245: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R245_1
          $P0 = find_method mob, 'ws'
          goto R245_2
        R245_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R245_2
          say "Unable to find regex 'ws'"
        R245_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R246
          
          goto fail
        R246:  # quant 0..Inf none
          local_branch cstack, R246_repeat
          if cutmark != 249 goto fail
          cutmark = 0
          goto fail
        R246_repeat:
          push ustack, pos
          local_branch cstack, R248
          pos = pop ustack
          if cutmark != 0 goto fail
          local_branch cstack, R247
          if cutmark != 0 goto fail
          cutmark = 249
          goto fail
        R248: # subrule statement
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'statement'
          if $I0 == 0 goto R248_1
          $P0 = find_method mob, 'statement'
          goto R248_2
        R248_1:
          $P0 = find_name 'statement'
          unless null $P0 goto R248_2
          say "Unable to find regex 'statement'"
        R248_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'dba'=>"", 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
                    $I0 = defined captscope["statement"]
          if $I0 goto R248_cgen
          $P0 = new 'ResizablePMCArray'
          captscope["statement"] = $P0
          local_branch cstack, R248_cgen
          delete captscope["statement"]
          goto fail
        R248_cgen:

          $P2 = captscope["statement"]
          push $P2, captob

          pos = $P1
          local_branch cstack, R248_3
          $P2 = captscope["statement"]
          $P2 = pop $P2

          goto fail
        R248_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R246_repeat
          push ustack, captob
          local_branch cstack, R246_repeat
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.'next'()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R248_3
          if $P1 <= -3 goto fail_match
          goto fail

        R247: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R247_1
          $P0 = find_method mob, 'ws'
          goto R247_2
        R247_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R247_2
          say "Unable to find regex 'ws'"
        R247_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R250
          
          goto fail
        R250:  # group 244
          local_branch cstack, R252
          if cutmark != 244 goto fail
          cutmark = 0
          goto fail

        R252: # concat
        R253:  # alt R255, R256
          push ustack, pos
          local_branch cstack, R255
          pos = pop ustack
          if cutmark != 0 goto fail
          goto R256

        R255: # concat
        R257: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R257_1
          $P0 = find_method mob, 'ws'
          goto R257_2
        R257_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R257_2
          say "Unable to find regex 'ws'"
        R257_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R258
          
          goto fail
        R258: # anchor eos
          if pos == lastpos goto R259
          goto fail
        R259: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R259_1
          $P0 = find_method mob, 'ws'
          goto R259_2
        R259_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R259_2
          say "Unable to find regex 'ws'"
        R259_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R254
          
          goto fail
        R256: # concat
        R260: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R260_1
          $P0 = find_method mob, 'ws'
          goto R260_2
        R260_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R260_2
          say "Unable to find regex 'ws'"
        R260_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R261
          
          goto fail
        R261: # subrule panic
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'panic'
          if $I0 == 0 goto R261_1
          $P0 = find_method mob, 'panic'
          goto R261_2
        R261_1:
          $P0 = find_name 'panic'
          unless null $P0 goto R261_2
          say "Unable to find regex 'panic'"
        R261_2:
          $P2 = adverbs['action']
          captob = $P0(captob, "Syntax error", 'dba'=>"", 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          captscope["panic"] = captob

          pos = $P1
          local_branch cstack, R262
          delete captscope["panic"]

          goto fail
        R262: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R262_1
          $P0 = find_method mob, 'ws'
          goto R262_2
        R262_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R262_2
          say "Unable to find regex 'ws'"
        R262_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R254
          
          goto fail
        R254: # cut 244
          local_branch cstack, R251
          cutmark = 244
          goto fail

        R251: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R251_1
          $P0 = find_method mob, 'ws'
          goto R251_2
        R251_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R251_2
          say "Unable to find regex 'ws'"
        R251_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R263
          
          goto fail
        R263: # action
          $P1 = adverbs['action']
          if null $P1 goto R264
          $I1 = can $P1, "TOP"
          if $I1 == 0 goto R264
          mpos = pos
          $P1."TOP"(mob)
          goto R264
        R264: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R264_1
          $P0 = find_method mob, 'ws'
          goto R264_2
        R264_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R264_2
          say "Unable to find regex 'ws'"
        R264_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, succeed
          
          goto fail
      .end

## <mekso::Grammar::ws>
.namespace ["mekso";"Grammar"]
      .sub "ws" :method 
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc mob
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = get_hll_global ['PGE'], '$!MATCH'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(self, adverbs :flat :named)
          .local int lastpos
          lastpos = length target
          if cpos > lastpos goto fail_rule
          .local pmc cstack :unique_reg
          cstack = new 'ResizableIntegerArray'
          .local pmc ustack :unique_reg
          ustack = new 'ResizablePMCArray'
          .local pmc gpad :unique_reg
          gpad = new 'ResizablePMCArray'
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, rep, cutmark :unique_reg
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          local_branch cstack, R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          local_return cstack
        fail_match:
          cutmark = -3
          goto fail_cut
        R: # concat
        R265: # subrule ww
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ww'
          if $I0 == 0 goto R265_1
          $P0 = find_method mob, 'ww'
          goto R265_2
        R265_1:
          $P0 = find_name 'ww'
          unless null $P0 goto R265_2
          say "Unable to find regex 'ww'"
        R265_2:
          captob = $P0(captob, 'dba'=>"")
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          unless $P1 < 0 goto fail
          $P1 = pos
          $P1 = getattribute captob, '$.from'
          $P1 = pos
          goto R266
        R266:  # quant 0..Inf none
          local_branch cstack, R266_repeat
          if cutmark != 268 goto fail
          cutmark = 0
          goto fail
        R266_repeat:
          push ustack, pos
          local_branch cstack, R267
          pos = pop ustack
          if cutmark != 0 goto fail
          local_branch cstack, succeed
          if cutmark != 0 goto fail
          cutmark = 268
          goto fail
        R267:  # alt R269, R270
          push ustack, pos
          local_branch cstack, R269
          pos = pop ustack
          if cutmark != 0 goto fail
          goto R270

        R269: # concat
        R271: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "#" goto fail
          pos += 1
          goto R272

        R272: # cclass \N 0..2147483647 (3)
          $I0 = find_cclass 4096, target, pos, lastpos
          rep = $I0 - pos
          ### if rep < 0 goto fail
          ### if rep <= 2147483647 goto R272_1
          ### rep = 2147483647
        R272_1:
          pos += rep
          goto R273
        R273:  # quant 0..1 (3) greedy/none
          push gpad, 0
          local_branch cstack, R273_repeat
          $I0 = pop gpad
          if cutmark != 275 goto fail
          cutmark = 0
          goto fail
        R273_repeat:
          rep = gpad[-1]
          if rep >= 1 goto R273_1
          inc rep
          gpad[-1] = rep
          push ustack, pos
          push ustack, rep
          local_branch cstack, R274
          rep = pop ustack
          pos = pop ustack
          if cutmark != 0 goto fail
          dec rep
        R273_1:
          ### if rep < 0 goto fail
          $I0 = pop gpad
          push ustack, rep
          local_branch cstack, R266_repeat
          rep = pop ustack
          push gpad, rep
          if cutmark != 0 goto fail
          cutmark = 275
          goto fail

        R274: # newline
          $I0 = is_cclass 4096, target, pos
          if $I0 == 0 goto fail
          $S0 = substr target, pos, 2
          inc pos
          if $S0 != "\r\n" goto R273_repeat
          inc pos
          goto R273_repeat
        R270: # cclass \s 1..2147483647 (3)
          $I0 = find_not_cclass 32, target, pos, lastpos
          rep = $I0 - pos
          if rep < 1 goto fail
          ### if rep <= 2147483647 goto R270_1
          ### rep = 2147483647
        R270_1:
          pos += rep
          goto R266_repeat
      .end

## <mekso::Grammar::statement>
.namespace ["mekso";"Grammar"]
      .sub "statement" :method 
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc mob
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = get_hll_global ['PGE'], '$!MATCH'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(self, adverbs :flat :named)
          .local int lastpos
          lastpos = length target
          if cpos > lastpos goto fail_rule
          .local pmc cstack :unique_reg
          cstack = new 'ResizableIntegerArray'
          .local pmc ustack :unique_reg
          ustack = new 'ResizablePMCArray'
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, rep, cutmark :unique_reg
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          local_branch cstack, R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          local_return cstack
        fail_match:
          cutmark = -3
          goto fail_cut
        R: # concat
        R276: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R276_1
          $P0 = find_method mob, 'ws'
          goto R276_2
        R276_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R276_2
          say "Unable to find regex 'ws'"
        R276_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R277
          
          goto fail
        R277: # literal
          $I0 = pos + 3
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 3
          
          if $S0 != "say" goto fail
          pos += 3
          goto R278

        R278: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R278_1
          $P0 = find_method mob, 'ws'
          goto R278_2
        R278_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R278_2
          say "Unable to find regex 'ws'"
        R278_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R279
          
          goto fail
        R279: # subrule expression
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'expression'
          if $I0 == 0 goto R279_1
          $P0 = find_method mob, 'expression'
          goto R279_2
        R279_1:
          $P0 = find_name 'expression'
          unless null $P0 goto R279_2
          say "Unable to find regex 'expression'"
        R279_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'dba'=>"", 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
                    $I0 = defined captscope["expression"]
          if $I0 goto R279_cgen
          $P0 = new 'ResizablePMCArray'
          captscope["expression"] = $P0
          local_branch cstack, R279_cgen
          delete captscope["expression"]
          goto fail
        R279_cgen:

          $P2 = captscope["expression"]
          push $P2, captob

          pos = $P1
          local_branch cstack, R280
          $P2 = captscope["expression"]
          $P2 = pop $P2

          goto fail
        R280: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R280_1
          $P0 = find_method mob, 'ws'
          goto R280_2
        R280_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R280_2
          say "Unable to find regex 'ws'"
        R280_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R281
          
          goto fail
        R281:  # quant 0..Inf none
          local_branch cstack, R281_repeat
          if cutmark != 284 goto fail
          cutmark = 0
          goto fail
        R281_repeat:
          push ustack, pos
          local_branch cstack, R283
          pos = pop ustack
          if cutmark != 0 goto fail
          local_branch cstack, R282
          if cutmark != 0 goto fail
          cutmark = 284
          goto fail
        R283: # concat
        R285: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R285_1
          $P0 = find_method mob, 'ws'
          goto R285_2
        R285_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R285_2
          say "Unable to find regex 'ws'"
        R285_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R286
          
          goto fail
        R286: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "," goto fail
          pos += 1
          goto R287

        R287: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R287_1
          $P0 = find_method mob, 'ws'
          goto R287_2
        R287_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R287_2
          say "Unable to find regex 'ws'"
        R287_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R288
          
          goto fail
        R288: # subrule expression
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'expression'
          if $I0 == 0 goto R288_1
          $P0 = find_method mob, 'expression'
          goto R288_2
        R288_1:
          $P0 = find_name 'expression'
          unless null $P0 goto R288_2
          say "Unable to find regex 'expression'"
        R288_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'dba'=>"", 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
                    $I0 = defined captscope["expression"]
          if $I0 goto R288_cgen
          $P0 = new 'ResizablePMCArray'
          captscope["expression"] = $P0
          local_branch cstack, R288_cgen
          delete captscope["expression"]
          goto fail
        R288_cgen:

          $P2 = captscope["expression"]
          push $P2, captob

          pos = $P1
          local_branch cstack, R289
          $P2 = captscope["expression"]
          $P2 = pop $P2

          goto fail
        R289: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R289_1
          $P0 = find_method mob, 'ws'
          goto R289_2
        R289_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R289_2
          say "Unable to find regex 'ws'"
        R289_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R281_repeat
          
          goto fail
        R282: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R282_1
          $P0 = find_method mob, 'ws'
          goto R282_2
        R282_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R282_2
          say "Unable to find regex 'ws'"
        R282_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R290
          
          goto fail
        R290: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != ";" goto fail
          pos += 1
          goto R291

        R291: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R291_1
          $P0 = find_method mob, 'ws'
          goto R291_2
        R291_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R291_2
          say "Unable to find regex 'ws'"
        R291_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R292
          
          goto fail
        R292: # action
          $P1 = adverbs['action']
          if null $P1 goto R293
          $I1 = can $P1, "statement"
          if $I1 == 0 goto R293
          mpos = pos
          $P1."statement"(mob)
          goto R293
        R293: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R293_1
          $P0 = find_method mob, 'ws'
          goto R293_2
        R293_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R293_2
          say "Unable to find regex 'ws'"
        R293_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, succeed
          
          goto fail
      .end

## <mekso::Grammar::value>
.namespace ["mekso";"Grammar"]
      .sub "value" :method 
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc mob
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = get_hll_global ['PGE'], '$!MATCH'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(self, adverbs :flat :named)
          .local int lastpos
          lastpos = length target
          if cpos > lastpos goto fail_rule
          .local pmc cstack :unique_reg
          cstack = new 'ResizableIntegerArray'
          .local pmc ustack :unique_reg
          ustack = new 'ResizablePMCArray'
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, rep, cutmark :unique_reg
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          local_branch cstack, R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          local_return cstack
        fail_match:
          cutmark = -3
          goto fail_cut
        R:  # alt R294, R295
          push ustack, pos
          local_branch cstack, R294
          pos = pop ustack
          if cutmark != 0 goto fail
          goto R295

        R294: # concat
        R296: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R296_1
          $P0 = find_method mob, 'ws'
          goto R296_2
        R296_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R296_2
          say "Unable to find regex 'ws'"
        R296_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R297
          
          goto fail
        R297: # subrule integer
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'integer'
          if $I0 == 0 goto R297_1
          $P0 = find_method mob, 'integer'
          goto R297_2
        R297_1:
          $P0 = find_name 'integer'
          unless null $P0 goto R297_2
          say "Unable to find regex 'integer'"
        R297_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'dba'=>"", 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          captscope["integer"] = captob

          pos = $P1
          local_branch cstack, R298
          delete captscope["integer"]

          goto fail
        R298: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R298_1
          $P0 = find_method mob, 'ws'
          goto R298_2
        R298_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R298_2
          say "Unable to find regex 'ws'"
        R298_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R299
          
          goto fail
        R299: # action
          $P1 = adverbs['action']
          if null $P1 goto R300
          $I1 = can $P1, "value"
          if $I1 == 0 goto R300
          mpos = pos
          $P1."value"(mob, "integer")
          goto R300
        R300: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R300_1
          $P0 = find_method mob, 'ws'
          goto R300_2
        R300_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R300_2
          say "Unable to find regex 'ws'"
        R300_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, succeed
          
          goto fail
        R295: # concat
        R301: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R301_1
          $P0 = find_method mob, 'ws'
          goto R301_2
        R301_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R301_2
          say "Unable to find regex 'ws'"
        R301_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R302
          
          goto fail
        R302: # subrule quote
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'quote'
          if $I0 == 0 goto R302_1
          $P0 = find_method mob, 'quote'
          goto R302_2
        R302_1:
          $P0 = find_name 'quote'
          unless null $P0 goto R302_2
          say "Unable to find regex 'quote'"
        R302_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'dba'=>"", 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          captscope["quote"] = captob

          pos = $P1
          local_branch cstack, R303
          delete captscope["quote"]

          goto fail
        R303: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R303_1
          $P0 = find_method mob, 'ws'
          goto R303_2
        R303_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R303_2
          say "Unable to find regex 'ws'"
        R303_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, R304
          
          goto fail
        R304: # action
          $P1 = adverbs['action']
          if null $P1 goto R305
          $I1 = can $P1, "value"
          if $I1 == 0 goto R305
          mpos = pos
          $P1."value"(mob, "quote")
          goto R305
        R305: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R305_1
          $P0 = find_method mob, 'ws'
          goto R305_2
        R305_1:
          $P0 = find_name 'ws'
          unless null $P0 goto R305_2
          say "Unable to find regex 'ws'"
        R305_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          local_branch cstack, succeed
          
          goto fail
      .end

## <mekso::Grammar::integer>
.namespace ["mekso";"Grammar"]
      .sub "integer" :method 
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc mob
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = get_hll_global ['PGE'], '$!MATCH'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(self, adverbs :flat :named)
          .local int lastpos
          lastpos = length target
          if cpos > lastpos goto fail_rule
          .local pmc cstack :unique_reg
          cstack = new 'ResizableIntegerArray'
          .local int pos, rep, cutmark :unique_reg
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          local_branch cstack, R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          local_return cstack
        R: # concat
        R306: # cclass \d 1..2147483647 (3)
          $I0 = find_not_cclass 8, target, pos, lastpos
          rep = $I0 - pos
          if rep < 1 goto fail
          ### if rep <= 2147483647 goto R306_1
          ### rep = 2147483647
        R306_1:
          pos += rep
          goto R307
        R307: # action
          $P1 = adverbs['action']
          if null $P1 goto succeed
          $I1 = can $P1, "integer"
          if $I1 == 0 goto succeed
          mpos = pos
          $P1."integer"(mob)
          goto succeed
      .end

## <mekso::Grammar::quote>
.namespace ["mekso";"Grammar"]
      .sub "quote" :method 
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc mob
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = get_hll_global ['PGE'], '$!MATCH'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(self, adverbs :flat :named)
          .local int lastpos
          lastpos = length target
          if cpos > lastpos goto fail_rule
          .local pmc cstack :unique_reg
          cstack = new 'ResizableIntegerArray'
          .local pmc ustack :unique_reg
          ustack = new 'ResizablePMCArray'
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, rep, cutmark :unique_reg
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          local_branch cstack, R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          local_return cstack
        fail_match:
          cutmark = -3
          goto fail_cut
        R: # concat
        R309:  # group 308
          local_branch cstack, R311
          if cutmark != 308 goto fail
          cutmark = 0
          goto fail

        R311: # concat
        R312:  # alt R314, R315
          push ustack, pos
          local_branch cstack, R314
          pos = pop ustack
          if cutmark != 0 goto fail
          goto R315

        R314: # concat
        R316: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "'" goto fail
          pos += 1
          goto R317

        R317: # subrule string_literal
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'string_literal'
          if $I0 == 0 goto R317_1
          $P0 = find_method mob, 'string_literal'
          goto R317_2
        R317_1:
          $P0 = find_name 'string_literal'
          unless null $P0 goto R317_2
          say "Unable to find regex 'string_literal'"
        R317_2:
          $P2 = adverbs['action']
          captob = $P0(captob, "'", 'dba'=>"", 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          captscope["string_literal"] = captob

          pos = $P1
          local_branch cstack, R318
          delete captscope["string_literal"]

          goto fail
        R318: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "'" goto fail
          pos += 1
          goto R313

        R315: # concat
        R319: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "\"" goto fail
          pos += 1
          goto R320

        R320: # subrule string_literal
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'string_literal'
          if $I0 == 0 goto R320_1
          $P0 = find_method mob, 'string_literal'
          goto R320_2
        R320_1:
          $P0 = find_name 'string_literal'
          unless null $P0 goto R320_2
          say "Unable to find regex 'string_literal'"
        R320_2:
          $P2 = adverbs['action']
          captob = $P0(captob, "\"", 'dba'=>"", 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          captscope["string_literal"] = captob

          pos = $P1
          local_branch cstack, R321
          delete captscope["string_literal"]

          goto fail
        R321: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "\"" goto fail
          pos += 1
          goto R313

        R313: # cut 308
          local_branch cstack, R310
          cutmark = 308
          goto fail

        R310: # action
          $P1 = adverbs['action']
          if null $P1 goto succeed
          $I1 = can $P1, "quote"
          if $I1 == 0 goto succeed
          mpos = pos
          $P1."quote"(mob)
          goto succeed
      .end

## <mekso::Grammar::term>
.namespace ["mekso";"Grammar"]
      .sub "term" :method 
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc mob
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = get_hll_global ['PGE'], '$!MATCH'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(self, adverbs :flat :named)
          .local int lastpos
          lastpos = length target
          if cpos > lastpos goto fail_rule
          .local pmc cstack :unique_reg
          cstack = new 'ResizableIntegerArray'
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, rep, cutmark :unique_reg
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          local_branch cstack, R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          local_return cstack
        fail_match:
          cutmark = -3
          goto fail_cut
        R: # concat
        R322: # subrule value
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'value'
          if $I0 == 0 goto R322_1
          $P0 = find_method mob, 'value'
          goto R322_2
        R322_1:
          $P0 = find_name 'value'
          unless null $P0 goto R322_2
          say "Unable to find regex 'value'"
        R322_2:
          $P2 = adverbs['action']
          captob = $P0(captob, 'dba'=>"", 'action'=>$P2)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          captscope["value"] = captob

          pos = $P1
          local_branch cstack, R323
          delete captscope["value"]

          goto fail
        R323: # action
          $P1 = adverbs['action']
          if null $P1 goto succeed
          $I1 = can $P1, "term"
          if $I1 == 0 goto succeed
          mpos = pos
          $P1."term"(mob, "value")
          goto succeed
      .end

## <mekso::Grammar::expression>
      .namespace ["mekso";"Grammar"]
      .sub "expression"
        .param pmc mob
        .param pmc adverbs :named :slurpy
        $P0 = get_hll_global ["mekso";"Grammar"], "$optable"
        .tailcall $P0.'parse'(mob, 'rulename'=>"expression", adverbs :named :flat)
      .end
