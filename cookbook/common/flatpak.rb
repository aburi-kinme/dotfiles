base_packages = [
  "flatpak"
]

base_packages.each do |p|
  package p do
    user "root"
    action :install
  end
end

execute "setup flathub" do
  user node[:user]
  command "flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo"
end

packages = [
  "md.obsidian.Obsidian",
  "com.slack.Slack",
  "org.torproject.torbrowser-launcher"
]

packages.each do |p|
  execute "install #{p}" do
    user node[:user]
    command "flatpak install -y #{p}"
  end
end
