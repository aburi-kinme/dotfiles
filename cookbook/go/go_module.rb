go_modules = [
  "golang.org/x/tools/gopls@v0.14.2" # for 1.18
]

go_modules.each do |m|
  execute "install #{m}" do
    user node[:user]
    command "go install #{m}"
  end
end
