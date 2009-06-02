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

sub instantiate_class($class_name, $node) {
    my $class := PAST::Var.new(:name($class_name), :scope('package'));
    return PAST::Op.new(:pasttype('callmethod'), :name('new'), :node($node), $class);
}

method TOP($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node( $/ ), :hll('mekso') );
    for $<bridi> {
        $past.push( $_.ast );
    }
    make $past;
}


method mekso($/, $key) {
    my $past := PAST::Op.new( :name(~$<oper>), :pasttype('call'), :node( $/ ) );
    if ($key eq "unary") { 
        $past.push( $<namcu>.ast );
    } else {
        for $<namcu> {
            $past.push( $_.ast );
        }
    }

    make $past;
}

method bridi($/, $key) {
    my $bridi := instantiate_class(~$<selbri>, $/);

    if ($key eq 'observative') {
        $bridi.push(PAST::Op.new( :name("zo'e"), :pasttype('call') ));
    }

    for $<sumti> {
        $bridi.push($_.ast);
    }
    
    if $<meiclause> {
        $bridi.push($<meiclause>[0].ast);
    }

    if $<maiclause> {
        $bridi.push($<maiclause>[0].ast);
    }

    make $bridi;
}

method maiclause($/) {
    $<nahusni>.ast.named('mai');
    make $<nahusni>.ast;
}

method meiclause($/) {
    $<nahusni>.ast.named('mei');
    make $<nahusni>.ast;
}

method sumti($/, $key) {
    make $/{$key}.ast;
}

method namcu($/,$key) {
    make $/{$key}.ast;
} 

method nahusni($/) {
    my %nahuvla;
    %nahuvla<no> := 0;
    %nahuvla<pa> := 1;
    %nahuvla<re> := 2;
    %nahuvla<ci> := 3;
    %nahuvla<vo> := 4;
    %nahuvla<mu> := 5;
    %nahuvla<xa> := 6;
    %nahuvla<ze> := 7;
    %nahuvla<bi> := 8;
    %nahuvla<so> := 9;
    %nahuvla<dau> := 10;
    %nahuvla<fei> := 11;
    %nahuvla<gai> := 12;
    %nahuvla<jau> := 13;
    %nahuvla<rei> := 14;
    %nahuvla<vai> := 15;
    my $num := 0;
    my $base := 10;
    if $<base> {
        $base := $<base>[0].ast.value();
    }
    for $<predigits> {
        $num := $num * $base;
        $num := $num + %nahuvla{~$_};
    }
    my $place := $base;
    for $<postdigits> {
        $num := $num + (%nahuvla{~$_} / $place);
        $place := $place * $base;
    }
    if ~$<prefixsign>[0] eq "ni'u" {
        $num := -$num;
    }
    make PAST::Val.new( :value( $num ), :returns('Float'), :node($/) );
}

# Local Variables:
#   mode: perl6
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

