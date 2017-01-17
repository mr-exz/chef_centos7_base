default['aliases']['root_email'] = 'root@exz.su'

# selinux settings
default['selinux']['node'] = 'permissive'

# sshd settings
default['sshd']['port'] = '40022'

# postfix settings
default['postfix']['myhostname'] = 'se001.exz.su'
default['postfix']['relayhost'] = 'smtp.yandex.ru'
default['postfix']['relay_email'] = 'support@exz.su'
default['postfix']['relay_email_password'] = ''
default['postfix']['generic_user_root'] = 'root'