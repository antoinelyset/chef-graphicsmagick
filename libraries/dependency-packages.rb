#
# Cookbook Name :: GraphicsMagick
# Library :: Dependency Packages
#
# Copyright 2013, Arizona
#
# All rights reserved - Do Not Redistribute
# 

# GraphicsMagick Module
module GraphicsMagick
  module DependencyPackages
    def dependency_packages
      [
        "gcc",
        "ghostscript",
        "libpng",
        "libpng-devel",
        "libjpeg",
        "libjpeg-devel",
        "libtiff",
        "libtiff-devel",
        "freetype",
        "freetype-devel"
      ]
    end
  end
end

class Chef::Recipe
  include GraphicsMagick::DependencyPackages
end
