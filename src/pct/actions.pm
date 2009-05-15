# $Id$

=begin comments

mekso::Grammar::Actions - ast transformations for mekso

This file contains the methods that are used by the parse grammar
to build the PAST representation of an mekso program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class mekso::Grammar::Actions;

method TOP($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node( $/ ), :hll('mekso') );
    for $<statement> {
        $past.push( $_.ast );
    }
    make $past;
}


method statement($/) {
    my $past := PAST::Op.new( :name('suhi'), :pasttype('call'), :node( $/ ) );
    for $<expression> {
        $past.push( $_.ast );
    }
    make $past;
}

##  expression:
##    This is one of the more complex transformations, because
##    our grammar is using the operator precedence parser here.
##    As each node in the expression tree is reduced by the
##    parser, it invokes this method with the operator node as
##    the match object and a $key of 'reduce'.  We then build
##    a PAST::Op node using the information provided by the
##    operator node.  (Any traits for the node are held in $<top>.)
##    Finally, when the entire expression is parsed, this method
##    is invoked with the expression in $<expr> and a $key of 'end'.
method expression($/, $key) {
    if ($key eq 'end') {
        make $<expr>.ast;
    }
    else {
        my $past := PAST::Op.new( :name($<type>),
                                  :pasttype($<top><pasttype>),
                                  :pirop($<top><pirop>),
                                  :lvalue($<top><lvalue>),
                                  :node($/)
                                );
        for @($/) {
            $past.push( $_.ast );
        }
        make $past;
    }
}


##  term:
##    Like 'statement' above, the $key has been set to let us know
##    which term subrule was matched.
method term($/, $key) {
    make $/{$key}.ast;
}


method value($/, $key) {
    make $/{$key}.ast;
}


method integer($/) {
    my %PA;
    %PA<no> := 0;
    %PA<pa> := 1;
    %PA<re> := 2;
    %PA<ci> := 3;
    %PA<vo> := 4;
    %PA<mu> := 5;
    %PA<xa> := 6;
    %PA<ze> := 7;
    %PA<bi> := 8;
    %PA<so> := 9;
    my $num := 0;
    for $<PA> {
        $num := $num * 10;
        $num := $num + %PA{~$_};
    }
    make PAST::Val.new( :value( $num ), :returns('Integer'), :node($/) );
}


method quote($/) {
    make PAST::Val.new( :value( $<string_literal>.ast ), :node($/) );
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

