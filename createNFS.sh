#!/bin/bash

sudo apt update
sudo apt install nfs-kernel-server
mkdir -p /srv/share/upload 
chown -R nfsnobody:nfsnobody /srv/share 
chmod 0777 /srv/share/upload 
sudo exportfs -r
sudo echo "/srv/share *(rw,sync,subtree_check,root_squash)" >> /etc/exports
sudo exportfs -s
systemctl daemon-reload 
systemctl restart remote-fs.target

