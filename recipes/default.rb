#
# Cookbook Name :: GraphicsMagick
# Recipe :: default
#

#GraphicsMagick Recipe

include_recipe 'build-essential'

file_name   = "GraphicsMagick-#{node['graphicsmagick']['version']}"
folder_name = node['graphicsmagick']['version'].split('.')[0..1].join('.')
file_path   = "#{Chef::Config[:file_cache_path]}/#{file_name}.tar.gz"

remote_file file_path  do
  source "#{node['graphicsmagick']['url']}/#{folder_name}/#{file_name}.tar.gz"
  mode   00644

  not_if "test -f #{file_path}"
end

bash 'Compiling GraphicsMagick' do
  cwd Chef::Config[:file_cache_path]

  code <<-COMMMANDS
  tar -zxf #{file_name}.tar.gz
	cd #{file_name}
	./configure
	make && make install
  COMMMANDS

  action :create_if_missing
  not_if "GraphicsMagick-config --version | grep #{node['graphicsmagick']['version']}"
end
