include_recipe "jenkins::master"
# This makes it use Jenkins LTS:
r = resources("apt_repository[jenkins]")
r.uri 'http://pkg.jenkins-ci.org/debian-stable'
r.key 'http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key'
