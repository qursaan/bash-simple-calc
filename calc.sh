#!/usr/bin/env bash
echo "Welcome to the basic calculator!" | tee operation_history.txt
while true; do
    echo "Enter an arithmetic operation or type 'quit' to quit:" | tee -a operation_history.txt
    read -p '> ' operation
    echo -e "${operation}" >> operation_history.txt
    if [[ "${operation}" == "quit" ]]; then
        echo "Goodbye!"| tee -a operation_history.txt
        break
    fi
    re='^[+-]?([0-9]*.)?[0-9]+ [-+*/^] [+-]?([0-9]*.)?[0-9]+$'
    if [[ "${operation}" =~ ${re} ]]; then
        result=$(echo "scale=2; ${operation}" | bc -l)
        printf "%s\n" "${result}"
        echo "${result}" >> operation_history.txt
    else
        echo "Operation check failed!" | tee -a operation_history.txt
    fi
done