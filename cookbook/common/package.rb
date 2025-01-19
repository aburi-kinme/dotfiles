packages = [
  "ripgrep",
  "fzf",
  "calibre",
  "git",
  "gh",
  "gimp",
  "gimp-gmic"
]

packages.each do |p|
  package p do
    user "root"
    action :install
  end
end
