#!/bin/bash

# check if the current host is mac or linux
OS_TYPE=$(uname);

# sets the RTC time to 1 to avoid inaccurate time when dual booting
set_rtc_time() {
    if [[ "$OS_TYPE" == "Linux" ]]; then
        # Print message before running the command
        echo "Setting local RTC to 1..."

        # Run the command with sudo and store the exit code in a variable
        sudo timedatectl set-local-rtc 1
        exit_code=$?

        # Check the exit code to determine if the command ran successfully
        if [ $exit_code -eq 0 ]; then
            echo "Local RTC set to 1 successfully."
        else
            echo "Error: Failed to set local RTC to 1. Exit code: $exit_code"
        fi
    fi
}

# copy over the correct dotfiles depending on the operating system we're running
set_correct_dotfiles() {
    if [[ "$OS_TYPE" == "Darwin" ]]; then
        cp zsh/zshrc.mac zsh/.zshrc
    fi
}


#######
# run the command to install zshrc
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# linux specific operations
set_rtc_time
set_correct_dotfiles