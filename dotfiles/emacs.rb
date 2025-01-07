packages = [
  # "emacs",
  "cmake",
  "libtool-bin",
  "libvterm-dev",
  "xclip"
]

# for 29.X on 22.04
execute "install emacs with snap" do
  user node[:user]
  command "sudo snap install emacs --classic"
end

packages.each do |p|
  package p do
    user "root"
    action :install
  end
end

directory "/home/#{node[:user]}/.emacs.d" do
  owner node[:user]
end

remote_file "/home/#{node[:user]}/.emacs.d/init.el" do
  owner node[:user]
  source "emacs/init.el"
end

remote_file "/home/#{node[:user]}/.emacs.d/custom.el" do
  owner node[:user]
  source "emacs/custom.el"
end

remote_directory "/home/#{node[:user]}/.emacs.d/emacs" do
  owner node[:user]
  source "emacs/emacs"
end
