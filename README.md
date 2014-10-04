# site-cineostypo3org-cookbook

This cookbook installs/conigures Jenkins for ci-neos.typo3.org

## Supported Platforms

The box runs Debian-7.6

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['site-cineostypo3org']['hostname']</tt></td>
    <td>String</td>
    <td>The default hostname</td>
    <td><tt>ci-neos.typo3.org</tt></td>
  </tr>
  <tr>
    <td><tt>['site-cineostypo3org']['ssl_certificate']</tt></td>
    <td>String</td>
    <td>The ssl certificates used (from [ssl_certificates](https://github.com/TYPO3-cookbooks/ssl_certificates) and defined in data_bags/certificates)</td>
    <td><tt>wildcard.typo3.org</tt></td>
  </tr>
  <tr>
    <td><tt>['site-cineostypo3org']['favicon']</tt></td>
    <td>String</td>
    <td>Filename of the favicon image in files/</td>
    <td><tt>typo3-and-jenkins.png</tt></td>
  </tr>
</table>

## Usage

### site-cineostypo3org::default

#### Requirements

1. VirtualBox
2. [ChefDK](http://downloads.getchef.com/chef-dk/)

    * Yes, this is annoying. But the vagrant-berkshelf plugin refuses to work without it. If you're on one of the
    chef-dk "official" operating systems, follow their instructions. If not, then the getchef website won't know what to
    do with you, so you'll have to click "stop" about 10 times before you can access the page. Then, manually unpack and
    install whichever version will work best on your machine. Also, for Gentoo users, be sure to unset RUBY_OPT or
    you'll get a nasty error: 'auto_gem (LoadError)'
    
3. vagrant with these vagrant plugins:

    * vagrant-cachier
    * vagrant-omnibus
    * vagrant-berkshelf

4. Use the "kitchen" command provided in ChefDK (possibly by adding /opt/chefdk/bin to the path)

#### Setup Overview

```bash
vagrant plugin install vagrant-cachier
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-berkshelf

kitchen converge
```

#### Access Jenkins Box

By default nginx should forward http to https, but it uses the ci-neos.typo3.org address in the redirect.

Then, nginx acts as a proxy in front of Jenkins.

* https://192.168.42.42 -> should show Jenkins
* http://192.168.42.42:8080 -> This is the unencrypted view of Jenkins
* http://192.168.42.42 -> forwards to https://ci-neos.typo3.org

Some other helpful commands include:

```
# Update the vm with any changes in vm config
kitchen converge

# Start a shell (instead of `vagrant ssh`)
kitchen login

# Get rid of the vm
kitchen destroy
```

## License and Authors

Author:: Jacob Floyd (cognifloyd@gmail.com)
Author:: Steffen Gebert (cognifloyd@gmail.com)
