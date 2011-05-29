#!/usr/bin/env perl
use strict;
use warnings;
use lib::xi;

use autodie ':all';

use Daiku;

my @belike = qw(
    Module::Install
    Module::Install::XSUtil
    Module::Install::Repository
    Module::Install::AuthorTests
    Module::Install::AuthorRequires

    Plack

    Daiku

    lib::xi
);

task install_belike => sub {
    system 'cpanm', @belike;
};

task install => sub {
    system './setup.sh';
};

print "done.\n";

