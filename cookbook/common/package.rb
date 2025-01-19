packages = [
  "ripgrep",
  "fzf",
  "calibre",
  "git",
  "gh",
  "gimp",
  "gimp-gmic",
  "timeshift"
]

packages.each do |p|
  package p do
    user "root"
    action :install
  end
end
