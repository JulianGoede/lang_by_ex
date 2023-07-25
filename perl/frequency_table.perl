#!/usr/bin/env perl
use strict;
use warnings;

sub generate_dummy_hash_table {
    my %table;
    $table{a} = "table entry for a";
    $table{b} = "table entry for b";
    $table{c} = "table entry for c";
    return %table;
}

sub display_hash_table {
    my %hash_table = @_;
    foreach my $key (keys %hash_table) {
        print "$key => $hash_table{$key}\n";
    }
}


sub access_hash_table_example {
    my %t;
    %t = generate_dummy_hash_table;
    print "Iterate over all keys and values of hash_table:\n";
    display_hash_table %t;
    print "Access a single item with key `b` in hash_table:\n";
    print "$t{b}\n";
}


sub histogram_over_words {
    my @words = @_;
    my %hist;
    for my $word (@words){
        if ($hist{$word}){
            $hist{$word} = $hist{$word}+1;
        } else {
            $hist{$word} = 1;
        }
    }
    return %hist;
}


sub histogram_over_file {
    my $file_path = $_[0];
    my $file_handle;
    open $file_handle, $file_path;
    my @words = ();
    while (my $line = <$file_handle>){
        push(@words, split("\\s", $line));
    }
    return histogram_over_words @words;
}


sub histogram_over_files {
    my @args = @_;
    my %freqs;
    while (@args){
        # print @args;
        my $file_path = shift @args;
        print "$file_path\n";
        my $file_handle;
        open $file_handle, $file_path;
        while (my $line = <$file_handle>) {
            my @words = split("\\s", $line);
            for my $word (@words){
                if ($freqs{$word}){
                    $freqs{$word} = $freqs{$word}+1;
                } else {
                    $freqs{$word} = 1;
                }
            }
        }
    }
    return %freqs;
}

sub main {
    # access_hash_table_example;
    my %freqs = histogram_over_files "/usr/share/dict/words", "/usr/share/dict/ngerman";
    display_hash_table %freqs;
}

main
