{ pkgs, ... }:

{
  home.username = "ramon";
  home.homeDirectory = "/home/ramon";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "fzf"
      ];
      theme = "";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_status$nix_shell$cmd_duration$time$line_break$character";

      directory = {
        truncation_length = 3;
        truncate_to_repo = false;
        style = "bold cyan";
      };

      git_branch = {
        format = " on [$symbol$branch]($style)";
        symbol = " ";
        style = "bold purple";
      };

      git_status = {
        format = " [$all_status$ahead_behind]($style)";
        style = "bold red";
      };

      nix_shell = {
        format = " via [$symbol$state]($style)";
        symbol = "❄ ";
        style = "bold blue";
      };

      cmd_duration = {
        min_time = 1000;
        format = " took [$duration]($style)";
        style = "yellow";
      };

      time = {
        disabled = false;
        format = " at [$time]($style)";
        time_format = "%H:%M";
        style = "bold dimmed white";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "ramon";
        email = "ramon15749@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f --hidden --follow --exclude .git";
    defaultOptions = [
      "--height=40%"
      "--layout=reverse"
      "--border"
    ];
  };

  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file.".cache/oh-my-zsh/completions/.keep".text = "";
  home.file.".cache/starship/.keep".text = "";

  home.packages = with pkgs; [
    fd
    helix
    git
    gh
    ripgrep
    vim
  ];
}
