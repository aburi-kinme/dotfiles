packages = [
  "golang-go"
]

packages.each do |p|
  package p do
    user "root"
    action :install
  end
end
