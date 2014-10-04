include_recipe "jenkins::master"
# This makes it use Jenkins LTS:
r = resources("apt_repository[jenkins]")
r.uri 'http://pkg.jenkins-ci.org/debian-stable'
r.key 'http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key'

#plugins
#hopefully not needed...
#redmine
%w{
ansicolor
cloverphp
pmd
xunit
build-timeout
build-name-setter
analysis-collector
gerrit-trigger
gravatar
greenballs
scp
ircbot
sauce-ondemand
mask-passwords
measurement-plots
}.each do | plugin |
  jenkins_plugin plugin do
    notifies :restart, 'service[jenkins]'
  end
end
  
#TODO: favicon plugin

jenkins_plugin 'subversion' do
  action :disable
  notifies :restart, 'service[jenkins]'
end
jenkins_plugin 'translation' do
  action :disable
  notifies :restart, 'service[jenkins]'
end

jenkins_jira_plugin_version = '1.4.7'
jenkins_plugin 'jenkins-jira-plugin' do
  source "http://repository.marvelution.com/content/repositories/releases/com/marvelution/jira/plugins/jenkins-jira-plugin/#{jenkins_jira_plugin_version}/jenkins-jira-plugin-#{jenkins_jira_plugin_version}.hpi"
  notifies :restart, 'service[jenkins]'
end

