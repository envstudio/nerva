#!/bin/sh
cd ~
sudo apt-get update
sudo apt install -y build-essential cmake pkg-config libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libcurl4-openssl-dev libminiupnpc-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev libgtest-dev doxygen graphviz
wget https://getnerva.org/content/binaries/nerva-v0.1.4.1_linux-x64.zip
unzip nerva-v0.1.4.1_linux-x64.zip -d nerva
cd nerva
wget https://getnerva.org/content/bootstrap/mainnet.raw
./nerva-blockchain-import --input-file mainnet.raw  --verify 0
screen -dmS server ./nervad
echo "wait for nervad init p2p"
sleep 10
echo "done"
getdb ()
{
        ./nervad status |  cut -d ' '  -f 3 | cut -b 2-4 | cut -d '.' -f 1
}

check () {

        if [ $(getdb) = 100 ]
        then
                return 1
        else
                return 0
        fi

}
while check
do
        if check
        then
                echo "Wait for Synced "
                ((getdb))
                sleep 20
        fi
done
echo "done"
./nervad start_mining $1 $2
