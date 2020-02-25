#this will have the loadbalancer configuration


#overwritting the default nginx server configuratio
template '/etc/nginx/conf.d/load-balancer.conf' do
    source 'etc/nginx-default.erb'
    action :create
end

service 'nginx' do
    :restart
end
