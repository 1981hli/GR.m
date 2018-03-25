# Compile xAct/xPerm/mathlink/xperm.linux.64-bit
```bash
yum install epel-release.noarch
yum groupinstall "Development Tools"
yum install uuid-devel
ln -s /usr/lib64/libuuid.so.1 /usr/lib64/libuuid.so

cp -r /usr/local/Wolfram/Mathematica/11.0/SystemFiles/Links/MathLink/DeveloperKit/Linux-x86-64 ~/
cp ~/.Mathematica/Applications/xAct/xPerm/mathlink/xperm.c ~/Linux-x86-64/
cp ~/.Mathematica/Applications/xAct/xPerm/mathlink/xperm.tm ~/Linux-x86-64/

cd ~/Linux-x86-64
mcc xperm.tm -luuid -O3 -o xperm.linux.64-bit

rm ~/.Mathematica/Applications/xAct/xPerm/mathlink/xperm.linux.64-bit
cp ~/Linux-x86-64/xperm.linux.64-bit ~/.Mathematica/Applications/xAct/xPerm/mathlink/
```
