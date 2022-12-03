#!/usr/bin/perl
# How to run:
# $perl 3.pl
use strict;
use warnings;
use feature "say";

sub read_input {
    my $filename = $_[0];
    my @input_arr;
    open( my $infile, "<", "$filename" )
      or die "Cannot open file: No such file or directory\n";
    while ( my $line = <$infile> ) {
        chomp($line);
        push( @input_arr, $line );
    }
    close $infile;
    return @input_arr;
}

sub create_set_from_str {
    my $str = $_[0];
    my @arr;
    foreach my $char ( split( '', $str ) ) {
        push( @arr, $char );
    }
    my %seen = ();
    my @unique;
    foreach my $item (@arr) {
        push( @unique, $item ) unless $seen{$item}++;
    }
    return @unique;
}

sub get_value {
    my $char = $_[0];
    if ( $char =~ /[a-z]/ ) {
        return ord($char) - ord("`");
    }
    else {
        return ord($char) - ord("&");
    }

}

sub intersect {
    my @a_set = @{ $_[0] };
    my @b_set = @{ $_[1] };
    my @isect;
    foreach my $item (@a_set) {
        push @isect, $item if grep { $item eq $_ } @b_set;
    }
    return @isect;
}

sub question_1 {
    my @input_arr = @{ $_[0] };
    my $total     = 0;
    foreach my $line (@input_arr) {
        my $half  = length($line) / 2;
        my @a_set = create_set_from_str( substr( $line, 0,     $half ) );
        my @b_set = create_set_from_str( substr( $line, $half, $half ) );
        my @isect = intersect( \@a_set, \@b_set );
        $total += get_value( $isect[0] );
    }
    say $total;
}

sub question_2 {
    my @input_arr = @{ $_[0] };
    my $total     = 0;
    for ( my $i = 0 ; $i <= $#input_arr ; $i += 3 ) {
        my @a_set         = create_set_from_str( $input_arr[$i] );
        my @b_set         = create_set_from_str( $input_arr[ $i + 1 ] );
        my @c_set         = create_set_from_str( $input_arr[ $i + 2 ] );
        my @initial_isect = intersect( \@a_set,         \@b_set );
        my @isect         = intersect( \@initial_isect, \@c_set );
        $total += get_value( $isect[0] );
    }
    say $total;
}

my @input_arr = read_input("input");
question_1( \@input_arr );
question_2( \@input_arr );
