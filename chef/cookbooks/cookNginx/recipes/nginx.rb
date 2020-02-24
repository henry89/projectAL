#install nginx, enable and start service and auto start when server is on
package 'nginx'

replace "/etc/nginx.conf" do
	replace "default_type application/octet-stream"
	with    "#default_type application/octet-stream;"
end


file '/etc/nginx/sites-available/default' do
    action :delete
end

service 'nginx' do
    supports :status => true, :restart => true, :reload => true
    action [ :enable, :start ]
end


#resource to replace line
#https://github.com/jenssegers/chef-patch