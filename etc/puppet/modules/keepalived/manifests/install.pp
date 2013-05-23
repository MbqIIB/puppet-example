class keepalived::install {
	package {
		"keepalived":
		    ensure => installed,
		    require => Yum::Repo::Conf["epel"],
	}

	iptables {
		"multicast":
			destination => "224.0.0.0/8",
			jump        => "ACCEPT";

		"vrrp_input":
			proto       => "vrrp",
			chain       => "INPUT",
			jump        => "ACCEPT";

		"vrrp_output":
			proto       => "vrrp",
			chain       => "OUTPUT",
			jump        => "ACCEPT";
	}
}