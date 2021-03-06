SWIFT_URL = 'https://swift.org/builds/swift-5.0-release/ubuntu1604/swift-5.0-RELEASE/swift-5.0-RELEASE-ubuntu16.04.tar.gz'.freeze
SWIFT_PATH = SWIFT_URL.split('/')[-1].split('.')[0..2].join('.').freeze
ARCHIVE = 'swift.tar.gz'.freeze
USER_NAME = 'vagrant'.freeze
SWIFT_HOME = "/home/#{USER_NAME}/#{SWIFT_PATH}".freeze

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  
  config.vm.provision "shell", inline: <<-SHELL

  export DEBIAN_FRONTEND=noninteractive

  ## Install swift prerequisites
  echo "Installing prerequisites"
  sudo apt-get -qq update && sudo apt-get upgrade -y
  sudo apt-get install -y clang \
    libpython2.7 \
    curl \
    libcurl3
  
  ## Download Swift
  if [ ! -d "#{SWIFT_PATH}" ]; then
    echo "Downloading Swift"
    curl -s -o "#{ARCHIVE}" "#{SWIFT_URL}"

    ## Unpack archive
    tar zxf "#{ARCHIVE}"

    ## change swift file ownership
    chown -R "#{USER_NAME}" "#{SWIFT_PATH}"

    ## Remove archive
    rm "#{ARCHIVE}"
  fi
  
  ## Export Swift bin to PATH
  if [ $(grep -c "#{SWIFT_PATH}" .profile) -eq 0 ]; then
    echo "Adding swift to path"
    echo 'SWIFT_HOME="#{SWIFT_HOME}"' >> .profile
    echo 'PATH="$SWIFT_HOME/usr/bin:$PATH"' >> .profile
    source .profile
  fi
  
  echo "Swift finished install on Linux"
  SHELL
end
