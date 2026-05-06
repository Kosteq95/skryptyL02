#skrypt który będzie tworzył bazę paszportów samochodów np na firmie. "Paszport" będzie w formie pliku 
#i bedzie zawierał podstawowe informacje o pojezdzie
#skryt będzie odpowiednio segregował paszporty w foldery 
# ~/Baza_Pojazdow/
#       |- ciezarowe

#       |- osobowe
#            |- Audi
#                - TK12345.pc
#            |- Opel
#rozdział na samochody osobower i ciezarowe bedzie za pomocą argumentu do skrytu -c ciezarowy -o lub brak argumntu to samochód osobowy
#
#-------------- CAR PASSPORT ----------------- 
# Marka: ......... 
# Model: ......... 
# Rocznik: ....... 
# Numer rejestracyjny: .......... 
# Data ostatniego przegladu: DD.MM.YYYY 
# Przebieg na ostatnim przeglądzie: ...... km 
set -e

function pobierz_dane
{
    dana=""
    licznik=0
    while [ -z $dana ]
    do
        read -p "Podaj $1 pojazdu: " dana
        licznik=$((licznik+1))

        if [ $licznik -gt 3 ]
        then
            echo "Nie podałeś wymaganych danych!" 1>&2
            exit 2
        fi
    done
    echo $dana
}


typ="osobowe"

if [ "$1" = "-c" ]
then
    typ=ciezarowe
elif [ -n "$1" ] && [ "$1" != "-o" ]
then
   echo "Nie poprawny argument!" 1>&2
   exit 1
fi



#read -p "Podaj markę samochodu: " marka
marka=$(pobierz_dane "markę")
read -p "Podaj model samochodu: " model
read -p "Podaj rocznik samochodu: " rocznik
read -p "Podaj numer rejestracyjny samochodu: " nr_rej
read -p "Podaj datę ostatniego przeglądu i przebieg samochodu: (DD:MM:YYYY) " data_przegladu przebieg


dir_path="$HOME/Baza_Pojazdow/$typ/$marka"
if ! [ -d $dir_path ] 
then
 mkdir -p $dir_path
fi

echo "-------------- CAR PASSPORT ----------------- 
Marka: $marka
Model: $model
Rocznik: $rocznik 
Numer rejestracyjny: $nr_rej
Data ostatniego przegladu: $data_przegladu
Przebieg na ostatnim przeglądzie: $przebieg km 
Ostania aktualizacja odbyła się $(date +%d.%m.%Y\ %H:%M:%S) przez $USER" > $dir_path/$nr_rej.pc