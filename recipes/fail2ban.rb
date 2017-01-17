
%w{
  epel-release.noarch	
  fail2ban 
  fail2ban-firewalld 
  fail2ban-sendmail 
  fail2ban-server 
  fail2ban-systemd
}.each do |pkg|
  yum_package pkg do
    action :install
  end
end

template "/etc/fail2ban/jail.local" do
  source "jail.local.erb"
  owner "root"
  group "root"
  mode 0644
end

script 'enable fail2ban' do
  interpreter "bash"
  code <<-EOH
    systemctl start fail2ban
    systemctl enable fail2ban
    EOH
end