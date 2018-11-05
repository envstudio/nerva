#!/bin/sh
cd ~
sudo apt install -y build-essential cmake pkg-config libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libcurl4-openssl-dev libminiupnpc-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev libgtest-dev doxygen graphviz
git clone --recursive https://bitbucket.org/nerva-project/nerva
cd nerva
mkdir ./build && cd ./build
cmake -D CMAKE_BUILD_TYPE=Release -D BUILD_SHARED_LIBS=OFF ..
make
cd ~/nerva/build/bin
wget https://getnerva.org/content/bootstrap/mainnet.raw
./nerva-blockchain-import --input-file mainnet.raw  --verify 0
screen -dmS server ./nervad
echo "wait for nervad init p2p"
sleep 10
echo done "done"
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
./nervad $1 $2
