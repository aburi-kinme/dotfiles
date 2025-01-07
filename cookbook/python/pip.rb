execute "install pipx" do
  user node[:user]
  command "pip3 install --user pipx"
end

execute "enable pipx" do
  user node[:user]
  command "python3 -m pipx ensurepath"
end

pip_packages = [
  "uv",
  #"python-lsp-server",
  "ruff"
]

pip_packages.each do |p|
  execute "install #{p}" do
    user node[:user]
    command "pipx install #{p}"
  end
end
