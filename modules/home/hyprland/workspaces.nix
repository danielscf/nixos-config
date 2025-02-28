{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    # TODO: Use pkgs to call programs
    workspace = [
      # Open app if empty
      "1,monitor:$primary_monitor,default:true"
      "2,monitor:$primary_monitor,default:true,on-created-empty:[dwindle] $browser"
      #"3,monitor:$secondary_monitor,default:true,on-created-empty:[dwindle] /home/daniel/scripts/script-aliases/obsidian-default-vault"
      #"4,monitor:$primary_monitor,default:true,on-created-empty:[dwindle] Docker Desktop"
      "5,monitor:$secondary_monitor,default:true,on-created-empty:[dwindle] youtube-launcher"
      #"5,monitor:$secondary_monitor,default:true,on-created-empty:[dwindle] /home/daniel/scripts/script-aliases/foobar2000"
      "6,monitor:$secondary_monitor,default:true,on-created-empty:[dwindle] pavucontrol"
      "7,monitor:$secondary_monitor,default:true,on-created-empty:[dwindle] $file_manager"
      "8,monitor:$primary_monitor,default:true,on-created-empty:[dwindle] discord"
      "8,monitor:$primary_monitor,default:true,on-created-empty:[dwindle] whatsie"
      "10,monitor:$primary_monitor,default:true"

      # Secondary monitor gaps
      "3,monitor:$secondary_monitor,rounding:false,gapsin:0,gapsout:0"
      "5,monitor:$secondary_monitor,rounding:false,gapsin:0,gapsout:0"
      "6,monitor:$secondary_monitor,rounding:false,gapsin:0,gapsout:0"
      "7,monitor:$secondary_monitor,rounding:false,gapsin:0,gapsout:0"
    ];
  };
}
