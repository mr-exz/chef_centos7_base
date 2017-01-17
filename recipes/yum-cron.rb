
%w{
  yum-cron
}.each do |pkg|
  yum_package pkg do
    action :install
  end
end

template "/etc/yum/yum-cron.conf" do
  source "yum-cron.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

script 'enable yum-cron' do
  interpreter "bash"
  code <<-EOH
    systemctl enable yum-cron
    systemctl start yum-cron
  EOH
end