# FreeCAD-translators-tools
Skrypty Bash przydatne dla tłumaczy FreeCAD

---

## QMconvert2.sh
W połączeniu z wydaniami [weekly-builds FreeCAD](https://github.com/FreeCAD/FreeCAD-Bundle/releases/tag/weekly-builds) przygotowanymi w formie ***AppImage*** otrzymujemy możliwość testowania opracowanych tłumaczeń "od ręki". Bez konieczności czekania na pełen cykl wydania kolejnej wersji testowej, zawierającej zaktualizowane tłumaczenia interfejsu użytkownika.

Tłumaczenia dla [FreeCAD](https://www.freecad.org/index.php?lang=pl) wykonywane są na platformie [Crowdin](https://crowdin.com/project/freecad/pl). Stamtąd należy pobrać aktualne pliki z tekstami GUI w ulubionym języku.

To druga już wersja tego skryptu bash, mająca na celu przygotowanie skompilowanych plików językowych środowiska programistycznego QT, na którym bazuje FreeCAD. Zasadniczo skrypt powstał aby ułatwić tłumaczom testowanie w lokalnym środowisku jakości tłumaczeń przygotowanych dla GUI. Możliwe też jest wykonywanie tłumaczeń lokalnie, np zewnętrznych środowisk pracy, które nie są jeszcze zgłoszone do FreeCAD-addons. W takim przypadku skrypt również może być przydatny.

### Co zrobi ten skrypt:
* zapewni dostosowanie nazwy pliku do przyjętych założeń _(wielka litera z przodu itd)_,
* doda do nazwy pliku kod języka _(od teraz kod + ewentualnie region)_, który to jest odczytywany z nagłówka pliku źródłowego,
* wykona kompilację zainstalowanym w systemie narzędziem ***lrelease***,
* przeniesie skompilowane pliki w odpowiednie miejsce struktury katalogów programu FreeCAD,
* skrypt może przetwarzać dowolną ilość plików źródłowych, znajdujących się w katalogu bieżącym.

### Przygotowanie środowiska lokalnego na potrzeby skryptu.
Pracując na Debian OS, będziesz potrzebował pakietu:
```
qttools5-dev-tools
```
Zawiera on narzędzia QT, wtym niezbędny lrelease.

### Przygotowanie plików źródłowych z tłumaczeniami.
Pliki `.ts` do części GUI, która Cię interesuje możesz pobrać z platformy Crowdin Projektu [FreeCAD](https://crowdin.com/project/freecad/pl) lub [FreeCAD-addons](https://crowdin.com/project/freecad-addons). Gdy nie posiadasz konta musisz posiadać znajomego, który takowe ma.

![jak pobrać plik źródłowy](/images/download_2024-02-15_13-56.webm)
Jeśli pracujesz z zewnętrznym środowiskiem pracy z poza repozytorium ***FreeCAD-addons***, pliki źródłowe tłumaczeń musisz wygenerować samodzielnie, lokalnie.

### Praca ze skryptem.
Nie jest niczym wyrachowanym. Do katalogu, w którym masz pobrane pliki źródłowe skopiuj plik skryptu. Nadaj mu wymagane uprawnienia `+x`, po czym wywołaj go w konsoli.

![działanie skryptu](https://github.com/kaktusus/FreeCAD-translators-tools/blob/main/QMConvwet2_2024-02-15_14-53.webm)https://github.com/kaktusus/FreeCAD-translators-tools/blob/main/QMConvwet2_2024-02-15_14-53.webm)

#### Pobierz sktypt tutaj.
[QMConvert2](/bash_scripts/QMconvert2.sh)
