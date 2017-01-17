
%w{
  cyrus-sasl-plain
  mailx
}.each do |pkg|
  yum_package pkg do
    action :install
  end
end

# Download yandex certificate
# openssl s_client -starttls smtp -crlf -connect smtp.yandex.ru:587
template "/etc/ssl/certYA.pem" do
  source "certYA.pem.erb"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/postfix/main.cf" do
  source "main.cf.erb"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/postfix/master.cf" do
  source "master.cf.erb"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/postfix/sasl_passwd" do
  source "sasl_passwd.erb"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/postfix/generic" do
  source "generic.erb"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/postfix/sender_relay" do
  source "sender_relay.erb"
  owner "root"
  group "root"
  mode 0644
end

script 'postmap' do
  interpreter "bash"
  code <<-EOH
    cd /etc/postfix
    postmap generic sender_relay sasl_passwd
    EOH
end

script 'restart postfix' do
  interpreter "bash"
  code <<-EOH
    systemctl restart postfix
    EOH
end

script 'send test email' do
  interpreter "bash"
  code <<-EOH
    sudo echo "test" | mail -s test #{node.default['aliases']['root_email']}
    EOH
end