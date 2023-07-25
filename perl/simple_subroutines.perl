#!/usr/bin/env perl

# do not run on invalid syntax
use strict;

sub echo { print "@_\n";}

sub echo_with_args {
    my @args = @_;
    print "@args\n";
}

sub args_example {
    echo "Hello World";
    echo_with_args "You", " ", "can ", "separate ", "args by using a comma ','";
}

sub slice_array {
    my ($i, $j, @arr) = @_;
    return @arr[$i..$j];
}


sub array_example {
    # scalar variables are accessed/initialized using $
    my $i = 1;
    my $j = 3;
    # array variables are accessed/initialized using @
    my @arr = (0, 2, 4, 6, 8, 10, 12);
    my @arr_slice = slice_array $i, $j, @arr;
    my $slice_len = $#arr_slice;

    echo_with_args "The sliced array is: @arr_slice and has len $slice_len\n";
}



sub shift_args_example {
    my $arg0 = shift @_;
    my $arg1 = shift @_;
    my $arg2 = shift @_;
    print "arg0 = $arg0, arg1 = $arg1, arg2 = $arg2\n"
}

sub main {
    # echo "Hello World";
    # args_example;
    # array_example;
    shift_args_example 8, 16 , 32;
}

main
