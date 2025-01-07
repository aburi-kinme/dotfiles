log = MItamae.logger

define :add_repository, keyring_name: nil, keyring_url: nil, repo_url: nil, source_name: nil, arch: nil, channel: nil, branch: nil do
  # prepare
  keyring_url = params[:keyring_url]
  keyring_name = params[:keyring_name]
  repo_url = params[:repo_url]
  keyring_path = "/usr/share/keyrings/#{keyring_name}.gpg"
  if File.exist?(keyring_path)
    log.info "File #{keyring_path} already exists. Skipping installation."
    next
  end
  # add keyring
  execute "add keyring" do
    user "root"
    command "curl -fsSL #{keyring_url} | gpg --dearmor -o #{keyring_path}"
  end
  # add source
  arch = params[:arch]
  channel = params[:channel]
  branch = params[:branch]
  source_name = params[:source_name]  
  output = '"' + "deb [arch=#{arch} signed-by=#{keyring_path}] #{repo_url} #{channel} #{branch}" + '"'
  execute "write source.list.d" do
    user "root"
    command "echo #{output} | tee /etc/apt/sources.list.d/#{source_name}.list"
  end
  # update
  execute 'apt update' do
    user "root"
    command "apt update"
  end
end
