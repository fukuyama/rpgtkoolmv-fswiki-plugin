
package plugin::tkoolmv::Install;
use strict;
sub install {
  my $wiki = shift;
  $wiki->add_paragraph_plugin("tkoolmvmap","plugin::tkoolmv::Map","HTML");
}
1;
