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


template '/etc/motd' do
  source 'motd.erb'
  variables(
    :name => 'nagharish'
  )
  action :create
end

service 'ntpd' do
  action [ :enable, :start ]
end




