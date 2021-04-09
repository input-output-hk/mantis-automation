job "d-infra" {
	datacenters = ["dc1"]

	#
	# Consul for service registry, discovery and service mesh
	#	
	group "consul" {
    count = 1

    task "consul" {
      driver = "raw_exec"


      config {
        command = "consul"
        args = ["agent", "-dev", "-ui", "-client=0.0.0.0"]
      }

      artifact {
        source = "https://releases.hashicorp.com/consul/1.9.3/consul_1.9.3_linux_amd64.zip"
      }
    }
  }

	#
	# Prometheus for db
	#
	group "prometheus" {
		count = 1

		network {
			port "prometheus" {
				to = 9090 
			}
		}

		volume "provisioning-prometheus" {
			type = "host"
			read_only = true
			source ="provisioning-prometheus"
		}

		task "client" {
			driver = "docker"
	
			volume_mount {
				volume = "provisioning-prometheus"
				destination = "/etc/prometheus"
				read_only = true
			}
	
			config {	
				hostname = "prometheus"
				network_aliases = ["prometheus"]
				network_mode = "nomad_mantis"
				ports = ["prometheus"]
				labels {
					purpose = "prometheus"
				}
				image = "prom/prometheus"
				interactive = false
			}

			resources {
				memory = 256
				cpu = 200
			}

			service {
				name = "prometheus"
				port = "prometheus"
			}
		}
	}


	#
	# Grafana for dashboards
	#
	group "grafana" {
		count = 1

		network {
			port "ui" {
				to = 3001
			}
		}

		volume "provisioning-grafana" {
			type = "host"
			read_only = true
			source ="provisioning-grafana"
		}

		task "client" {
			driver = "docker"
	
			env {
				GF_SECURITY_ADMIN_USER	=	"admin"
				GF_SECURITY_ADMIN_PASSWORD	=	"admin"
				GF_USERS_ALLOW_SIGN_UP	=	"false"
				GF_SERVER_HTTP_PORT	=	"3001"
			}	

			volume_mount {
				volume = "provisioning-grafana"
				destination = "/etc/grafana/provisioning"
				read_only = true
			}
	
			config {	
				hostname = "grafana"
				network_aliases = ["grafana"]
				network_mode = "nomad_mantis"
				ports = ["ui"]
				labels {
					purpose = "grafana"
				}
				image = "grafana/grafana"
				interactive = false
			}

			resources {
				memory = 256
				cpu = 200
			}

			service {
				name = "ui"
				port = "ui"
			}
		}
	}

	group "explorer" {
		count = 1

		network {
			port "explorer" {
				to = 3000 
			}
		}

		task "explorer" {
			driver = "docker"
		
			env {
				CONSUL_HOST = "e2e"
				CONSUL_SERVICE = "bootstrap-rpc"
			}	

			config {	
				hostname = "explorer"
				network_aliases = ["explorer"]
				network_mode = "nomad_mantis"
				ports = ["explorer"]
				labels {
					mining = "explorer"
				}
				image = "explorer:local"
				entrypoint = ["/root/startup.sh"]
				interactive = false
			}


			resources {
				memory = 762
				cpu = 200
			}

			service {
				name = "explorer"
				port = "explorer"
			}
		}
	}
	
	#
	# Custom mantis client configuration
	# faucet
	#
	group "faucet" {
		count = 0

		network {
			port "rpc" {
				to = 8546
			}

			# only for the "docker ps --no-trunc" output command	
			# to be able to distinguish between containers based on same image
			# since nomad container naming is not working on my host
			# bits:	1st - always 1
			#				2nd - faucet
			#				3tr - prometheus
			#				4th - mining
			#				5th - bootstrap
			port "nonce" {
				to = 11000
			}
		}

		volume "distribution-faucet" {
			type = "host"
			read_only = true
			source = "distribution-faucet"
		}

		volume "provisioning-faucet" {
			type = "host"
			read_only = true
			source = "provisioning-faucet"
		}

		task "faucet" {
			driver = "docker"
			
			volume_mount {
				volume = "distribution-faucet"
				destination = "/root/mantis-dist"
				read_only = true
			}

			volume_mount {
				volume = "provisioning-faucet"
				destination = "/root/keystore"
				read_only = true
			}

			config {	
				hostname = "faucet"
				network_aliases = ["faucet"]
				network_mode = "nomad_mantis"
				ports = ["nonce"]
				labels {
					faucet = "enabled"
				}
				image = "java11:local"
				command = "/root/mantis-dist/bin/faucet-server"
				interactive = false
			}


			resources {
				memory = 512
				cpu = 200
			}
		}
	}
}
