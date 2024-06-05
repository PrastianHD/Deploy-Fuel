#!/bin/bash

# Update and upgrade system
sudo apt update
sudo apt upgrade -y
sudo apt-get install curl screen -y 

# Install Rust
curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
rustc --version
rustup install stable
rustup update stable
rustup default stable

# Install Git
sudo apt install git -y 

# Install Fuel Toolchain
curl https://install.fuel.network | sh

# Add Fuelup to PATH
export PATH="${HOME}/.fuelup/bin:${PATH}"

# Setting FUELUP
fuelup toolchain install latest
fuelup self update
fuelup update && fuelup default latest

# Create project
mkdir -p fuel-project && cd fuel-project
forc new counter-contract

# Edit contract
cat << 'EOF' > counter-contract/src/main.sw
contract;
 
storage {
    counter: u64 = 0,
}
 
abi Counter {
    #[storage(read, write)]
    fn increment();
 
    #[storage(read)]
    fn count() -> u64;
}
 
impl Counter for Contract {
    #[storage(read)]
    fn count() -> u64 {
        storage.counter.read()
    }
 
    #[storage(read, write)]
    fn increment() {
        let incremented = storage.counter.read() + 1;
        storage.counter.write(incremented);
    }
}
EOF

# Build contract
cd counter-contract
forc build

echo "Setup complete!"
