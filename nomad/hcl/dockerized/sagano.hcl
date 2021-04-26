job "sagano" {
	datacenters = ["dc1"]

  #
	# Custom morpho client configuration
	# mining enabled
	#
	group "sagano" {
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
				to = 10100
			}
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

		task "mantis-client-passive" {
			driver = "docker"
		
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
				hostname = "sagano"
				network_aliases = ["${NOMAD_TASK_NAME}-${NOMAD_ALLOC_INDEX}"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "passive:local"
				command = "/root/mantis-dist/bin/mantis-launcher"
				args = [
					#"etc"
					#"mordor"
					"sagano"
					#"pottery"
				]
				interactive = true
			}

			resources {
				#memory = 3072
				#memory = 2048
				memory = 1024
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
