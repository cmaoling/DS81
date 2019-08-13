armbian-config
  CPU 200...2000 "on-demand"
  Set HC1 settings
  Set Hostname
  Softfy
    Docker 
  Prohibit root login
env/environment HOST=...
(https://www.digitalocean.com/community/tutorials/how-to-create-an-ssh-ca-to-validate-hosts-and-clients-with-ubuntu)
curl  https://raw.githubusercontent.com/cmaoling/DS81/master/docker.systemd | .
nano /etc/fstab
<RESTART>
sudo nano /etc/systemd/system/docker.service 
sudo systemctl daemon-reload
sudo systemctl status docker.service
