# {{tkoolmvmap filename}}

package plugin::tkoolmv::Map;
use strict;

sub new {
  my $class = shift;
  my $self = {};
  return bless $self,$class;
}

sub paragraph {
  my $self = shift;
  my $wiki = shift;
  my $file = shift;

  if($file eq "") {
    return &Util::inline_error("ファイルが指定されていません。");
  }

  my $ret  = "";

  $ret .= &script_tags();
  #$wiki->add_head_info("<script>alert('test');</script>");

  my $page = $wiki->get_CGI()->param("page");
  my $filename = $wiki->config('attach_dir')."/".&Util::url_encode($page).".".&Util::url_encode($file);
  if(-e $filename) {
    $ret .= $filename;
  }

  $ret .= "<h6>tkoolmv map plugin</h6>";

  my $json_url_system   = &_create_tkool_data_url($wiki, 'System', 'System.json');
  my $json_url_tilesets = &_create_tkool_data_url($wiki, 'Tilesets', 'Tilesets.json');
  my $json_url_map      = &_create_tkool_data_url($wiki, $page, $file);
  $ret .= <<"JS";
<script type="text/javascript">
window.onload = function () {
  WikiPlugin.tkoolMap([
    { name: '\$dataSystem',   src: '$json_url_system'   },
    { name: '\$dataTilesets', src: '$json_url_tilesets' },
    { name: '\$dataMap',      src: '$json_url_map'      }
  ]);
};
</script>
<canvas id="GameCanvas"></canvas>
JS
  return $ret;
}

sub _create_tkool_data_url {
  my $wiki = shift;
  my $page = shift;
  my $file = shift;
  # DataManager.loadDataFile が、"data/" のパス配下固定なので、とりあえず "../"
  return "../".$wiki->create_url({ action=>"ATTACH", page=>$page, file=>$file });
}

sub script_tags {
  return <<"TAGS";
        <script type="text/javascript" src="js/libs/pixi.js"></script>
        <script type="text/javascript" src="js/libs/fpsmeter.js"></script>
        <script type="text/javascript" src="js/libs/lz-string.js"></script>
        <script type="text/javascript" src="js/rpg_core.js"></script>
        <script type="text/javascript" src="js/rpg_managers.js"></script>
        <script type="text/javascript" src="js/rpg_objects.js"></script>
        <script type="text/javascript" src="js/rpg_scenes.js"></script>
        <script type="text/javascript" src="js/rpg_sprites.js"></script>
        <script type="text/javascript" src="js/rpg_windows.js"></script>
        <script type="text/javascript" src="js/plugins.js"></script>

        <script type="text/javascript" src="js/wiki_plugin.js"></script>
TAGS
}

1;
