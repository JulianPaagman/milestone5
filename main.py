import matplotlib as mpl
mpl.use('TkAgg')
import matplotlib.pyplot as plt
import regex as re
from datetime import datetime

def check_covid(line):
    line = line.lower()
    if "covid" in line or "corona" in line or "het virus" in line:
        return True
    return False

def count_covid_mentions_rt(input_file, date_pattern):
    date_pattern = re.compile("^[0-9][0-9] [0-9][0-9] (2019|2020|2021|2022)\n$")

    tweets = {}
    retweets = {}

    with open(input_file) as input:
        for line in input:
            if re.match(date_pattern, line):
                current_date = line.strip()
                current_month = current_date[3:]
                tweets[current_month] = [0, 0] # Index 0 = total number of tweets per date, index 1 = total number of original tweets mentioning covid
                retweets[current_month] = [0, 0]
                continue
            if line[:3] == "RT ":
                if check_covid(line):
                    tweets[current_month][0] += 1
                    tweets[current_month][1] += 1
                else:
                    tweets[current_month][0] += 1
            else:
                if check_covid(line):
                    retweets[current_month][0] += 1
                    retweets[current_month][1] += 1
                else:
                    retweets[current_month][0] += 1
    return tweets, retweets
    
def count_covid_mentions_t(input_file, date_pattern):
    tweets = {}

    with open(input_file) as input:
        for line in input:
            if re.match(date_pattern, line):
                current_date = line.strip()
                current_month = current_date[3:]
                tweets[current_month] = [0, 0] # Index 0 = total number of tweets per date, index 1 = total number of tweets mentioning covid
                continue
            if check_covid(line):
                tweets[current_month][0] += 1
                tweets[current_month][1] += 1
            else:
                tweets[current_month][0] += 1
    return tweets

def main():
    input_file = "input_file.txt"

    date_pattern = re.compile("^[0-9][0-9] [0-9][0-9] (2019|2020|2021|2022)\n$")

    tweets, retweets = count_covid_mentions_rt(input_file, date_pattern)
    tweets_retweets = count_covid_mentions_t(input_file, date_pattern)

    dates = []
    monthly_covid_mentions = []
    monthly_covid_retweets = []
    monthly_covid_mentions_retweets = []

    for day in tweets:
        dates.append(datetime.strptime(day, '%m %Y').date())
        monthly_covid_mentions.append(tweets[day][1] / tweets[day][0])
        monthly_covid_retweets.append(retweets[day][1] / retweets[day][0])
    
    for day in tweets_retweets:
        monthly_covid_mentions_retweets.append(tweets_retweets[day][1] / tweets_retweets[day][0])

    fig, (graph1, graph2) = plt.subplots(2)
    fig.suptitle("Graphs")

    graph1.plot(dates, monthly_covid_mentions, label="Tweets")
    graph1.plot(dates, monthly_covid_retweets, label="Retweets")
    graph2.plot(dates, monthly_covid_mentions_retweets, label="Tweets and retweets")

    graph1.legend()
    graph2.legend()
    plt.show()

if __name__ == "__main__":
    main()