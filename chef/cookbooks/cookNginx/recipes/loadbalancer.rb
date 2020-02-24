#this will have the loadbalancer configuration


#overwritting the default nginx server configuratio
template '/etc/nginx/sites-available/default' do
    source 'etc/nginx-default.erb'
    action :create
end