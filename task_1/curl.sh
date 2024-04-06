#!/usr/bin/bash
sites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Файл для збереження результатів
logfile="website_status.log"

#Видалення вмісту логів перед використанням
> "$logfile"

# Використання команди curl для перевірки доступності сайтів
for site in ${sites[@]}
do
    if curl -o /dev/null -s -L --head --request GET -w "%{http_code}\\n" "$site" | grep "200" > /dev/null
    then
        echo "$site is UP" >> $logfile
    else
        echo "$site is DOWN" >> $logfile
    fi
done

# Записуєм результати у файл
echo "Result written to $logfile"