#!/usr/bin/env perl
use strict;
use warnings;


sub matches_pattern {
    my $s = shift @_;
    my $pattern = shift @_;
    # on my perl 5.34+ i do not need to wrap pattern inside `m/<pattern>/` block
    if ($s =~ $pattern) {
        print "MATCH: [$s =~ $pattern]\n";
        return;
    }
    print "NO MATCH: [$s !~ $pattern]\n";
}

sub simple_regex_example {
    matches_pattern "foo", ".*";
    matches_pattern "foo", "foo";
    matches_pattern "foo", "[fb]oo";
    matches_pattern "foo", "[bc]oo";
}


sub grep_file {
    my $pattern = shift @_;
    my $file = shift @_;
    my $file_handle;
    open $file_handle, $file;
    while (my $line = <$file_handle>){
        if ($line =~ $pattern){
            print "$line";
        }
    }
}

sub grep_files {
    my $pattern = shift @_;
    while (my $file = shift @_){
        grep_file $pattern, $file;
    }
}


sub url_to_domain_name {
    my $url = shift @_;
    my $pattern = "(https*|ftp)(://)(.*)";

    my @captures = $url =~ $pattern;
    if (@captures){
        # catpures are automatically stored into $1, $2, .., $#n_catpures
        my $protocol = "$1";
        my $url_path = "$3";

        ## since we stored the captures in an array we can also access them by index
        # print "$captures[0] ;; $captures[1] ;; $captures[2]\n";

        my $path = (split("/", $url_path))[0];
        # print "$path\n";
        my $sub_pattern = "([a-zA-Z]+)(\.)?(.*)";
        my @sub_captures = $path =~ $sub_pattern;
        my @domain_parts = ();
        while (@sub_captures){
            push @domain_parts, $sub_captures[0];
            @sub_captures = $sub_captures[2] =~ $sub_pattern;
        }
        return join(".", reverse(@domain_parts));
    }
}


sub domain_name_parser_example {
    # my $url = "https://www.google.com/";
    my $url = "https://perldoc.perl.org/functions/join";
    my $domain_name = url_to_domain_name $url;
    print "$domain_name";
}

sub main {
    # simple_regex_example;
    grep_files "^mys*", "/usr/share/dict/words", "/usr/share/dict/british-english";
    print "DOMAIN NAME EXAMPLE:\n";
    domain_name_parser_example;
}

main
