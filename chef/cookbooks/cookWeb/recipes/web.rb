remote_directory "/var/www" do
    source 'webApp'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

template '/etc/nginx/sites-available/default' do
    source 'etc\nginx-default.erb'
    action :create
end