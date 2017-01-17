#
# Cookbook Name:: chef_centos7_base
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'chef_centos7_base::selinux'
include_recipe 'chef_centos7_base::firewalld'
include_recipe 'chef_centos7_base::sshd'
include_recipe 'chef_centos7_base::fail2ban'
include_recipe 'chef_centos7_base::postfix'
include_recipe 'chef_centos7_base::aliases'
include_recipe 'chef_centos7_base::yum-cron'