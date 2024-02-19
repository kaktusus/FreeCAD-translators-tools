#!/bin/bash
#A.D. 2024-02-17
# zmajstrował kaktus
# pobiera pliki stron wymienione w zapisanej liście (plik o nazwie podanej w drugim parametrze)
# w tym wypadku pierwszym parametrem musi być słowo "lista"
# na pobrane pliki tworzony jest katalog o nazwie listy z tym, że zapisany małymi literami
# jako pierwszy parametr można podać również pojedynczy tytuł do pobrania

#nazwa rozszerzenia dla pobranych plików:
ext="wiki"

# Sprawdź, czy podano przynajmniej jeden argument.
if [ $# -lt 1 ]; then
    echo -e "\nPodaj nazwę pliku z listą tytułów, lub tytuł do pobrania jako pierwszy argument\n."
    exit 1
fi

# Jeśli pierwszy argument to "lista"
if [ "$1" == "lista" ]; then
    # Sprawdź, czy podano nazwę pliku z listą tytułów, jako drugi argument
    if [ -z "$2" ]; then
        echo -e "\nJako drugi argument podaj nazwę pliku z listą tytułów.\n"
        exit 1
    fi

    # Pobierz nazwę pliku z listą tytułów z drugiego argumentu.
    titles_file="$2"
    # Utwórz katalog na podstawie nazwy pliku z listą tytułów.
    directory="$(basename "$titles_file")"
    # Konwersja nazwy katalogu na zapis małymi literami.
    directory=$(echo "$directory" | tr '[:upper:]' '[:lower:]')
    mkdir -p "$directory"

    # Sprawdź, czy plik z listą tytułów istnieje.
    if [ ! -f "$titles_file" ]; then
        echo -e "\nProblem: Plik z listą tytułów nie istnieje.\n"
        exit 1
    fi

    # Przejdź przez każdy tytuł z pliku.
    while IFS= read -r title || [[ -n "$title" ]]; do
        # Jeśli linia jest pusta, zakończ pobieranie i przerwij pętlę.
        if [[ -z "$title" ]]; then
            echo -e "Pobieranie zakończone: Znaleziono pustą linię.\n"
            break
        fi
        # Utwórz URL na podstawie tytułu.
        url="https://wiki.freecad.org/index.php?title=$title&action=raw"

        # Pobierz zawartość z URL i zapisz do pliku.
        echo -e "\e[1;90m "
        curl "$url" > "${directory}/${title}.$ext"
        status=$?

        if [ $status -eq 0 ]; then
            echo -e "/n\e[0mPobieranie tytułu \e[32m$title \e[mzakończone sukcesem. Treść zapisano do: \e[32m${directory}/${title}.$ext\n\e[m"
        else
            echo -e "/n\e[0mBłąd podczas pobierania tytułu \e[32m$title\n\e[m. Kod wyjścia: \e[32m$status\n\e[m"
        fi
    done < "$titles_file"
else
    # Jeśli pierwszy argument to nie "lista", zakładamy, że jest to pojedynczy tytuł.
    title="$1"

    # Utwórz URL na podstawie tytułu.
    url="https://wiki.freecad.org/index.php?title=$title&action=raw"

    # Pobierz zawartość z URL i zapisz do pliku.
    echo -e "\e[1;90m "
    curl "$url" > "${title}.$ext"
    status=$?

    if [ $status -eq 0 ]; then
        echo -e "\n\e[0mPobieranie tytułu \e[32m$title\e[m zakończone sukcesem. Zapisano do: \e[32m${title}.$ext\n\e[m"
    else
        echo -e "\nBłąd podczas pobierania tytułu \e[32m$title\e[m. Kod wyjścia: \e[32m$status\n\e[m"
    fi
fi
