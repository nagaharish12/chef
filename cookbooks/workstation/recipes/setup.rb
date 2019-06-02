package 'vim-enhanced'
package 'emacs'
package 'nano'

package 'tree' do
  action :install 
end

package 'git' do
  action :install
end

package 'ntp' 


#template '/etc/motd' do
#  source 'motd.erb'
#  variables(
#    :name => 'nagharish'
#  )
#  action :create
#end

service 'ntpd' do
  action [ :enable, :start ]
end

user 'user1' do
  comment 'user1'
  uid '123'
  home '/home/user1'
  shell '/bin/bash'
end

group 'admins' do
  members ['user1']
end





