import csv

howmanylines = 4

with open('balances.txt' , 'r') as txtfile:
    with open('mim.csv', 'w', newline='') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(["UNIX TimeStamp","Virtual Price"," MIM Balance", "3CRV Balance"])

            counter = 0
            arr = []
            for line in txtfile:
                line = line.split()
                if(len(line) > 0):
                    counter += 1
                    arr.append(line[1])
                    if(counter == howmanylines):
                        writer.writerow(arr)
                        counter = 0
                        arr = []