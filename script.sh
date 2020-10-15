rp=$(realpath $1)
gzip $rp

if ! [ -d "~/RECYCLE" ]
then
    echo "Проверка папки ~/RECYCLE..."
else
    echo "Папки RECYCLE не существует. Создаем..."
    /usr/bin/mkdir -p ~/RECYCLE
fi

mv $1.gz ~/RECYCLE
echo "Готово!"

diff=$(($(date +%s)-$(stat -c %Y ~/RECYCLE/$1.gz)))
day_secs=86400
day_diff=$(($diff/$day_secs))
echo "Через 7 дней файл будет удален из козины. На данный момент прошло" $day_diff "дней..."

if $3 > 7
then
    rm ~/RECYCLE/$1.gz
fi
