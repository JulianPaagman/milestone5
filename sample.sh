# Run this command in every year, it then selects a random file from each day in every directory

zless /net/corpora/twitter2/Tweets/20121/01/20160101\:11.out.gz  | /net/corpora/twitter2/tools/tweet2tab text

rm ~/Documents/input_file.txt

cd /net/corpora/twitter2/Tweets/2021/

for month in *; do
    for day in *; do
        tweets=$(ls | sort -R | head -1)
        echo $month$day
        zless /net/corpora/twitter2/Tweets/2020/$month/2020$month$day\:$tweets.out.gz  | /net/corpora/twitter2/tools/tweet2tab text | tee -a ~/Documents/input_file.txt
    done
done