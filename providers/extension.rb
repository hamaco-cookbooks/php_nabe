action :install do
  converge_by("Install extension #{new_resource.name}") do
    bash "php-nabe ext-install #{new_resource.name}" do
      user new_resource.user
      environment "HOME" => "#{node["php-nabe"]["user_home_root"]}/#{new_resource.user}"

      code <<-EOH
        current_version=`cat $HOME/app/php-nabe/current`
        $HOME/app/php-nabe/php-nabe use #{new_resource.version}
        $HOME/app/php-nabe/php-nabe ext-install #{new_resource.name}
        $HOME/app/php-nabe/php-nabe use $current_version
      EOH

      not_if "#{node["php-nabe"]["user_home_root"]}/#{new_resource.user}/app/php-nabe/build/php-#{new_resource.version}/bin/php #{node["php-nabe"]["user_home_root"]}/#{new_resource.user}/app/php-nabe/lib/listext.php | grep #{new_resource.name}"
    end
  end
end