# chef centos7 base

## Environment

* OS: CentOS 7
* cookbook: firewalld,postfix

## Attributes

```
default['aliases']['root_email'] = 'root@exz.su'			# set root e-mail	
default['selinux']['node'] = 'permissive'					# set selinux permissive  
default['sshd']['port'] = '40022'							# set non default ssh port
default['postfix']['myhostname'] = 'se001.exz.su'			# set server hostname
default['postfix']['relayhost'] = 'smtp.yandex.ru'			# do not change if you want use yandex
default['postfix']['relay_email'] = 'support@exz.su'		# set relay email
default['postfix']['relay_email_password'] = ''				# set relay email password
default['postfix']['generic_user_root'] = 'root'			# do not change if you want send email from root
``` 

## Recipes

* selinux - for change selenux mode
* firewalld - for enable firewalld, allow connect to ssh 
* sshd - for configure sshd use non default port
* fail2ban - for protect ssh from bruteforce
* postfix - for sending notification
* aliases - for setup root email
* yum-cron - for check updates and sending notifications

## Kitchen

```
# git clone https://github.com/mr-exz/chef_centos7_base.git
# cd chef_centos7_base
# kitchen converge
# kitchen login
```

If all correct you should get test email notification in ```default['aliases']['root_email']```

## Usage

### Chef solo

```
# curl -sSL https://rvm.io/mpapis.asc | gpg --import -
# curl -L get.rvm.io | bash -s stable
# source /etc/profile.d/rvm.sh
# rvm reload
# rvm requirements run
# rvm install 2.4.0
# rvm use 2.4.0 --default
# gem install chef
# gem install --no-rdoc --no-ri berkshelf
# mkdir /tmp/chef-solo
# cd /tmp/chef-solo
# git clone https://github.com/mr-exz/chef_centos7_base.git
# cd ./chef_centos7_base/
# berks vendor cookbooks
# chef-solo -c solo/solo.rb -j solo/centos7_base.json
```
