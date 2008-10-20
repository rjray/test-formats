#!/usr/bin/perl
# $Id: 10_sgmldtd.t 2 2008-10-20 09:56:47Z rjray $

# Exercise the SGML/XML DTD tests

use strict;
use warnings;
use vars qw($dir);

use File::Spec;
use XML::LibXML;
use Test::Builder::Tester tests => 1;

# Testing this:
use Test::Formats::XML;

# $dir gets used with File::Spec->catfile() to get O/S-agnostic paths to the
# files used by the tests.
$dir = (File::Spec->splitpath(File::Spec->rel2abs($0)))[1];

# Used and re-used
our($dtd, $xmlcontent);

# Start with some simple static-string content
$dtd = <<END_DTD_001;
<!ELEMENT data (#PCDATA)>
<!ELEMENT container (data+)>
END_DTD_001

test_out("ok 1 - string+string");
test_out("not ok 2 - string+string fail");
test_out("ok 3 - string+string nested content");
is_valid_against_sgmldtd($dtd, q{<?xml version="1.0"?>
<data>foo</data>
}, "string+string");
is_valid_against_sgmldtd($dtd, q{<?xml version="1.0"?>
<container></container>
}, "string+string fail");
is_valid_against_sgmldtd($dtd, q{<?xml version="1.0"?>
<container><data>foo</data></container>
}, "string+string nested content");
test_test(name => 'basic string+string arguments', skip_err => 1);

exit 0;
