sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel git

if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    cd ../
fi


terminal=(
    "kitty"                       # Terminal emulator
    "zsh"                         # Shell
    "oh-my-zsh-git"               # Terminal prompt
    "tmux"                        # Terminal multiplexer
)

cli_tools=(
    "neovim"                      # Text editor
    "fzf"                         # Fuzzy Finder
    "zip"                         # Compression utility
    "inetutils"                   # Common network programs
    "ripgrep"                     # Search tool
    "fd"                          # Replacement for find
    "bat"                         # cat with syntax highlighting
    "eza"                         # ls replacement
    "zoxide"                      # Better cd
    "yazi"                        # File manager
    "tokei"                       # Count lines of a project
    "mprocs-bin"                  # Run multiple processes
    "wget"                        # Retrieve files from a network
    "curl"                        # Transfer data with urls
    "htop"                        # Resource monitor
)

prog_langs=(
    "gcc"                         # [C/C++] C compiler
    "go"                          # [Go] golang
    "deno"                        # [JavaScript] JavaScript runtime
    "npm"                         # [JavaScript] Node package manager
    "typescript"                  # [TypeScript] JavaScript with syntax for types
    "typescript-language-server"  # [TypeScript] TypeScript Language Server Protocol
    "eslint_d"                    # [JS/TS] JavaScript / TypeScript linter
    "eslint"                      # [JS/TS] JavaScript / TypeScript linter
    "luacheck"                    # [Lua] Lua linter
    "lua"                         # [Lua] Lua
    "jdk-openjdk"                 # [Java] Java development kit
    "checkstyle"                  # [Java] Java linter
    "google-java-format"          # [Java] Java formatter
    "stylelint"                   # [CSS] CSS linter
    "markdownlint"                # [MD] Markdown linter
    "Pyright"                     # [Python] Python Language Server Protocol
    "tk"                          # [Python] Tkinter
    "python-isort"                # [Python] Utility to sort imports
    "python-poetry"               # [Python] Dependency Management
    "bash-language-server"        # [Bash] Bash Language Server Protocol
    "prettier"                    # [General] Code formatter
)

gui_apps=(
    "bitwarden"                   # Password manager
    "pavucontrol"                 # Audio control
    "brave-bin"                   # Browser
    "libreoffice"                 # Office tools
    "mission-center"              # Resource monitor
    "gimp"                        # Image manipulation program
    "obs-studio"                  # Screen recording
    "rofi-wayland"                # Application launcher
)

other=(
    "hyprland"                    # Tiling window manager
    "hyprshot"                    # Screenshot util for hyprland
    "waybar"                      # Hyprland status bar
    "swaybg"                      # Wallpaper for hyprland
    "hyprlock"                    # Lockscreen
    "wl-clipboard"                # Clipboard for wayland
    "xdg-desktop-portal-hyprland" # Screen-sharing for hyprland
    "xdg-desktop-portal"          # Screen-sharing for hyprland
    "papirus-icon-theme"          # Icon theme
)

packages=(
    "${terminal[@]}"
    "${cli_tools[@]}"
    "${prog_langs[@]}"
    "${gui_apps[@]}"
    "${other[@]}"
)

for pkg in "${packages[@]}"; do
  yay -S --noconfirm --needed "$pkg"
done

# Installs zplug
if command -v zplug &> /dev/null; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi 

# change shell to zsh
if [ "$(which $SHELL)" != "/usr/bin/zsh" ]; then
    chsh -s $(which zsh)
fi

# move dotfiles
mkdir -p ~/.config

rm -rf ~/.config/eza
rm -rf ~/.config/hypr
rm -rf ~/.config/kitty
rm -rf ~/.config/yazi
rm -rf ~/.config/rofi
rm -rf ~/.fonts
rm -rf ~/.themes

cp -r ./home/config/eza ~/.config/eza
cp -r ./home/config/hypr ~/.config/hypr
cp -r ./home/config/kitty ~/.config/kitty
cp -r ./home/config/yazi ~/.config/yazi
cp -r ./home/config/rofi ~/.config/rofi
cp -r ./home/fonts ~/.fonts
cp -r ./home/themes ~/.themes
cp ./home/icon.png ~/.icon.png
cp ./home/wallpaper.png ~/.wallpaper.png
cp ./home/pylintrc ~/.pylintrc
cp ./home/stylelintrc.js ~/.stylelintrc.js
cp ./home/tmux.conf ~/.tmux.conf
cp ./home/zshrc ~/.zshrc

# yazi plugins (file manager)
ya pack -a BennyOe/tokyo-night
ya pack -a yazi-rs/plugins:no-status

# install nvim config
git clone https://github.com/Aleks-Tacconi/nvim-config.git ~/.config/nvim

# nvidia install:
# https://www.youtube.com/watch?v=_deaeSU1WK8

# arch on mac:
# https://mattgibson.ca/installing-arch-linux-on-an-intel-macbook-pro-with-t2-security-chip/
# https://medium.com/@philpl/arch-linux-running-on-my-macbook-2ea525ebefe3
# https://github.com/t2linux/archiso-t2
# https://github.com/GnomedDev/T2FanRD#configuration
