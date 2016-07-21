# {{tkoolmvmap filename}}

package plugin::tkoolmv::Map;
use strict;

sub new {
  my $class = shift;
  my $self = {};
  return bless $self,$class;
}

my $flag = 0;

sub paragraph {
  my $self = shift;
  my $wiki = shift;
  my $file = shift;

  if($file eq "") {
    return &Util::inline_error("ファイルが指定されていません。");
  }

  my $page = $wiki->get_CGI()->param("page");
  my $filename = $wiki->config('attach_dir')."/".&Util::url_encode($page).".".&Util::url_encode($file);
  unless(-e $filename) {
    return &Util::inline_error("ファイルがありません。" . $file);
  }

  if($flag == 1) {
    return &Util::inline_error("表示できるのは、１ページに１つです。");
  }
  $flag = 1;

  my $ret  = &_script_tags();

  my $json_url_system   = &_create_tkool_data_url($wiki, 'System', 'System.json');
  my $json_url_tilesets = &_create_tkool_data_url($wiki, 'Tilesets', 'Tilesets.json');
  my $json_url_map      = &_create_tkool_data_url($wiki, $page, $file);
  $ret .= <<"HTML";
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
<div id="GameEvents">
</div>
HTML
  return $ret;
}

sub _create_tkool_data_url {
  my $wiki = shift;
  my $page = shift;
  my $file = shift;
  # DataManager.loadDataFile が、"data/" のパス配下固定なので、とりあえず "../"
  return "../".$wiki->create_url({ action=>"ATTACH", page=>$page, file=>$file });
}

sub _script_tags {
  return <<"HTML";
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
HTML
}

1;
