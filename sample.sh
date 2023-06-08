# Run this command, it then selects a random file from each day between the 1st of december 2020 and the 31st of december 2022

rm ~/Documents/input_file.txt

cd /net/corpora/twitter2/Tweets/2019/

year="2019"

for day in $(seq -w 1 31); do
    echo "$day 12 $year" | tee -a ~/Documents/input_file.txt
    zless /net/corpora/twitter2/Tweets/$year/12/201912$day:12.out.gz  | /net/corpora/twitter2/tools/tweet2tab text | tee -a ~/Documents/input_file.txt
done

cd /net/corpora/twitter2/Tweets/2020/

year="2020"

for month in *; do
    if [ "$month" == "02" ];
    then
        for day in $(seq -w 1 29); do        #schrikkeljaar
            echo "$day $month $year" | tee -a ~/Documents/input_file.txt
            zless /net/corpora/twitter2/Tweets/$year/$month/$year$month$day:12.out.gz  | /net/corpora/twitter2/tools/tweet2tab text | tee -a ~/Documents/input_file.txt
        done
    elif [ "$month" == "01" ] || [ "$month" == "03" ] || [ "$month" == "05" ] || [ "$month" == "07" ] || [ "$month" == "08" ] || [ "$month" == "10" ] || [ "$month" == "12" ]; then
        for day in $(seq -w 1 31); do
            echo "$day $month $year" | tee -a ~/Documents/input_file.txt
            zless /net/corpora/twitter2/Tweets/$year/$month/$year$month$day:12.out.gz  | /net/corpora/twitter2/tools/tweet2tab text | tee -a ~/Documents/input_file.txt
        done
    else
        for day in $(seq -w 1 30); do
            echo "$day $month $year" | tee -a ~/Documents/input_file.txt
            zless /net/corpora/twitter2/Tweets/$year/$month/$year$month$day:12.out.gz  | /net/corpora/twitter2/tools/tweet2tab text | tee -a ~/Documents/input_file.txt
        done
    fi
done

cd /net/corpora/twitter2/Tweets/2021/

year="2021"

for month in *; do
    if [ "$month" == "02" ];
    then
        for day in $(seq -w 1 28); do
            echo "$day $month $year" | tee -a ~/Documents/input_file.txt
            zless /net/corpora/twitter2/Tweets/$year/$month/$year$month$day:12.out.gz  | /net/corpora/twitter2/tools/tweet2tab text | tee -a ~/Documents/input_file.txt
        done
    elif [ "$month" == "01" ] || [ "$month" == "03" ] || [ "$month" == "05" ] || [ "$month" == "07" ] || [ "$month" == "08" ] || [ "$month" == "10" ] || [ "$month" == "12" ]; then
        for day in $(seq -w 1 31); do
            echo "$day $month $year" | tee -a ~/Documents/input_file.txt
            zless /net/corpora/twitter2/Tweets/$year/$month/$year$month$day:12.out.gz  | /net/corpora/twitter2/tools/tweet2tab text | tee -a ~/Documents/input_file.txt
        done
    else
        for day in $(seq -w 1 30); do
            echo "$day $month $year" | tee -a ~/Documents/input_file.txt
            zless /net/corpora/twitter2/Tweets/$year/$month/$year$month$day:12.out.gz  | /net/corpora/twitter2/tools/tweet2tab text | tee -a ~/Documents/input_file.txt
        done
    fi
done

cd /net/corpora/twitter2/Tweets/2022/

year="2022"

for month in *; do
    if [ "$month" == "02" ];
    then
        for day in $(seq -w 1 28); do
            echo "$day $month $year" | tee -a ~/Documents/input_file.txt
            zless /net/corpora/twitter2/Tweets/$year/$month/$year$month$day:12.out.gz  | /net/corpora/twitter2/tools/tweet2tab text | tee -a ~/Documents/input_file.txt
        done
    elif [ "$month" == "01" ] || [ "$month" == "03" ] || [ "$month" == "05" ] || [ "$month" == "07" ] || [ "$month" == "08" ] || [ "$month" == "10" ] || [ "$month" == "12" ]; then
        for day in $(seq -w 1 31); do
            echo "$day $month $year" | tee -a ~/Documents/input_file.txt
            zless /net/corpora/twitter2/Tweets/$year/$month/$year$month$day:12.out.gz  | /net/corpora/twitter2/tools/tweet2tab text | tee -a ~/Documents/input_file.txt
        done
    else
        for day in $(seq -w 1 30); do
            echo "$day $month $year" | tee -a ~/Documents/input_file.txt
            zless /net/corpora/twitter2/Tweets/$year/$month/$year$month$day:12.out.gz  | /net/corpora/twitter2/tools/tweet2tab text | tee -a ~/Documents/input_file.txt
        done
    fi
done

cd

