#!/bin/bash

# Output all installed drivers recognized by lspci
echo "Outputting installed drivers..."
installed_drivers=$(sudo lspci -k | awk '/Kernel driver in use:/ {print $NF}' | sort -u)

# If no drivers found, exit with error
if [ -z "$installed_drivers" ]; then
    echo "No installed drivers found."
    exit 1
fi

# Generate script to install drivers
install_script="install_drivers.sh"
echo "#!/bin/bash" > "$install_script"
echo "" >> "$install_script"
echo "# Script to install currently installed drivers" >> "$install_script"
echo "" >> "$install_script"
echo "# List of drivers to install:" >> "$install_script"
for driver in $installed_drivers; do
    echo "Installed driver: $driver"
    echo "sudo pacman -S --noconfirm $driver" >> "$install_script"
done

echo "Script to install currently installed drivers generated as $install_script."
