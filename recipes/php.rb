
%w[
  apt
  build-essential
  git
  vim].each{ |recipe | include_recipe recipe }

%w[
  nginx 
  php5-fpm 
  php5-cli 
  php5-mcrypt
].each {|package_name| package package_name }

