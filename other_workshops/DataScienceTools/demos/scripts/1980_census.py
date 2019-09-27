with open('../data/1980_census.txt', 'r') as f:
    data = [int(line) for line in f.readlines()]

sum_total = sum(data)

with open('../output/1980_census_sum2.tex', 'w') as f:
    f.write('{:,}'.format(sum_total))
