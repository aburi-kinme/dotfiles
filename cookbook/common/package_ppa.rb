add_repository "docker" do
  keyring_name "docker"
  keyring_url "https://download.docker.com/linux/ubuntu/gpg"
  repo_url "https://download.docker.com/linux/ubuntu"
  source_name "docker"
  arch "amd64"
  channel "jammy"
  branch "stable"
end

add_repository "brave" do
  keyring_name "brave-browser-archive-keyring"
  keyring_url "https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg"
  repo_url "https://brave-browser-apt-release.s3.brave.com/"
  source_name "brave-browser-release"
  arch "amd64"
  channel "stable"
  branch "main"
end

add_repository "nodejs" do
  keyring_name "nodesource-repo.gpg"
  keyring_url "https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key"
  repo_url "https://deb.nodesource.com/node_20.x"
  source_name "nodesource"
  arch "amd64"
  channel "nodistro"
  branch "main"
end

add_repository "vscode" do
  keyring_name "packages.microsoft.gpg"
  keyring_url "https://packages.microsoft.com/keys/microsoft.asc"
  repo_url "https://packages.microsoft.com/repos/code"
  source_name "microsoft"
  arch "amd64"
  channel "stable"
  branch "main"
end

packages = [
  "brave-browser",
  "docker",
  "nodejs",
  "code"
]

packages.each do |p|
  package p do
    user "root"
    action :install
  end
end
