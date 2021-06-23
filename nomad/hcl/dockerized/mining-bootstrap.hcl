job "d-mining-bootstrap" {
	datacenters = ["dc1"]

  #
	# bootstrap node with persistence enabled
	#
	group "mining-bootstrap-1" {
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

		task "mining-bootstrap-1" {
			driver = "docker"
			
			config {	
				hostname = "mining-bootstrap-1"
				network_aliases = ["mining-bootstrap-1"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "mining-bootstrap-1:local"
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
				memory = 6144
				#memory = 768
				#memory = 3072
				cpu = 200
			}

			service {
				name = "mining-bootstrap-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}

	group "mining-bootstrap-2" {
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

		task "mining-bootstrap-2" {
			driver = "docker"
			
			config {	
				hostname = "mining-bootstrap-2"
				network_aliases = ["mining-bootstrap-2"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "mining-bootstrap-2:local"
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
				memory = 6144
				#memory = 768
				#memory = 3072
				cpu = 200
			}

			service {
				name = "mining-bootstrap-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}

	group "mining-bootstrap-3" {
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

		task "mining-bootstrap-3" {
			driver = "docker"
			
			config {	
				hostname = "mining-bootstrap-3"
				network_aliases = ["mining-bootstrap-3"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "mining-bootstrap-3:local"
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
				memory = 6144
				#memory = 768 
				#memory = 3072
				cpu = 200
			}

			service {
				name = "mining-bootstrap-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}
	
	group "mining-bootstrap-4" {
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

		task "mining-bootstrap-4" {
			driver = "docker"
			
			config {	
				hostname = "mining-bootstrap-4"
				network_aliases = ["mining-bootstrap-4"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "mining-bootstrap-4:local"
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
				memory = 6144
				#memory = 768
				#memory = 3072
				cpu = 200
			}

			service {
				name = "mining-bootstrap-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}

	group "mining-bootstrap-5" {
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

		task "mining-bootstrap-5" {
			driver = "docker"
			
			config {	
				hostname = "mining-bootstrap-5"
				network_aliases = ["mining-bootstrap-5"]
				network_mode = "nomad_mantis"
				ports = ["rpc", "metrics", "nonce"]
				labels {
					mining = "enabled"
				}
				image = "mining-bootstrap-5:local"
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
				memory = 6144
				#memory = 768
				#memory = 3072
				cpu = 200
			}

			service {
				name = "mining-bootstrap-rpc"
				port = "rpc"
			}
			
			service {
				name = "metrics"
				port = "metrics"
			}
		}
	}
}
