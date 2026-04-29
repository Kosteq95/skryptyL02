#! /bin/bash

echo "Podaj o której kończysz pracę:"
read h_end m_end

if [ $m_end -lt 0 ] || [ $m_end -gt 59 ]
then
    echo "Nie poprawny format minut" 1>&2
    exit 1

fi

if [ $h_end = 24 ]
then
    h_end=0
fi

if [ $h_end -lt 0 ] || [ $h_end -gt 23 ]
then
    echo "Nie poprawny format godzin" 1>&2
    exit 2

fi

h_now=$(($(date +%H)+2))
m_now=$(date +%M)

if [ $m_end -lt $m_now ]
then
  h_end=$((h_end-1))
  m_end=$((m_end+60))
fi

echo "Aktualna godzina to $h_now:$m_now"

h_left=$((h_end-h_now))
m_left=$((m_end-m_now))

echo "Do końca pracy o $h_end:$m_end  zostało: $h_left h $m_left min"

