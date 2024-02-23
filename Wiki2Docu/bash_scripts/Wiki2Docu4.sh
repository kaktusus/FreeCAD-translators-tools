#!/bin/bash
#A.D. 2024-02-17 (start projektu)
# skrypt do konwersji stron Wiki (html) na Docusaurus (markdown)
# wersja rozwojowa która powstaje na bieżąco
#
# skrypt usuwa tagi tłumaczeniowe wiki z pliku źródłowego
# konwertuje nagłówki wiki na md zgodnie ze stopniem zagnieżdżenia
# 2024-02-19 poprawione rozpoznawanie linków wiki, gdyż jest dużo podobnych tagów
#
#
# ------------------------------------------------------------------------------
# Sprawdź, czy podano nazwę pliku źródłowego jako argument
if [ -z "$1" ]; then
    echo "Podaj nazwę pliku źródłowego jako argument."
    exit 1
fi

# Pobierz nazwę pliku źródłowego z argumentu
wiki_file="$1"

# Sprawdź, czy plik źródłowy istnieje
if [ ! -f "$wiki_file" ]; then
    echo "Plik źródłowy nie istnieje."
    exit 1
fi

# Nazwa pliku wyjściowego
#output_file="${wiki_file%.php}_4.md"
output_file="${wiki_file%.wiki}_4.md"
tmp_file=$(mktemp)

# Przetwarzanie pliku wejściowego
while IFS= read -r line; do
# ------------------------------ wywalamy śmieci -------------------------------
    # Usuwanie tagów <languages/>
    line=$(echo "$line" | sed '/<languages\/>/d')
    # Usuwanie tagów <translate> </translate>
    line=$(echo "$line" | sed 's/<\/\?translate>//g')
    # Usuwanie tagów tłumaczenia <!--T:1-->
    line=$(echo "$line" | sed 's/<!--T:[0-9]*-->//g')
    # zamiana podpunktów # na * i list
    line=$(echo "$line" | sed 's/^#[[:space:]]/\* /g')
    line=$(echo "$line" | sed 's/^\(#\*\|\*#\|\*\*\)[[:space:]]\([[:alnum:]]\|{\)/\t\* \2/')
    line=$(echo "$line" | sed 's/^\*#\*[[:space:]]\([[:alnum:]]\)/\t\t\* \1/')
# ----------------------- konwersja linków wewnętrznych ------------------------

        line=$(echo "$line" | sed "s|\([^|]\)\[\[\([^|]*\)\|\([^]]*\)\]\]|\1[\2](\3)|g")
#    działa jak złoto:       grep -oP '\[\[[^|\]]*\|([^]]*)\]\]' Body.php
    
# ------------------------------ konwersja nagłówków ---------------------------
    # Wyszukiwanie nagłówków zaczynających się od = i kończących się na =
#    if [[ $line =~ ^[=]+(.+?)[=]+$]]; then
    if [[ $line =~ [=]+(.+?)[=] ]]; then
        echo "$line"
#       Wyłuskanie nagłówka
        header=${BASH_REMATCH[1]}
        echo $header >> header.txt
#       Usunięcie znaków ` ``=` z początku i końca nagłówka i różne pierdoły mniej lub bardziej potrzebne
        header_text=$(echo "$header" | sed 's/^ *//;s/=*$//')
        echo $header_text >> header_text.txt
#       Określenie liczby znaków `#` na podstawie liczby znaków `=`
        header_level=$((($(grep -o '=' <<< "$line" | wc -l) - 2) / 2 +1))
        
        echo $header_level >> header_level.txt
#       Usunięcie znaków = z początku i końca nagłówka
        header="$(printf '#%.0s' $(seq 1 $header_level)) $header_text"
#       Zapisanie nagłówka do pliku tymczasowego
        echo "$header" >> "$tmp_file"
    elif [ -n "$line" ]; then
    # Jeśli wiersz nie jest pusty, zapisz go do pliku tymczasowego
        echo "$line" >> "$tmp_file"
    fi

done < "$wiki_file"

# Zapisanie ostatniego wiersza
echo "$line" >> "$tmp_file"
mv "$tmp_file" "$output_file"

echo -e "\nPlik Markdown został wygenerowany pomyślnie.\n"
