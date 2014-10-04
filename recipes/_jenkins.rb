include_recipe "jenkins::master"
# This makes it use Jenkins LTS:
r = resources("apt_repository[jenkins]")
r.uri 'http://pkg.jenkins-ci.org/debian-stable'
r.key 'http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key'

#plugins
jenkins_plugin 'ansicolor'

jenkins_plugin 'cloverphp'
jenkins_plugin 'pmd'
jenkins_plugin 'xunit'

jenkins_plugin 'build-timeout'
jenkins_plugin 'build-name-setter'
jenkins_plugin 'analysis-collector'
jenkins_plugin 'gerrit-trigger'
jenkins_plugin 'gravatar'
jenkins_plugin 'greenballs'
jenkins_plugin 'scp'
jenkins_plugin 'ircbot'
jenkins_plugin 'sauce-ondemand'
jenkins_plugin 'mask-passwords'
jenkins_plugin 'measurement-plots'

#TODO: favicon plugin
#TODO: jenkins-jira-plugin
#hopefully not needed...
#jenkins_plugin 'redmine'

jenkins_plugin 'subversion' do
  action :disable
end
jenkins_plugin 'translation' do
  action :disable
end


