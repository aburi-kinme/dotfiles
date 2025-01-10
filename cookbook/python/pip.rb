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
