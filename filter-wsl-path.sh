# filter-wsl-path.sh - Removes most Windows dirs from the $PATH in WSL.
# SPDX-License-Identifier: 0BSD

if filtered_path="$(get-filtered-wsl-path)"; then
    PATH="$filtered_path"
else
    printf '%s: error: failed to get filtered WSL path\n' "$0" >&2
fi
