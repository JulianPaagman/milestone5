import matplotlib as mpl
mpl.use('TkAgg')
import matplotlib.pyplot as plt
import numpy as np
import regex as re
from datetime import datetime

def check_covid(line):
    line = line.lower()
    if "covid" in line or "corona" in line or "het virus" in line:
        return True
    return False

def count_covid_mentions(input_file):
    date_pattern = re.compile("^[0-9][0-9] [0-9][0-9] (2019|2020|2021|2022)\n$")

    tweets = {}

    with open(input_file) as input:
        tweets = {}
        for line in input:
            if re.match(date_pattern, line):
                current_date = line.strip()
                print(current_date)
                tweets[current_date] = [0, 0, 0] # Index 0 = total number of tweets per date, index 1 = total number of tweets mentioning covid
                continue
            if check_covid(line):
                tweets[current_date][0] += 1
                tweets[current_date][1] += 1
            else:
                tweets[current_date][1] += 1
            print(tweets[current_date][1])
        return tweets

def main():
    input_file = "test_input.txt"

    tweets = count_covid_mentions(input_file)

    dates = []
    monthly_covid_mentions = []


    for day in tweets:
        month = day[2:5]
        print("month: ", month)
        if tweets[day][0] != 0:
            dates.append(datetime.strptime(day, '%d %m %Y').date())
            monthly_covid_mentions.append(tweets[day][1] / tweets[day][0])
            print("Covid mentions: ", monthly_covid_mentions)
        else:
            print(day)
            dates.append(datetime.strptime(day, '%d %m %Y').date())
            monthly_covid_mentions.append(0)
    
    plt.plot(dates, monthly_covid_mentions)
    plt.show()
    print(monthly_covid_mentions)

if __name__ == "__main__":
    main()