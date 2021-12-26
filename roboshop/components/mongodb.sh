echo "setting up mongodb repo"

echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo

echo "Installing mongodb"
yum install -y mongodb-org >/tmp/log # sending the output to the /tmp/log file


# Update Liste IP address from 127.0.0.1 to 0.0.0.0 in config file
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
# Config file: /etc/mongod.conf

systemctl enable mongod
systemctl start mongod

curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"

cd /tmp
unzip -o mongodb.zip  >/tmp/log # -o to over ride the file rather than asking every time
cd mongodb-main
mongo < catalogue.js >/tmp/log
mongo < users.js >/tmp/log
