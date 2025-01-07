packages = [
  "gnome-tweaks",
  "fcitx5",
  "fcitx5-mozc"
]

packages.each do |p|
  package p do
    user "root"
    action :install
  end
end
