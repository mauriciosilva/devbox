#
# Cookbook Name:: devbox
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

#  include_recipe 'vim'
#  include_recipe 'nodejs'
#  include_recipe 'devbox::nvm'
#  include_recipe 'devbox::redis'

include_recipe 'devbox::nodejs'
