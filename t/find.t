use strict;
use warnings;
use lib qw(lib);
use Test::More tests => 16;

use_ok('URI::Find::Simple');

eval { URI::Find::Simple::list_uris() };
ok($@ =~ /expected a text string/, "can't call list_uris without text");

eval { URI::Find::Simple::change_uris() };
ok($@ =~ /expected a text string/, "can't call change_uris without text");

eval { URI::Find::Simple::change_uris('bob') };
ok($@ =~ /expected a code ref/, "can't call change_uris without subref");


ok(my $text = <<EOF, "set text string");
this is a long string with http://www.news.com urls in it in
http://various.com different forms. mailto:tom\@jerakeen.org.
Some urls are ftp://not.http.urls/and/have/paths.
EOF

ok(my @list = URI::Find::Simple::list_uris($text), "got list of uris");

is(scalar(@list), 4, "got 4 uris");
is($list[0], 'http://www.news.com/', "got news.com uri");
is($list[1], 'http://various.com/', "got various.com uri");
is($list[2], 'mailto:tom@jerakeen.org', "got email address");
is($list[3], 'ftp://not.http.urls/and/have/paths', "got ftp uri");

ok(my $new_text = URI::Find::Simple::change_uris($text, sub {
  my $text = shift;
  return "[[ $text ]]";
}), "changed text");

ok(my $expected = <<EOF, "set expected text string");
this is a long string with [[ http://www.news.com/ ]] urls in it in
[[ http://various.com/ ]] different forms. [[ mailto:tom\@jerakeen.org ]].
Some urls are [[ ftp://not.http.urls/and/have/paths ]].
EOF

is($new_text, $expected, "expcted matches new text");

my $unicode = "This is a unicode string with a http://weird.com/url/\x{e9}withunicode ok";
@list = URI::Find::Simple::list_uris($unicode);

is(scalar(@list), 1, "got 1 uri");
is($list[0], 'http://weird.com/url/%C3%A9withunicode', "got news.com uri");
