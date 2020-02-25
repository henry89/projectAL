#install nginx, enable and start service and auto start when server is on
package 'nginx'




# # file "/etc/nginx.conf" do
# # 	replace "default_type application/octet-stream"
# # 	with    "#default_type application/octet-stream;"
# # end

# ruby_block "comment line out" do
#     def search_file_replace_line(regex, newline)
#         editor = Chef::Util::FileEdit.new('/etc/nginx/nginx.conf')
#         @changes = (editor.insert_line_if_no_match(regex, newline) > 0) || @changes
#     end
#     search_file_replace_line('default_type application/octet-stream', '#default_type application/octet-stream')
# end

# # ruby_block "ensure node can resolve API FQDN" do
# #     block do
# #       fe = Chef::Util::FileEdit.new("/etc/hosts")
# #       fe.insert_line_if_no_match(/#{node['chef-server']['api_fqdn']}/,
# #                                  "127.0.0.1 #{node['chef-server']['api_fqdn']}")
# #       fe.write_file
# #     end
# #     not_if { Resolv.getaddress(node['chef-server']['api_fqdn']) rescue false }
# #   end


service 'nginx' do
    supports :status => true, :restart => true, :reload => true
    action [ :enable, :start ]
end


#resource to replace line
#https://github.com/jenssegers/chef-patch