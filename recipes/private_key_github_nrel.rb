#
# Cookbook Name:: git
# Recipe:: private_key_github_nrel
#
# Copyright 2012, NREL
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ssh_known_hosts"

template "/usr/local/bin/git_ssh_wrap_github_nrel" do
  source "git_ssh_wrap_github_nrel.erb"
  owner "root"
  group "root"
  mode 0700
end

key = data_bag_item("git_private_keys", "github_nrel_gov")
file "#{Chef::Config[:file_cache_path]}/git_ssh_github_nrel.key" do
  content key["private_key"]
  owner "root"
  group "root"
  mode 0600
end
