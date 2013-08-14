#
# Cookbook Name :: GraphicsMagick
# Attribute :: default
#
# Copyright 2013, Arizona
#
# All rights reserved - Do Not Redistribute
# 

# GraphicsMagick Attributes
default['graphicsmagick']['name_version'] 							= "GraphicsMagick-1.3.18"
default['graphicsmagick']['name_version_extension'] 		= "#{node['graphicsmagick']['name_version']}.tar.gz"
default['graphicsmagick']['url'] 												= "http://tenet.dl.sourceforge.net/project/graphicsmagick/graphicsmagick/1.3.18/#{node['graphicsmagick']['name_version_extension']}"
default['graphicsmagick']['home']												= "/usr/local/graphicsmagick"

