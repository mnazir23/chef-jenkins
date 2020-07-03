#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# create MongoDB 
#include_recipe "sc-mongodb::default"

mongodb_db_data 'data' do
    action :add
end