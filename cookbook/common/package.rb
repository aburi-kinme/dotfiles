packages = [
  "ripgrep",
  "fzf",
  "calibre",
  "git",
  "code",
  "gh"
]

packages.each do |p|
  package p do
    user "root"
    action :install
  end
end
