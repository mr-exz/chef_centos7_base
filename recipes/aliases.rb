
template "/etc/aliases" do
  source "aliases.erb"
  owner "root"
  group "root"
  mode 0644
end

script 'newaliases' do
  interpreter "bash"
  code <<-EOH
    newaliases
    EOH
end