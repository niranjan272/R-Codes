balance = 1000
bet = 100
numGames =0
i = 0
while(balance >0 && i <10){
  i <- i +1
  outcome = craps()
  if(outcome){
    balance = balance + bet
    bet = 10
  }
  else{
    balance = balance - bet
    if(balance >= 2*bet)
      bet = 2*bet
    else
    bet = balance
  }
}

