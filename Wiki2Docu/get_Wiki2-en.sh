#!/bin/bash
#A.D. 2024-02-17
# This script was crafted by kaktus to assist Gauri with her project.
# ------------------------------------------------------------------------------
# This bash script downloads files of pages listed in the saved list (file name provided in the second argument).
# In this case, the first parameter must be the word "lista".
# A directory is created for the downloaded files with the same name as the list, but written in lowercase.
# Alternatively, you can also provide a single title to download (the page must exist).
# The recipe for the list of pages can be found on the FreeCAD forum at:
#               https://forum.freecad.org/viewtopic.php?style=4&p=741384#p741384
# ------------------------------------------------------------------------------

# File extension for downloaded files.
ext="txt"

# Check if at least one argument has been provided.
if [ $# -lt 1 ]; then
    echo "Provide the filename with the list of titles or the title to download as the first argument."
    exit 1
fi

# If the first argument is "lista"
if [ "$1" == "lista" ]; then
    # Check if the filename for the list of titles is provided as the second argument.
    if [ -z "$2" ]; then
        echo "Provide the filename for the list of titles as the second argument."
        exit 1
    fi

    # Get the filename for the list of titles from the second argument.
    titles_file="$2"
    # Create a directory based on the filename of the list of titles.
    directory="$(basename "$titles_file")"
    # Convert the directory name to lowercase.
    directory=$(echo "$directory" | tr '[:upper:]' '[:lower:]')
    mkdir -p "$directory"

    # Check if the file with the list of titles exists.
    if [ ! -f "$titles_file" ]; then
        echo "The file with the list of titles does not exist."
        exit 1
    fi

    # Iterate through each title from the file.
    while IFS= read -r title || [[ -n "$title" ]]; do
        # If the line is empty, end processing.
        if [[ -z "$title" ]]; then
            echo -e "Download finished: Empty line found.\n"
            break
        fi
        # Create a URL based on the title.
        url="https://wiki.freecad.org/index.php?title=$title&action=raw"

        # Fetch the content from the URL and save it to a file.
        curl "$url" > "${directory}/${title}.$ext"
        status=$?

        if [ $status -eq 0 ]; then
            echo -e "Downloaded title \e[32m$title \e[msuccessfully. Saved to: \e[32m${directory}/${title}.$ext\n\e[m"
        else
            echo "Error while downloading title \e[32m$title\n\e[m. Exit code: \e[32m$status\n\e[m"
        fi
    done < "$titles_file"
else
    # If the first argument is not "lista", we assume it is a single title.
    title="$1"

    # Create a URL based on the title.
    url="https://wiki.freecad.org/index.php?title=$title&action=raw"

    # Fetch the content from the URL and save it to a file.
    curl "$url" > "${title}.$ext"
    status=$?

    if [ $status -eq 0 ]; then
        echo -e "Downloaded title \e[32m$title \e[msuccessfully. Saved to: \e[32m${title}.$ext\n\e[m"
    else
        echo "Error while downloading title \e[32m$title\n\e[m. Exit code: \e[32m$status\n\e[m"
    fi
fi
