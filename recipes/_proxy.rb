include_recipe "nginx::default"
include_recipe "ssl_certificates"

ssl_certificate node['site-cineostypo3org']['ssl_certificate'] do
  ca_bundle_combined true
end

template "/etc/nginx/sites-available/#{node['site-cineostypo3org']['hostname']}" do
  source "nginx/nginx-site.erb"
  notifies :reload, "service[nginx]"
end

nginx_site node['site-cineostypo3org']['hostname'] do
  enable true
end
