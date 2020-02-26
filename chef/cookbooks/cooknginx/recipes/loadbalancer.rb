#this will have the loadbalancer configuration


#creating the load-balancer configuration file
template '/etc/nginx/conf.d/load-balancer.conf' do
    source 'etc/nginx-default.erb'
    action :create
end

service 'nginx' do
    action [ :enable, :restart ]
end
