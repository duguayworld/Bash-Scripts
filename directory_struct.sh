#!/bin/bash

# Change directory to main
cd main || exit

# Create src directory and its subdirectories
mkdir -p src/{gui/components,gui/views,gui/utils}

# Create resources directory and its subdirectories
mkdir -p resources/{images,config}

# Create tests directory
mkdir -p tests

# Create docs directory
mkdir -p docs

# Create .gitignore file excluding .venv folder
echo ".venv/" > .gitignore

# Create README.md file
touch README.md

# Create requirements.txt file
touch requirements.txt

# Create LICENSE file
touch LICENSE

# Success message
echo "Directory structure created successfully!"
