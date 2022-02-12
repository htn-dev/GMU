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

$> sudo mysql
mysql> select user, authentication_string, plugin, host from mysql.user;
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'NewPassword';		# (NewPassword is one that you make up)

mysql> flush privileges				# (then, repeat select statement from above)
mysql> exit
sudo mysql 							# (should fail)
mysql -u root -p 						# (should work normally)

# Install PyMysql
sudo pip3 install pymysql

# Install Apache2
sudo apt install apache2

# Register Python with Apache, enable multi-processing module and allow CGI scripts to run
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork cgi
sudo systemctl restart apache2

# Modify Apache
sudo nano /etc/apache2/sites-enabled/000-default.conf

# Add the following right after the first line, which reads “<VirtualHost *:80\>” using tabs for indentation, not just spaces
# Tell Apache to work from the test directory, that it contains executables, that index.py is the default
<Directory /var/www/test>
  Options +ExecCGI
  DirectoryIndex index.py
</Directory>
AddHandler cgi-script .py									# [note the space!]

# Change “DocumentRoot /var/www/html” into “DocumentRoot /var/www/test” in the same document

sudo systemctl restart apache2

