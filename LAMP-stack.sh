sudo apt update
sudo apt upgrade

# create a symbolic link to python 3
sudo ln -s /usr/bin/python3  /usr/bin/python
python --version

# Install pip, a simple tool that will allow you to better use python tools and packages later on
sudo apt install python3-pip

# MySQL is a very popular database.  MariaDB is the open source fork from it
sudo apt install mysql-server
sudo mysql_secure_installation
