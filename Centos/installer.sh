#--------------------------------------------------
#Softether auto install script
#Centos 7
#Created May 25, 2018
#Latest Softether Server Version for May 2018 v4.27-9667-beta-2018.05.26-tree
#Coded by Jayson Velagio
#Open Source Project From https://www.softether.org/
#From university of Tsukuba, Japan
#--------------------------------------------------
#Login with root permission or execute #sudo su
#Script start
#--------------------------------------------------
#Updating centos version
cd /root
yum update -y
yum groupinstall "development tools" -y
#Downloading server files
yum install wget -y
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.29-9680-rtm/softether-vpnserver-v4.29-9680-rtm-2019.02.28-linux-x64-64bit.tar.gz
tar zxf softether-vpnserver-v4.29-9680-rtm-2019.02.28-linux-x64-64bit.tar.gz
cd vpnserver
clear
echo  -e "\033[31;7mNOTE: ANSWER 1 AND ENTER THREE TIMES FOR THE COMPILATION TO PROCEED\033[0m"
#Installing server files, Manual input
make
cd /root
mv vpnserver /usr/local
rm -rf softether-vpnserver-v4.29-9680-rtm-2019.02.28-linux-x64-64bit.tar.gz
cd /usr/local/vpnserver
chmod 600 *
chmod 700 vpncmd
chmod 700 vpnserver
#Installing server command
wget https://raw.githubusercontent.com/chinamore/SoftetherAutoInstallMultiPlatform/master/Centos/vpn-server.sh --no-check-certificate
mv vpn-server.sh /etc/init.d/vpnserver
cd /etc/init.d/
chmod 755 vpnserver
chkconfig --add vpnserver
/etc/init.d/vpnserver start
cd /usr/local/vpnserver
echo ---------------------------------------------
echo  -e "\033[32;5mVPN SERVER INSTALLED SUCCESSFULLY!\033[0m"
echo "SoftEther auto installer by JAYSON VELAGIO"
echo "vpncmd is at /usr/local/vpnserver"
echo ---------------Commands----------------------
echo /etc/init.d/vpnserver start - to start
echo /etc/init.d/vpnserver restart - to restart
echo /etc/init.d/vpnserver stop - to stop
echo ---------------------------------------------
#End of script
