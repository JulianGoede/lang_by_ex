#!/usr/bin/env perl

# do not run on invalid syntax
use strict;
use warnings;

sub print_single_file {
    my $fp = $_[0];
    # open $fp and store into filehandle $fh
    my $fh;
    open $fh, $fp;
    # read lines
    while (my $line = <$fh>) {
        print "$line";
    }
}

sub cat_files {
    foreach (@_){
        print_single_file $_;
    }
}

sub ls {
    my $dir_path = shift @_;
    my $globbing_pattern = "$dir_path/*";
    my @files = glob $globbing_pattern;
    return @files
}


sub cat {
    foreach(@_){
        my $path = $_;
        if (-d $path) {
            my @files = ls $path;
            cat(@files);
        } else {
            print_single_file $path;
        }
    }
}

sub main {
    my $dict_dir = "/usr/share/dict";
    my $fp1 = "$dict_dir/words";
    my $fp2 = "$dict_dir/ngerman";
    # cat_files $fp1, $fp2;
    # ls "/usr/share/dict";
    cat $dict_dir;
}

main
