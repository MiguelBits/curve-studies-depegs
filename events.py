from web3 import Web3, EthereumTesterProvider
import numpy as np
import csv

w3 = Web3(Web3.HTTPProvider("https://eth-mainnet.alchemyapi.io/v2/XGDnf9iNvs51rbBp5r07HB7nIBg_Frqm"))


curve_3pool = "0xbEbc44782C7dB0a1A60Cb6fe97d0b483032FF1C7"
stEth_pool = "0xDC24316b9AE028F1497c275EB9192a3Ea0f67022"
pUSD_pool = "0x8EE017541375F6Bcd802ba119bdDC94dad6911A1"
degenbox_lp = "0x55A8a39bc9694714E2874c1ce77aa1E599461E18"
wormhole_ust = "0xCEAF7747579696A2F0bb206a14210e3c9e6fB269"
cvxCrx = "0x9D0464996170c6B9e75eED71c68B99dDEDf279e8"
usdn_pool = "0x0f9cb53Ebe405d49A0bbdBD291A65Ff571bC83e1"
mim_3crv = Web3.toChecksumAddress("0x5a6a4d54456819380173272a5e8e9b9904bdf41b")

pool_address = [curve_3pool,stEth_pool,pUSD_pool,degenbox_lp,wormhole_ust,cvxCrx,usdn_pool, mim_3crv]

"""
A doesn’t go instantaneously from x to y
There’s a ramp
If it happens instantaneously, the losses to LPs would be bigger. So it spread out over time more or less.
"""

if(w3.isConnected()):
    with open('pools.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        for i in range(len(pool_address)):
            writer.writerow(["Curve Pool: ",pool_address[i]])
            contract_pool = w3.eth.contract(address=pool_address[i], abi=open("pool.abi", "r").read())
            event_filter = contract_pool.events.RampA.createFilter(fromBlock=0, toBlock='latest')
            all_logs = event_filter.get_all_entries()
            print(pool_address[i])

            for log in all_logs:
                print(log.args)

                #np.linspace(old_A, new_A, (future_time-initial_time)/secondsPerDay )
                old_A = log.args["old_A"]
                new_A = log.args["new_A"]
                future_time = log.args["future_time"]
                initial_time = log.args["initial_time"]
                linspace = np.linspace(old_A, new_A, int((future_time-initial_time)/86400))
                writer.writerow(["UNIX TimeStamp","Old_A","New_A","Initial_time","Future_time"])

                if(len(linspace)>2):
                    writer.writerow([initial_time,old_A,linspace[1],initial_time,initial_time + 86400])
                    new_time = initial_time

                    for l in range(1,len(linspace)-1):
                        new_time = new_time + 86400
                        writer.writerow([new_time, linspace[l-1], linspace[l], new_time, new_time + 86400])
                    
                    writer.writerow([future_time, linspace[-2], new_A, future_time, future_time])

                else:
                    writer.writerow([initial_time, old_A, new_A,initial_time, future_time])
                    writer.writerow([future_time, new_A, new_A, future_time, future_time])
                #print(linspace)
                #print("\n")

