import json
import sys
import gzip

input_file = ""

with gzip.open(input, 'rt', encoding='utf8') as input:
    for line in input:
        print(json.loads(line)['text'])