=head1 TITLE

mekso.pir - A mekso compiler.

=head2 Description

This is the base file for the mekso compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'mekso'.

=head2 Functions

=over 4

=item onload()

Creates the mekso compiler using a C<PCT::HLLCompiler>
object.

=cut

.HLL 'mekso'

.namespace [ 'mekso';'Compiler' ]

.loadlib 'mekso_group'

.sub '' :anon :load :init
    load_bytecode 'PCT.pbc'
    .local pmc parrotns, hllns, exports, p6meta
    parrotns = get_root_namespace ['parrot']
    hllns = get_hll_namespace
    exports = split ' ', 'PAST PCT PGE'
    parrotns.'export_to'(hllns, exports)
    $P0 = get_root_global ['parrot'], 'P6metaclass'
    $P0.'new_class'('dacti')
    p6meta = $P0.'HOW'()
.end

.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'

.sub 'onload' :anon :load :init
    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('mekso')
    $P0 = get_hll_namespace ['mekso';'Grammar']
    $P1.'parsegrammar'($P0)
    $P0 = get_hll_namespace ['mekso';'Grammar';'Actions']
    $P1.'parseactions'($P0)
.end

=item main(args :slurpy)  :main

Start compilation by passing any command line C<args>
to the mekso compiler.

=cut

.sub 'main' :main
    .param pmc args

    $P0 = compreg 'mekso'
    $P1 = $P0.'command_line'(args)
.end

.include 'src/gen_builtins.pir'

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

