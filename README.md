echo 'tunnel(){ echo "Tunneling port $1..."; ssh -N -R 9000:localhost:$1 root@{YOUR HOST} }' >> ~/.bashrc