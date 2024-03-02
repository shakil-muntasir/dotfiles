# Dotfiles Repository Setup

This repository contains my personal dotfiles, including configuration files for various command-line tools and applications. With these dotfiles, you can quickly set up your environment on a new machine or synchronize your configurations across multiple systems.

## Usage

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

#### Linux Branch

- If you're on Linux, switch to the Linux branch:
  ```bash
  git checkout linux
  ```

#### Windows Branch

- If you're on Windows, switch to the Windows branch:
  ```bash
  git checkout windows
  ```

### Setting Up Dotfiles

3. Run the setup script to install Oh My ZSH and symlink dotfiles to your home directory:
   ```bash
   bash init.sh
   ```

   This script will symlink dotfiles from `~/.dotfiles` to your home directory (`~/`). If a file with the same name exists in your home directory, it will be renamed with a timestamp and `.backup` extension.


### Installing Oh My ZSH

If you only want to install Oh My ZSH and it's plugins:
```bash
bash scripts/omz.sh
```

This will remove the symlinks and restore any backed-up files.

### Unlinking Dotfiles

If you want to unlink the dotfiles and remove the symlinks, you can use the `--unlink` option with the setup script:
```bash
bash scripts/symlinks.sh --unlink
```

This will remove the symlinks and restore any backed-up files.

## Additional Notes

- **Customization**: Feel free to modify any dotfiles to suit your preferences. You can add new dotfiles or remove existing ones from the repository.
- **Version Control**: The dotfiles are version-controlled using Git. You can commit your changes and push them to a remote repository for backup or synchronization across multiple machines.
- **Feedback**: If you have any feedback or suggestions for improvement, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
