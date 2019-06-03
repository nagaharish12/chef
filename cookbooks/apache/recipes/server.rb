#
# cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2019 The Authors, All Rights Reserved.

# notifies :action, 'resource[name]', :timer
# subscribes :action, 'resource[name]', :timer
#
# :before, :delayed, :immediately

package 'httpd' do
  action :install
end

#bash "inline script"  do
#  user "root"
#  code "mkdir -p /var/www/mysites/ && chown -R apache /var/www/mysites/"
#  not_if '[ -d /var/www/mysites/ ]'
#  not_if do
#    File.directory?('/var/www/mysites/')
#  end
#end

#execute "run a script" do
#  user "root"
#  command <<-EOH
#  mkdir -p /var/www/mysites/ /
#  chown -R apache /var/www/mysites/
#  EOH
#  not_if
#end

#execute "run script" do
#  user "root"
#  command './myscript.sh'
#  not_if
#end

#directory "/var/www/mysites/" do
#  owner "apache"
#  recursive true
#end

#cookbook_file '/var/www/html/index.html' do
#  source 'index.html'
#end

#remote_file '/var/www/html/harish.png' do
#  source 'https://www.google.com/search?hl=en&tbm=isch&source=hp&biw=1280&bih=605&ei=5zX0XJrkFc29gge0v6GgBw&q=aws&oq=aws&gs_l=img.3..0l10.3270.3726..3925...0.0..0.162.259.2j1......0....1..gws-wiz-img.....0.jpir72Wy9oE#imgrc=Hbx6kYxtn5F10M:'
#end

template '/var/www/html/index.html' do
  source 'index.html.erb'
#  notifies :restart, 'service[httpd]', :immediately
  action :create
end

service 'httpd' do
  action [ :enable, :start ]
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end

