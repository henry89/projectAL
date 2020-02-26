#install nginx, enable and start service and auto start when server is on
package 'nginx'

ruby_block 'comment line out' do
    block do 
        f = File.open('/etc/nginx/nginx.conf').read
        f.each_line do |line|
            #comment out octet-stream
            if line.match('default_type application/octet-stream;')
                print (" - Octet stream line found")
                print (" - Updating default_type application/octet-stream; to #default_type application/octet-stream; - ")
                fe = Chef::Util::FileEdit.new('/etc/nginx/nginx.conf')
                fe.search_file_replace_line('default_type application/octet-stream;',"#default_type application/octet-stream;")
                fe.write_file
            end
        end
    end
end


#remove the contents in sites enabled
file '/etc/nginx/sites-enabled/default' do
    content '#will not be used - please refer to the file inside /etc/nginx/conf.d directory \n'
    action :create
    owner 'root'
    group 'root'
end


service 'nginx' do
    supports :status => true, :restart => true, :reload => true
    action [ :enable, :start ]
end


#resource to replace line
#https://github.com/jenssegers/chef-patch