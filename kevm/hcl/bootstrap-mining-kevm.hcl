job "d-bootstrap-mining-kevm" {
	datacenters = ["dc1"]

  #
	# bootstrap node with persistence enabled
	#
	group "bootstrap-mining-kevm-1" {
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

		task "bootstrap-mining-kevm-1" {
			driver = "docker"
			
			config {	
				hostname = "bootstrap-mining-kevm-1"
				network_aliases = ["bootstrap-mining-kevm-1"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "bootstrap-mining-kevm-1:local"
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
				name = "bootstrap-mining-kevm-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}

	group "bootstrap-mining-kevm-2" {
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

		task "bootstrap-mining-kevm-2" {
			driver = "docker"
			
			config {	
				hostname = "bootstrap-mining-kevm-2"
				network_aliases = ["bootstrap-mining-kevm-2"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "bootstrap-mining-kevm-2:local"
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
				name = "bootstrap-mining-kevm-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}

	group "bootstrap-mining-kevm-3" {
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

		task "bootstrap-mining-kevm-3" {
			driver = "docker"
			
			config {	
				hostname = "bootstrap-mining-kevm-3"
				network_aliases = ["bootstrap-mining-kevm-3"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "bootstrap-mining-kevm-3:local"
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
				name = "bootstrap-mining-kevm-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}
	
	group "bootstrap-mining-kevm-4" {
		count = 0

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

		task "bootstrap-mining-kevm-4" {
			driver = "docker"
			
			config {	
				hostname = "bootstrap-mining-kevm-4"
				network_aliases = ["bootstrap-mining-kevm-4"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "bootstrap-mining-kevm-4:local"
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
				name = "bootstrap-mining-kevm-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}

	group "bootstrap-mining-kevm-5" {
		count = 0

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

		task "bootstrap-mining-kevm-5" {
			driver = "docker"
			
			config {	
				hostname = "bootstrap-mining-kevm-5"
				network_aliases = ["bootstrap-mining-kevm-5"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "bootstrap-mining-kevm-5:local"
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
				name = "bootstrap-mining-kevm-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}
}
