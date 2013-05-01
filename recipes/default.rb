packages = case node[:platform_family]
when "debian"
  %w{curl automake1.9 libxml2-dev texinfo autoconf re2c git}
when "rhel"
  %w{libxml2-devel texinfo autoconf re2c git}
end

packages.each do |pkg|
  package pkg do
    action :install
  end
end
