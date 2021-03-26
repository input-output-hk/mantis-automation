job "miner" {
	datacenters = ["dc1"]

  #
	# Custom morpho client configuration
	# mining enabled
	#
	group "miner-enabled" {
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
				to = 10110
			}
		}

		volume "distribution-miner-enabled" {
			type = "host"
			read_only = true
			source ="distribution-miner-enabled"
		}

		volume "provisioning-prometheus" {
			type = "host"
			read_only = true
			source ="provisioning-prometheus"
		}
	
		#volume "provisioning-ethash" {
		#	type = "host"
			#read_only = true
		#	source ="provisioning-ethash-1"
		#}

		task "mantis-client-miner-enabled" {
			driver = "docker"
		
			volume_mount {
				volume = "distribution-miner-enabled"
				destination = "/root/mantis-dist"
				read_only = true
			}

			volume_mount {
				volume = "provisioning-prometheus"
				destination = "/etc/prometheus"
				read_only = true
			}

		#	volume_mount {
		#		volume = "provisioning-ethash"
		#		destination = "/root/.ethash"
				#read_only = true
		#	}
	
			config {	
				hostname = "miner-enabled"
				network_aliases = ["${NOMAD_TASK_NAME}-${NOMAD_ALLOC_INDEX}"]
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
				interactive = true
			}

			resources {
				memory = 3072
				#memory = 2048
				cpu = 200
			}

			service {
				name = "rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}
}