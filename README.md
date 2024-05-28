# Arch Utility Scripts
  This repository contains a collection of Bash utility scripts designed for Arch-based systems.

## Scripts:

1. **pac_cleaner.sh**

   >This script performs mirror ranking and mirrorlists update, systemupdate with yay, cleanup tasks to optimize disk space usage after package management operations. It clears package cache and removes unused repositories.

2. **package_list.sh**

   >This script outputs a list of installed packages on the system and ouputs an install script.

3. **get_drivers.sh**

   >This script identifies and lists installed drivers on the system and ouputs an install script.

4. **rmdoubles.sh**

   >This script removes the duplicated lines within a file.

5. **directory_struct.sh**

    >This script creates a python application directory structure the right way.

5. **openssh_docker.sh**

    >This script creates an openssh server within a docker container.
   

# How to Execute a Bash Script on Linux

Open a terminal.
Navigate to the directory containing the script:
  ```bash
  $ cd path/to/your/script
  ```

Make the script executable:
  ```bash
  $ chmod +x script_name.sh
  ```

Run the script:
  ```bash
  $ ./script_name.sh
  ```

Replace script_name.sh with the name of the script you want to run.
License

This project is licensed under the GPL-2.0 License.
