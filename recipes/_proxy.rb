include_recipe "nginx::default"
include_recipe "ssl_certificates"

ssl_certificate node['site-cineostypo3org']['ssl_certificate'] do
  ca_bundle_combined true
end

template "/etc/nginx/sites-available/#{node['site-cineostypo3org']['hostname']}" do
  source "nginx/nginx-site.erb"
  notifies :reload, "service[nginx]"
  variables(
    :ssl_certfile => node['ssl_certificates']['path'] + "/" + node['site-cineostypo3org']['ssl_certificate'] + ".crt",
	:ssl_keyfile  => node['ssl_certificates']['path'] + "/" + node['site-cineostypo3org']['ssl_certificate'] + ".key"
  )
end

nginx_site 'default' do
  enable false
end

nginx_site node['site-cineostypo3org']['hostname'] do
  enable true
end
