# zsh
packages = [
  "zsh"
]

packages.each do |p|
  package p do
    user "root"
    action :install
  end
end

# zplug
remote_file "/home/#{node[:user]}/.zshrc" do
  owner node[:user]
  source "zsh/.zshrc"
end

zplug_dir = "#{ENV['HOME']}/.zplug"
directory zplug_dir do
  action :create
end

git "#{zplug_dir}" do
  user node[:user]
  repository "https://github.com/zplug/zplug.git"
end

local_dir = "~/.zsh"
directory local_dir do
  action :create
end

remote_directory "/home/#{node[:user]}/.zsh" do
  owner node[:user]
  source "zsh/local"
end
