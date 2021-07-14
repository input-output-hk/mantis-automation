job "d-passive-kevm" {
	datacenters = ["dc1"]

  #
	# Custom morpho client configuration
	# mining enabled
	#
	group "passive-kevm" {
		count = 2

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

		task "mantis-client-passive-kevm" {
			driver = "docker"
		
			config {	
				hostname = "passive-kevm"
				network_aliases = ["${NOMAD_TASK_NAME}-${NOMAD_ALLOC_INDEX}"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "passive-kevm:local"
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
				memory = 4096
				#memory = 2048
				#memory = 1024
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
