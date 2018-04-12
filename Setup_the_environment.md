# Setup the Mathematica + xAct environment in remote server

### Install Mathematica

```bash
sudo ./Mathematica.sh
sudo yum install avahi
```

### Setup tunnel.m

- On remote server.

```bash
git clone https://github.com/sakra/Tunnel.git
sudo cp Tunnel/scripts/tunnel.m ~/.Mathematica/Kernel/
```

- On local client running Unix.

```bash
git clone https://github.com/sakra/Tunnel.git
sudo cp Tunnel/scripts/tunnel.m ~/.Mathematica/Kernel/
cp Tunnel/scripts/tunnel.sh ~/.Mathematica/FrontEnd/
cp Tunnel/scripts/tunnel_sub.sh ~/.Mathematica/FrontEnd/
```

- On local client running Windows.

```dos
copy Tunnel\scripts\tunnel.m C:\ProgramData\Mathematica\Kernel\
copy Tunnel\scripts\tunnel.bat C:\Users\LiHuan\AppData\Roaming\Mathematica\FrontEnd\
copy Tunnel\scripts\tunnel_sub.bat C:\Users\LiHuan\AppData\Roaming\Mathematica\FrontEnd\
```

### Setup ssh

- On remote server.
Add contents to sshd_config to aviod the "time out" problem.

```bash
# vi /etc/ssh/sshd_config
ClientAliveInterval 60
ClientAliveCountMax 3
```

- On local client.
Or you can add contents to ssh_config on local client.

```bash
# vi /etc/ssh/ssh_config
ServerAliveInterval 60
ServerAliveCountMax 3
```

- On local client running Windows. 
Install PuTTY.

```dos
copy plink.exe "c:\Program Files (x86)\PuTTY\"
```

### Connect server using ssh directly

- On Unix client

```bash
ssh 47.106.72.248:wolfram
```

- On Windows client

```dos
plink 47.106.72.248 wolfram
```

### Connect server within Mathematica

You may connect server within Mathematica only when it works outside it using ssh directly.

```mathematica
(*Setup kernels*)
<<tunnel.m
SetupTunnelKernelConfiguration["LHSt","lihuan:password@192.168.0.101","OperatingSystem"->"Unix","VersionNumber"->11.0]
SetupTunnelKernelConfiguration["LHSd","lihuan:password@node1.iask.in:42815","OperatingSystem"->"Unix", "VersionNumber"->11.0]
SetupTunnelKernelConfiguration["A1","lihuan:password@47.106.72.248","OperatingSystem"->"Unix", "VersionNumber"->11.0]
```

### Install xAct

```bash
cp -r xAct/ ~/.Mathematica/Applications/
```

### Compile xperm

In some cases the original xperm.linux.64-bit did not work, you should compile it yourself.

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
