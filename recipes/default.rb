#
# Cookbook Name :: GraphicsMagick
# Recipe :: default
#
# Copyright 2013, Arizona
#
# All rights reserved - Do Not Redistribute
# 


dependency_packages.each do |pkg|
  package pkg do
    action :upgrade
  end
end

#GraphicsMagick Recipe
remote_file "#{Chef::Config[:file_cache_path]}/#{node['graphicsmagick']['name_version_extension']}" do
  source "#{node['graphicsmagick']['url']}"
  action :create_if_missing
end

bash "compile_graphicsmagick_source" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
  tar zxf #{node['graphicsmagick']['name_version_extension']}
	cd #{node['graphicsmagick']['name_version']}
	./configure --enable-shared
	make && make install
  EOH
end

