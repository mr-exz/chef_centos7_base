
package 'firewalld'

service 'firewalld' do
  action [:enable, :start]
end

firewalld_port "#{node.default['sshd']['port']}/tcp" do
  action :add
  zone   'public'
end