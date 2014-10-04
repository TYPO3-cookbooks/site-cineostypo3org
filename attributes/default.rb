default['site-cineostypo3org']['hostname'] = 'ci-neos.typo3.org'
default['site-cineostypo3org']['ssl_certificate'] = 'wildcard.typo3.org'
default['site-cineostypo3org']['favicon'] = 'typo3_and_jenkins.png'

# plugin installation didn't suceed within 60 or 180 seconds, so make it longer
default['jenkins']['executor']['timeout'] = 360
