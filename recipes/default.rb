%w(libxml2-devel texinfo autoconf re2c).each do |pkg|
  package pkg do
    action :install
  end
end
