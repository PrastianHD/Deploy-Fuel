# Automatic Contract Deployment Script

## Go to Directory
```
cd fuel-project/counter-contract
export PATH="${HOME}/.fuelup/bin:${PATH}"
```
## Install Requirements
```
sudo apt-get install screen
sudo apt-get install expect
```

## Create New Screen
```
screen -S Deploy
```

## Create Config
```
nano automate_deploy.sh
```

### Edit & Copy This Scprit
```
#!/usr/bin/expect -f

set timeout -1
set password "12345678"
set index "0"
set confirm "y"
set delay1 4
set delay2 60             

for {set i 0} {$i < 1000} {incr i 1} {
    spawn forc deploy --testnet
    sleep $delay1
    expect "Please provide the password of your encrypted wallet vault at \"/home/codespace/.fuel/wallets/.wallet\":" {
        send "$password\r"
    }
    sleep $delay1
    expect "Please provide the index of account to use for signing:" {
        send "$index\r"
    }
    sleep $delay1
    expect "Do you agree to sign this transaction with fuel1hj8w3fhakjctfk4l0r639tfngmz5t29ass952vynpl05k2q05y8qqj2kfy? \\\[y/N\\\]:" {
        send "$confirm\r"
    }
    sleep $delay1
    expect eof
    sleep $delay2  ; 
}
```
### Script Explanation
- Edit according to your password
- Edit each fuel* address
- Edit delay. I set delay 1 minute or 60 for each deploy
- Edit how many deploys, default at 1000x

## Save Script
  `CTRL + X then Y`

## Make the script executable
```
chmod +x automate_deploy.sh
```

## Run Script
```
./automate_deploy.sh
```

## Out from Screen
`CTRL + A D`

## Contract Deployed
Check In [Explorer](https://app.fuel.network/)
