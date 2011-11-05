# Class: solr::params
#
# This class defines default parameters used by the main module class solr
# Operating Systems differences in names and paths are addressed here 
#
# == Variables
# 
# Refer to solr class for the variables defined here.
#
# == Usage 
# 
# This class is not intended to be used directly. It may be imported or inherited by other classes
#
class solr::params {

  # Default installation type depends on OS package availability
  $install = $operatingsysten ? {
    /(?i:Ubuntu)/ => "package",
    default       => "source",
  }

  $install_source = "http://www.apache.org/dist/lucene/solr/${solr::install_version}/apache-solr-${solr::install_version}.tgz"

  # This is the latest version at module creation time, can be overriden
  $install_version = "3.4.0"

 
  $install_destination = $operatingsystem ? {
    default                   => "/opt/solr",
  }

  $install_precommand  = ""

  $install_postcommand = ""

  $url_check           = "${fqdn}/solr"

  $url_pattern         = "Welcome to Solr!"

  $package = $operatingsystem ? {
    /(?i:Ubuntu)/ => "solr-tomcat",
    default => "solr",
  }

  $config_dir = $operatingsystem ? {
    default => "/etc/solr/conf",
  }

  $config_file = $operatingsystem ? {
    default => "/etc/solr/conf/solrconfig.xml",
  } 

  $config_file_mode = $operatingsystem ? { 
    default => "0644",
  }

  $config_file_owner = $operatingsystem ? {
    default => "root",
  }

  $config_file_group = $operatingsystem ? {
    default => "root",
  }

  $data_dir = $operatingsystem ? {
    default => "/var/lib/solr",
  }

  $log_dir = $operatingsystem ? {
    default => "/var/log",
  }

  $log_file = $operatingsystem ? {
    default => "/var/log/solr.log",
  }

}
