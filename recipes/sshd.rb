
template "/etc/ssh/sshd_config" do
  source "sshd_config.erb"
  owner "root"
  group "root"
  mode 0644
end

#script 'restart sshd' do
#  interpreter "bash"
#  code <<-EOH
#    systemctl restart sshd
#    EOH
#end