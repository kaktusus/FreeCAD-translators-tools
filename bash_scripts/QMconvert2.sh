#!/bin/bash
# A.D. 2022-04-17 - juniorjpdj (Jacek Pruciak Junior), kaktus (Jacek Pruciak)
# 		QM file converter for FreeCAD translators
# This script was written for the international community engaged in the work of translating and improving FreeCAD GUI translations
# In the first version, this work was done by a long command with pipelined processing. However when more people of different nationalities started to use this solution modifying the command could be cumbersome.
# Therefore, this all-purpose versatile bash script was created to solve several inconveniences, at the same time as it recognizes the language of the source files.
#
# A.D. 2024-02-14
# I extended the script to support codes with region, and to truncate the country (and region) code from the file name if it exists. I found the case with the language code in the name in FreeCAD-addons. I added a test if there are files for conversion in the current directory.
#
if ls -1 *.ts &> /dev/null; then
    echo
    echo -e "Source file(s) to be converted:"
    LS_COLORS='*.ts=01;32' ls -1 -C --color=always *.ts

    # define target directory
    od="$HOME/.local/share/FreeCAD/translations/"
    echo #new line
    echo -e "Target directory is: \e[3m\e[1;35m $od \e[0m\n"
    mkdir -p "$od"

    for f in *.ts ; do
        nf="$(sed 's/\.ts//' <<< "$f")"
        nf="$(sed 's/_.*//' <<< "$nf")"
        lang="$(grep -oP 'language="\K[a-z]{2}(-[A-Z]{2})?(?="[^"]*language=")' "$f")"
        [[ -z "$lang" ]] && echo -e '\e[5m\e[3m\e[1;31m'Unable to detect language for '\e[23m\e[32m'"$f"'\e[3m\e[31m', skipping!'\e[0m\n' && continue
        nf="${nf^}_$lang.qm"
        lrelease "$f" -qm "$nf"
        echo -e "Moving \e[1;32m $nf \e[0m to target directory ...\n"
        mv "$nf" "$od"
        rm "$f"
    done
else
    echo -e "\n \e[1;31m The directory lacks source files for conversion. \e[0m\n"
#    exit 1
fi
