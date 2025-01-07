# get system user
node.reverse_merge!(
  user: ENV['SUDO_USER'] || ENV['USER'],
)
