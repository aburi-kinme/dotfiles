log = MItamae.logger

define :install_deb, name: nil, url: nil do
  name = params[:name]
  if system("which #{name} > /dev/null 2>&1")
    log.info "'#{name}' already exists. Skipping installation."
    return
  end
  url = params[:url]
  timestamp = Time.now.to_i
  path = "/tmp/#{name}_#{timestamp}.deb"
  execute "wget #{url} -O #{path}"
  execute "sudo apt install #{path}"
end
