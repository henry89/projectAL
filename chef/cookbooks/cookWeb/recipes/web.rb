file "/var/www" do
    source '~/projectAL/webApp'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end