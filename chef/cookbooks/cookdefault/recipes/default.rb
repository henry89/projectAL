#install basic packages - no need to add 'do' 'end' block. intsall default action for package command
package 'emacs'
package 'tree'

# #show the message of the day - will display info about the server name based on the hostname set when initialy created
# template '/etc/motd' do
#     source 'motd.erb'
#     variables(
#       :teamname => 'Managed by AL'
#     )
#     action :create
#     owner 'root'
#     group 'root'
# end
