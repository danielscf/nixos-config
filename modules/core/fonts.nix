{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    
    packages = with pkgs; [ 
      nerd-fonts.jetbrains-mono
      
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ 
          "JetBrainsMono NF"
          "Noto Serif"
          "Noto Serif CJK"
          "Noto Color Emoji" 
          "Noto Emoji" 
        ];

        sansSerif = [ 
          "JetBrainsMono NF"
          "Noto Sans"
          "Noto Sans CJK"
          "Noto Color Emoji" 
          "Noto Emoji" 
        ];

        monospace = [ 
          "JetBrainsMono NF"
          "Noto Mono"
          "Noto Color Emoji"
          "Noto Emoji"
        ];
      };
    };
  };
}