{ pkgs, ... }:

{
  home.file = {
    ".local/bin/nix-update" = {
      executable = true;

      text = ''

        set -e

        read -p "Do you want to start upgrading your system right now? (y/N) " -n 1 -r REPLY

        case "$REPLY" in
            [yY])
                ;;
            *)
                echo "Update aborted."
                exit 0
                ;;
        esac

        FLAKE_DIR=/home/hiskingisdone/.dotfiles

        echo
        echo "<------------STARTING THE UPGRADE PROCESS------------>"
        echo

        echo "> Switching to '$FLAKE_DIR'..."
        cd "$FLAKE_DIR"

        if ! git diff --quiet; then
            echo "Unstaged Changes. Please commit or stash them first." >&2
            exit 1
        fi

        echo "> Updating flake inputs..."
        nix flake update

        if git diff --quiet flake.lock; then
            echo " 󰄲 No updates found. Your system is already up to date."
            exit 0
        fi

        #echo "> The Following inputs have been updated:"
        #git diff --stat flake.lock

        echo
        read -p "Do you want to proceed with the system rebuild? (y/N) " -n 1 -r REPLY
        echo

        case "$REPLY" in
            [yY])
                echo "> Proceeding with the rebuild..."
                ;;
            *)
                echo "Abort Requested. The flake.lock file has been updated but the system has not been rebuilt."
                echo "You can revert the pending changes with: git restore flake.lock"
                exit 1
                ;;
        esac

        echo "> Rebuilding the system..."
        sudo nixos-rebuild switch --flake . && home-manager switch --flake .

        current_generation=$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | grep "(current)" | awk '{print $1}')

        echo "> Committing flake.lock"
        git add flake.lock
        git commit -m "chore: update flake inputs (generation $current_generation)"

        echo " 󰄲 System upgrade complete and committed!"

        echo
        echo "Moving back to previous directory!"
        echo

        cd -
      '';
    };
  };
}
