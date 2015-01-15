ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

Vagrant.configure(2) do |config|
  config.vm.define "exercism" do |node|
    node.vm.provider "docker" do |dock|
      dock.build_dir = "."
      dock.build_args = ["-t=exercism"]
      dock.ports = ["4567:4567"]
      dock.name = "exercism"
      dock.remains_running = true
      dock.cmd = ["foreman", "start"]
    end
  end
end
