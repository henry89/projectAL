#install nginx, enable and start service and auto start when server is on
package 'nginx'

service 'nginx' do
    supports :status => true, :restart => true, :reload => true
    action [ :enable, :start ]
end