packages = [
  "python3",
  "python3-pip",
  "python3-pylsp",
  "pipx"
]

packages.each do |p|
  package p do
    user "root"
    action :install
  end
end
