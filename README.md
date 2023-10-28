# LDAP

```
vagrant up - Развернет и скофигурирует сервер ИПА и клиента.
```

## Настроить аутентификацию по SSH-ключам*
Для этого нужно выполнить следующее:
```
[root@ipa ~]# sudo -i -u otus-user
Creating home directory for otus-user.
[otus-user@ipa ~]$ 
[otus-user@ipa ~]$ 
[otus-user@ipa ~]$ ssh-keygen -C otus-user@otus.lan
Generating public/private rsa key pair.
Enter file in which to save the key (/home/otus-user/.ssh/id_rsa): 
Created directory '/home/otus-user/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/otus-user/.ssh/id_rsa
Your public key has been saved in /home/otus-user/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:5rdt5LpKrsMj56Jntk9kZviuesPHU0AR/elP35QOFCs otus-user@otus.lan
The key's randomart image is:
+---[RSA 3072]----+
|      o+         |
|      . .    .   |
|     .   . .  o  |
|     ..   oE o   |
|    . =.S.  o   .|
|     * o. . o. ..|
|   . oo.o .= .oo |
|    XoOo . o+ ...|
|  oBo@==o.++.    |
+----[SHA256]-----+
[otus-user@ipa ~]$ klist
klist: Credentials cache 'KCM:1718200003' not found
[otus-user@ipa ~]$ kinit otus-user
Password for otus-user@OTUS.LAN: 
[otus-user@ipa ~]$ klist
Ticket cache: KCM:1718200003
Default principal: otus-user@OTUS.LAN

Valid starting     Expires            Service principal
07/19/23 10:58:59  07/20/23 10:57:29  krbtgt/OTUS.LAN@OTUS.LAN
[otus-user@ipa ~]$ ipa user-mod otus-user --sshpubkey="$(cat /home/otus-user/.ssh/id_rsa.pub)"
-------------------------
Modified user "otus-user"
-------------------------
  User login: otus-user
  First name: Otus
  Last name: User
  Home directory: /home/otus-user
  Login shell: /bin/sh
  Principal name: otus-user@OTUS.LAN
  Principal alias: otus-user@OTUS.LAN
  Email address: otus-user@otus.lan
  UID: 1718200003
  GID: 1718200003
  SSH public key: ssh-rsa
                  AAAAB3NzaC1yc2EAAAADAQABAAABgQDTiMqpN/n40U6mxfJbdDW+QTE7uaXNEjalCQrEYZukWP2r+hBHA+922vKdhs2/5lNxSoQaWGhKVsLVB3Zli42cXJnpwH3qHTNdT5TJOTfnsfbAoClRuo2DSPJuRnx7gdOd758/JvQBbfYCJ2EB8mWJL11JIzbmkzhbnQzD9Z8lu1cT26hglEIZ99Z64+lcDeXpSniUrTJmdIyS0yQiKIhWQemb5AcfTdZMkBceoREJXATJUcT8xgm6w5tLkf//ODapJ52CXLnT5C4VzEAT3DHCoMHyBHiXO69gZoR5t4EtG7O+Oc/amzpXXRlwsVzNTJPEP9PKlD56L9Q5cGlwHiQC0dDPg5D9lNwmDhIg0AdFYbdDocGeCqZ0gUvCPn1GI63Hg2FlbnPKUpDfF+uDH4hba9cHfJ+kdENoKtkEKkaQ+nIDDGIyrBubWR4sNcgn8b0GXr0fmvwfFf38PPz2NExa+pzTFs+BrvdrhFprr0STr3OzFXrwCATJX01beB8QiAs=
                  otus-user@otus.lan
  SSH public key fingerprint: SHA256:5rdt5LpKrsMj56Jntk9kZviuesPHU0AR/elP35QOFCs otus-user@otus.lan (ssh-rsa)
  Account disabled: False
  Password: True
  Member of groups: ipausers
  Kerberos keys available: True
[otus-user@ipa ~]$ ssh -o GSSAPIAuthentication=no 192.168.50.11
The authenticity of host '192.168.50.11 (<no hostip for proxy command>)' can't be established.
ED25519 key fingerprint is SHA256:mw+CTnBTCvP94mi+D4rmtDue3TXiSViKiv1fMBU4J1w.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.50.11' (ED25519) to the list of known hosts.
[otus-user@client1 ~]$ 
[otus-user@client1 ~]$ 
[otus-user@client1 ~]$ su -
Password: 
[root@client1 ~]# journalctl -u sshd -S "5 minutes ago" --no-pager
Jul 19 08:00:50 client1.otus.lan sshd[21618]: main: sshd: ssh-rsa algorithm is disabled
Jul 19 08:00:55 client1.otus.lan sshd[21618]: Accepted publickey for otus-user from 192.168.50.10 port 35628 ssh2: RSA SHA256:5rdt5LpKrsMj56Jntk9kZviuesPHU0AR/elP35QOFCs
```