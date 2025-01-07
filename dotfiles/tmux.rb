# tmux
tmux_packages = [
  "tmux"
]

tmux_packages.each do |p|
  package p do
    user "root"
    action :install
  end
end

remote_file "/home/#{node[:user]}/.tmux.conf" do
  owner node[:user]
  source "tmux/.tmux.conf"
end
