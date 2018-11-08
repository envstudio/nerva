# Auto Install Nerva Mining


Tutorial how to use

for ubuntu only

run with root

<br>
#1

wget https://raw.githubusercontent.com/envstudio/nerva/master/install.sh
or 
wget https://raw.githubusercontent.com/envstudio/nerva/master/nerva.sh

chmod +x install.sh
or
chmod +x nerva.sh
<br>

./install.sh NV_ADDRESS COre
./nerva.sh NV_ADDRESS COre

<br><br>

or manual
<br>
#2
<br>
wget https://raw.githubusercontent.com/envstudio/nerva/master/install.sh
or
wget https://raw.githubusercontent.com/envstudio/nerva/master/nerva.sh

nano install.sh
nano nerva.sh

and change $1 with your nv_address  and $2 with your core what you want to use
<br><br>
then
chmod +x nerva.sh or chmod +x install.sh
./install.sh or nerva.sh

<br><br><br>

run after reboot 

copy and paste this code

nano /etc/rc.local
<br><br><br>

add this code before exit 0

sudo screen -dmS server ~/nerva/build/bin/nervad

sleep 10

~/nerva/build/bin/nervad start_mining NVADDRESS Core

<br><br>
Donate

NV1YihuhfyH9EJSA2qMB9dHpZbPUDKnxWY2rfch8yyin8v8d4U2JbKk6DMiBxGufxpizV92D7puBMDBUSv2WtyLv2CmFnzGrN
