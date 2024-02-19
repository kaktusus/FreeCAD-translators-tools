#!/bin/bash
# A.D. 2024-02-18
# pobranie strony https://wiki.freecad.org/index.php?title=Special:AllPages
# i odfiltrowanie tytułów z listy, budowa wykazu, zapis do nowego pliku

# chcemy wyłuskać ten fragment tekstu między `<a href="` a `" title="`.
# oraz między `<a href="` a `" class="`

# Nazwa pliku z zawartością strony HTML
html_file="page1.html"
extracted_links="extracted_links.txt"
base_link="index.php?title=Special:AllPages"
Filtered_titles="all_titles_all"
# Sprawdzenie czy pliki istnieją i zmiana ich nazw, jeśli tak
if [[ -f "$extracted_links" ]]; then
    mv "$extracted_links" "${extracted_links}_old"
fi
if [[ -f "$Filtered_titles" ]]; then
    mv "$Filtered_titles" "${Filtered_titles}_old"
fi

# Licznik powtórzeń
count=0
# Licznik linii w plikach
lines_count=0

# Funkcja do przetwarzania strony
process_page() {
    # Pobranie zawartości strony HTML
    echo -e "\e[1;90m "
    curl -o "$html_file" "https://wiki.freecad.org/$base_link"
#   Zwiększenie licznika powtórzeń
    ((count++))
#   Wyświetlenie licznika powtórzeń
    echo -e "\n\e[0mLiczba pobranych stron: $count\n"

#   Pobranie poszukiwanych wierszy
#    grep -o '<a href="/[^"]*" title="[^"]*"' "$html_file" | sed 's/<a href="\/\(.*\)" title=".*"/\1/' >> "$extracted_links"
#   dodane drugie kryterium warunku zamykającego
    grep -o '<a href="/[^"]*" [^>]*\(title\|class\)="[^"]*"' "$html_file" | sed 's/<a href="\/\(.*\)" [^>]*\(title\|class\)=".*"/\1/' >> "$extracted_links"
#   łatka do wywalenie śmieci
    sed -i 's/" class="mw-redirect//g' "$extracted_links"

    echo -e "\nWyodrębniono i zapisano linki do pliku\e[1;34m $extracted_links\n\e[0m"

    # Sprawdzenie czy w linku występuje fraza index.php?title=Special:AllPages&from=
    if grep -q "index.php?title=Special:AllPages&amp;from=" "$extracted_links"; then
        # Przekonwertowanie linku do odpowiedniego formatu
        next_page_link=$(grep "index.php?title=Special:AllPages&amp;from=" "$extracted_links" | tail -n 1 | sed 's/&amp;/\&/' | sed 's/<a href="\(.*\)" title=".*"/\1/')
        echo -e "Znaleziono link do następnej strony:\e[1;32m $next_page_link\n\e[0m"
#       Usunięcie linków z pliku tytułów
        sed -i "/Special/d" "$extracted_links"
        # Zapytanie czy chcemy pobrać następną stronę
#        read -p $'\e[1;33mCzy chcesz pobrać następną stronę? (t/n):\e[0m ' answer
        # bez klepania enter jeden znak -n 1 i bez wyświetlenia -s, -p pokaż komunikat
        read -rsn1 -p $'\e[1;33mCzy chcesz pobrać następną stronę? (t/n):\e[0m ' answer
        if [[ $answer == "t" ]]; then
            base_link="$next_page_link"
            process_page
        else
            echo -e "\nKoniec przetwarzania.\n"
#           wybiera niepowtarzające się wystąpienia
            awk '!seen[$0]++' "$extracted_links" > "$Filtered_titles"
            echo -e  "generowanie listy\n"
        fi
    else
        echo -e "Nie znaleziono linku do następnej strony. Koniec przetwarzania.\n"
    fi
}
# Uruchomienie przetwarzania strony
process_page

#   Wyświetlenie liczby linii w plikach
lines_count=$(wc -l < "$extracted_links")
echo -e "Liczba linii w pliku $extracted_links: $lines_count"

lines_count=$(wc -l < "$Filtered_titles")
echo -e "Liczba linii w pliku $Filtered_titles: $lines_count"
echo -e "koniec pracy \n"

#jest
#index.php?title=Special:AllPages&amp;from=Arch+CloneComponent%2Fpl
# ma być
#index.php?title=Special:AllPages&from=Arch+CloneComponent%2Fpl
