#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

package 'httpd'

remote_file '/var/www/html/robin.png' do
  source 'https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2018/04/how-to-book-more-photography-clients.jpg'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables( :name => 'Lord Voldemort' )
end

service 'httpd' do
  action [:start, :enable]
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end

puts "hey is this working??"

puts "test commit"