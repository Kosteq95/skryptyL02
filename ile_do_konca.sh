#! /bin/bash

echo "Podaj o której kończysz pracę:"
read h_end


echo "Do końca pracy o $h_end zostało: $((h_end-($(date +%H)+1))):$((60-$(date +%M)))"


