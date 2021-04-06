job "bootstrap" {
	datacenters = ["dc1"]

  #
	# bootstrap node with persistence enabled
	#
	group "bootstrap-1" {
		count = 1

		network {
			port "rpc" {
				to = 8546
			}

			port "metrics" {
				to = 13798	
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
				to = 10111	
			}
		}

		volume "distribution-bootstrap" {
			type = "host"
			read_only = true
			source = "distribution-bootstrap-common"
		}
		
		volume "persistance-.mantis" {
			type = "host"
			read_only = false
			source = "persistance-bootstrap-1-.mantis"
		}

		volume "provisioning-prometheus" {
			type = "host"
			read_only = true
			source ="provisioning-prometheus"
		}
	
		task "bootstrap-1" {
			driver = "docker"
			
			volume_mount {
				volume = "distribution-bootstrap"
				destination = "/root/mantis-dist"
				read_only = true
			}

			volume_mount {
				volume = "persistance-.mantis"
				destination ="/root/.mantis"
				read_only = false
      }

			volume_mount {
				volume = "provisioning-prometheus"
				destination = "/etc/prometheus"
				read_only = true
			}

			config {	
				hostname = "bootstrap-1"
				network_aliases = ["bootstrap-1"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "chrisatiohk/java11"
				command = "/root/mantis-dist/bin/mantis-launcher"
				args = [
					#"etc"
					#"mordor"
					#"sagano"
					"pottery"
				]
				interactive = false
			}

			resources {
				#memory = 4096
				memory = 768
				#memory = 3072
				cpu = 200
			}

			service {
				name = "bootstrap-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}

	group "bootstrap-2" {
		count = 1

		network {
			port "rpc" {
				to = 8546
			}

			port "metrics" {
				to = 13798	
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
				to = 10111	
			}
		}

		volume "distribution-bootstrap" {
			type = "host"
			read_only = true
			source = "distribution-bootstrap-common"
		}
		
		volume "persistance-.mantis" {
			type = "host"
			read_only = false
			source = "persistance-bootstrap-2-.mantis"
		}

		volume "provisioning-prometheus" {
			type = "host"
			read_only = true
			source ="provisioning-prometheus"
		}
	
		task "bootstrap-2" {
			driver = "docker"
			
			volume_mount {
				volume = "distribution-bootstrap"
				destination = "/root/mantis-dist"
				read_only = true
			}

			volume_mount {
				volume = "persistance-.mantis"
				destination ="/root/.mantis"
				read_only = false
      }

			volume_mount {
				volume = "provisioning-prometheus"
				destination = "/etc/prometheus"
				read_only = true
			}

			config {	
				hostname = "bootstrap-2"
				network_aliases = ["bootstrap-2"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "chrisatiohk/java11"
				command = "/root/mantis-dist/bin/mantis-launcher"
				args = [
					#"etc"
					#"mordor"
					#"sagano"
					"pottery"
				]
				interactive = false
			}

			resources {
				#memory = 4096
				memory = 768
				#memory = 3072
				cpu = 200
			}

			service {
				name = "bootstrap-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}

	group "bootstrap-3" {
		count = 1

		network {
			port "rpc" {
				to = 8546
			}

			port "metrics" {
				to = 13798	
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
				to = 10111	
			}
		}

		volume "distribution-bootstrap" {
			type = "host"
			read_only = true
			source = "distribution-bootstrap-common"
		}
		
		volume "persistance-.mantis" {
			type = "host"
			read_only = false
			source = "persistance-bootstrap-3-.mantis"
		}

		volume "provisioning-prometheus" {
			type = "host"
			read_only = true
			source ="provisioning-prometheus"
		}
	
		task "bootstrap-3" {
			driver = "docker"
			
			volume_mount {
				volume = "distribution-bootstrap"
				destination = "/root/mantis-dist"
				read_only = true
			}

			volume_mount {
				volume = "persistance-.mantis"
				destination ="/root/.mantis"
				read_only = false
      }

			volume_mount {
				volume = "provisioning-prometheus"
				destination = "/etc/prometheus"
				read_only = true
			}

			config {	
				hostname = "bootstrap-3"
				network_aliases = ["bootstrap-3"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "chrisatiohk/java11"
				command = "/root/mantis-dist/bin/mantis-launcher"
				args = [
					#"etc"
					#"mordor"
					#"sagano"
					"pottery"
				]
				interactive = false
			}

			resources {
				#memory = 4096
				memory = 768 
				#memory = 3072
				cpu = 200
			}

			service {
				name = "bootstrap-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}
	
	group "bootstrap-4" {
		count = 1

		network {
			port "rpc" {
				to = 8546
			}

			port "metrics" {
				to = 13798	
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
				to = 10111	
			}
		}

		volume "distribution-bootstrap" {
			type = "host"
			read_only = true
			source = "distribution-bootstrap-common"
		}
		
		volume "persistance-.mantis" {
			type = "host"
			read_only = false
			source = "persistance-bootstrap-4-.mantis"
		}

		volume "provisioning-prometheus" {
			type = "host"
			read_only = true
			source ="provisioning-prometheus"
		}
	
		task "bootstrap-4" {
			driver = "docker"
			
			volume_mount {
				volume = "distribution-bootstrap"
				destination = "/root/mantis-dist"
				read_only = true
			}

			volume_mount {
				volume = "persistance-.mantis"
				destination ="/root/.mantis"
				read_only = false
      }

			volume_mount {
				volume = "provisioning-prometheus"
				destination = "/etc/prometheus"
				read_only = true
			}

			config {	
				hostname = "bootstrap-4"
				network_aliases = ["bootstrap-4"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "chrisatiohk/java11"
				command = "/root/mantis-dist/bin/mantis-launcher"
				args = [
					#"etc"
					#"mordor"
					#"sagano"
					"pottery"
				]
				interactive = false
			}

			resources {
				#memory = 4096
				memory = 768
				#memory = 3072
				cpu = 200
			}

			service {
				name = "bootstrap-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}

	group "bootstrap-5" {
		count = 1

		network {
			port "rpc" {
				to = 8546
			}

			port "metrics" {
				to = 13798	
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
				to = 10111	
			}
		}

		volume "distribution-bootstrap" {
			type = "host"
			read_only = true
			source = "distribution-bootstrap-common"
		}
		
		volume "persistance-.mantis" {
			type = "host"
			read_only = false
			source = "persistance-bootstrap-5-.mantis"
		}

		volume "provisioning-prometheus" {
			type = "host"
			read_only = true
			source ="provisioning-prometheus"
		}
	
		task "bootstrap-5" {
			driver = "docker"
			
			volume_mount {
				volume = "distribution-bootstrap"
				destination = "/root/mantis-dist"
				read_only = true
			}

			volume_mount {
				volume = "persistance-.mantis"
				destination ="/root/.mantis"
				read_only = false
      }

			volume_mount {
				volume = "provisioning-prometheus"
				destination = "/etc/prometheus"
				read_only = true
			}

			config {	
				hostname = "bootstrap-5"
				network_aliases = ["bootstrap-5"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "chrisatiohk/java11"
				command = "/root/mantis-dist/bin/mantis-launcher"
				args = [
					#"etc"
					#"mordor"
					#"sagano"
					"pottery"
				]
				interactive = false
			}

			resources {
				#memory = 4096
				memory = 768
				#memory = 3072
				cpu = 200
			}

			service {
				name = "bootstrap-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}
}
