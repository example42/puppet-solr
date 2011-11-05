# Puppet module: solr

This module installs the solr web application.
You need to configure separately the Web or Application Server that is going to host solr


## USAGE - Basic management
* Install solr with default settings

        class { "solr": }

* Disable solr service.

        class { "solr":
          disable => true,
        }

* Disable solr service at boot time, but don't stop if is running.

        class { "solr":
          disableboot => true,
        }

* Remove solr package

        class { "solr":
          absent => true,
        }

* Define solr installation method: Valid values for install => are "package" (default), "source" and puppi.

        class { "solr":
          install => "source",
        }

* Install source from a custom url to a custom install_destination path.
  The following parameters apply both for "source" and "puppi" install methods.
  Puppi method may be used to manage deployment updates (given the $install_source is updated).
  By default install_source is set to upstream developer and install_destination to Web (App) server document root
  Pre and post installation commands may be already defined (check solr/manifests/params.pp) override them only if needed.
  Url_check and url_pattern are used for application checks, if monitor is enabled. Override only if needed.

        class { "solr":
          install             => "source",
          install_source      => "http://deploy.example42.com/solr/solr.tar.gz",
          install_destination => "/opt/apps/",
          # install_precommand  => "...",
          # install_postcommand => "...",
          # url_check           => "...",
          # url_pattern         => "...",
        }



## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { "solr":
          source => [ "puppet:///modules/lab42/solr/solr.conf-$hostname" , "puppet:///modules/lab42/solr/solr.conf" ], 
        }

* Use custom template for main config file 

        class { "solr":
          template => "example42/solr/solr.conf.erb",      
        }

* Define custom options that can be used in a custom template without the
  need to add parameters to the solr class

        class { "solr":
          template => "example42/solr/solr.conf.erb",    
          options  => {
            'LogLevel' => 'INFO',
            'UsePAM'   => 'yes',
          },
        }

* Automaticallly include a custom subclass

        class { "solr:"
          my_class => 'lab42::solr',
        }


## USAGE - Example42 extensions management 
* Activate puppi (reccomended, but disabled by default)
  Note that this option requires the usage of Example42 puppi module

        class { "solr": 
          puppi    => true,
        }

* Activate automatic monitoring (reccomended, but disabled by default)
  This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { "solr":
          monitor      => true,
          monitor_tool => [ "nagios" , "monit" , "munin" ],
        }

* Activate automatic firewalling 
  This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { "solr":       
          firewall      => true,
          firewall_tool => "iptables",
          firewall_src  => "10.42.0.0/24",
          firewall_dst  => "$ipaddress_eth0",
        }


