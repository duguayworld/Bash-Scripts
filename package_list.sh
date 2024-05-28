#!/bin/bash

# Output all currently installed extra packages by the user
echo "Outputting currently installed extra packages..."
installed_packages=$(pacman -Qqen)

# Generate script to install the packages
install_script="install_extra_packages.sh"
echo "#!/bin/bash" > "$install_script"
echo "" >> "$install_script"
echo "# Script to install currently installed extra packages" >> "$install_script"
echo "" >> "$install_script"
echo "# List of packages to install:" >> "$install_script"
for package in $installed_packages; do
    echo "Installing package: $package"
    echo "sudo pacman -S --noconfirm $package" >> "$install_script"
done

echo "Script to install currently installed extra packages generated as $install_script."
