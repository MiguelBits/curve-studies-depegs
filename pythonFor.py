numero = 15013058 #today's block number

#days since 16 oct 2020
for i in range(685):
    numero -= 5760 #how many blocks in a day
    print("forge test --fork-url https://eth-mainnet.alchemyapi.io/v2/XGDnf9iNvs51rbBp5r07HB7nIBg_Frqm --fork-block-number %s -vv &&" %(numero))