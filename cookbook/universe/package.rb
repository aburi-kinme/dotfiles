execute "enable multiverse" do
  user node[:user]
  command "sudo add-apt-repository universe"
end

packages = [
  "steam"
]

packages.each do |p|
  package p do
    user "root"
    action :install
  end
end
