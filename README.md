# Dotfiles Repository Setup

This repository contains my personal dotfiles, including configuration files for various command-line tools and applications. While this setup is tailored to my personal liking, it can be used by anyone to quickly set up their environment on a new machine or synchronize configurations across multiple systems.

## Included/Installed Items
- Zsh and Oh My Zsh
- Git configuration with personalized settings
- Zsh plugins (zsh-autosuggestions, zsh-syntax-highlighting, zsh-nvm)
- Zsh theme (powerlevel10k)
- Symlinks for dotfiles

### Cloning the Repository

1. Clone the repository to your home directory:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   ```

2. Navigate to the `~/.dotfiles` directory:
   ```bash
   cd ~/.dotfiles
   ```

### Selecting Branch for Your Operating System

- This repository has different branches for different operating systems such as macOS, Windows, and Linux.

#### macOS Branch

- If you're on macOS, switch to the macOS branch:
  ```bash
  git checkout macos
  ```

#### Windows Branch

- If you're on WSL, switch to the WSL branch:
  ```bash
  git checkout wsl
  ```

#### Linux Branch
- If you're on Linux, switch to the Linux branch:
  ```bash
  git checkout linux
  ```

### Setting Up
3. Run the init script to install all the necessary tools and symlink dotfiles to your home directory:
   ```bash
   bash init.sh
   ```
> [!NOTE]
> `init.sh` script will symlink dotfiles from `~/.dotfiles` to your home directory (`~/`). If a file with the same name exists in your home directory, it will be renamed with a timestamp and `.backup` extension.

### Installing Oh My ZSH
- If you already have `ZSH` and `Git` installed and only want to install Oh My ZSH and it's plugins:
  ```bash
  bash scripts/omz.sh
  ```

### Install necessary fonts
Download & install [JetBrainsMonoNerdFonts](https://github.com/shakil-muntasir/dotfiles/releases/download/v1.0/JetBrainsMonoNerdFonts.zip) for you Windows Terminal/macOS iterm2.

> [!NOTE]  
> Setup via init.sh/omz.sh will backup the existing dot files & symlink the ones from this project.

### Unlinking Dotfiles
If you want to unlink the dotfiles and remove the symlinks, you can use the `--unlink` option with the setup script:
```bash
bash scripts/symlinks.sh --unlink
```

> [!WARNING]  
> This will remove the symlinks and restore any backed-up files.

## Additional Notes

- **Customization**: Feel free to modify any dotfiles to suit your preferences. You can add new dotfiles or remove existing ones from the repository.
- **Version Control**: The dotfiles are version-controlled using Git. You can commit your changes and push them to a remote repository for backup or synchronization across multiple machines.
- **Feedback**: If you have any feedback or suggestions for improvement, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
