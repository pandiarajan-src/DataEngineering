#!/bin/zsh

# Find all bash scripts
find . -name "*.sh"

# Find all executable non-invisible files
echo "==========Executable non-invisible files=========="
# Works only in linux
find . -perm /+x ! -name '.*' -type f

# Find all executable non-invisible files and ignore .git directories
find . -perm /+x -not -path '*/\.*' -type f
