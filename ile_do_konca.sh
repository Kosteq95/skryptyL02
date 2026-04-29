#! /bin/bash

echo "Podaj o której kończysz pracę:"
read h_end m_end

h_now=$(($(date +%H)+2))
m_now=$(date +%M)

echo "Aktualna godzina to $h_now:$m_now"

h_left=$((h_end-h_now))
m_left=$((m_end-m_now))

echo "Do końca pracy o $h_end:$m_end  zostało: $h_left h $m_left min"

