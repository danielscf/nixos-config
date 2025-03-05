{
  pkgs,
  lib,
  ...
}:
{
  wayland.windowManager.hyprland.settings.workspace = [
    # Open app if empty
    "1,monitor:$primary_monitor,default:true"
    "2,monitor:$primary_monitor,default:true,on-created-empty:[dwindle] $browser"

    # TODO: Fix obsidian and remove `--disable-gpu` flag
    "3,monitor:$secondary_monitor,default:true,on-created-empty:[dwindle] ${lib.getExe pkgs.obsidian} --disable-gpu"

    #"4,monitor:$secondary_monitor,default:true,on-created-empty:[dwindle] /home/daniel/scripts/script-aliases/foobar2000"
    "5,monitor:$secondary_monitor,default:true,on-created-empty:[dwindle] ${lib.getExe pkgs.youtube-music}"
    "6,monitor:$secondary_monitor,default:true,on-created-empty:[dwindle] ${lib.getExe pkgs.pavucontrol}"
    "7,monitor:$secondary_monitor,default:true,on-created-empty:[dwindle] $file_manager"
    "8,monitor:$primary_monitor,default:true,on-created-empty:[dwindle] ${lib.getExe pkgs.discord}"
    "8,monitor:$primary_monitor,default:true,on-created-empty:[dwindle] ${lib.getExe pkgs.whatsie}"
    "10,monitor:$primary_monitor,default:true"

    # Secondary monitor gaps
    "3,monitor:$secondary_monitor,rounding:false,gapsin:0,gapsout:0"
    "5,monitor:$secondary_monitor,rounding:false,gapsin:0,gapsout:0"
    "6,monitor:$secondary_monitor,rounding:false,gapsin:0,gapsout:0"
    "7,monitor:$secondary_monitor,rounding:false,gapsin:0,gapsout:0"
  ];
}
