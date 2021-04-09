job "d-morpho" {
	datacenters = ["dc1"]

  #
	# checkpointing node with persistence enabled
	#
	group "checkpointing-1" {
		count = 1

		network {

			port "metrics" {
        to = 13788
      }

			# only for the "docker ps --no-trunc" output command	
			# to be able to distinguish between containers based on same image
			# since nomad container naming is not working on my host
			# bits:	1st - 1 for mantis, 2 for morpho
			#				2nd - faucet 
			#				3tr - prometheus
			#				4th - mining
			#				5th - bootstrap
			port "nonce" {
				to = 20000	
			}
		}

		task "checkpointing-1" {
			driver = "docker"
		
			env {
				#HTTP_PROXY = "hoverfly:8500"
			}
	
			config {	
				hostname = "checkpointing-1"
				network_aliases = ["morpho-1"]
				network_mode = "nomad_mantis"
				ports = ["nonce"]
				labels {
					checkpointing = "enabled"
				}
				image = "morpho-1:local"
				command = "/root/morpho-common/sbin/run_morpho.sh"
				interactive = false
			}

			resources {
				#memory = 4096
				#memory = 512
				memory = 128
				cpu = 200
			}

			service {
        name = "metrics"
        port = "metrics"
      }
		}
	}

	group "checkpointing-2" {
		count = 1

		network {

			port "metrics" {
        to = 13788
      }

			# only for the "docker ps --no-trunc" output command	
			# to be able to distinguish between containers based on same image
			# since nomad container naming is not working on my host
			# bits:	1st - 1 for mantis, 2 for morpho 
			#				2nd - faucet 
			#				3tr - prometheus
			#				4th - mining
			#				5th - bootstrap
			port "nonce" {
				to = 20000	
			}
		}

		task "checkpointing-2" {
			driver = "docker"
			
			env {
				#HTTP_PROXY = "hoverfly:8500"
			}

			config {	
				hostname = "checkpointing-2"
				network_aliases = ["morpho-2"]
				network_mode = "nomad_mantis"
				ports = ["nonce"]
				labels {
					checkpointing = "enabled"
				}
				image = "morpho-2:local"
				command = "/root/morpho-common/sbin/run_morpho.sh"
				interactive = false
			}

			resources {
				#memory = 4096
				#memory = 512
				memory = 128
				cpu = 200
			}
			
			service {
        name = "metrics"
        port = "metrics"
      }
		}
	}

	group "checkpointing-3" {
		count = 1

		network {

			port "metrics" {
        to = 13788
      }

			# only for the "docker ps --no-trunc" output command	
			# to be able to distinguish between containers based on same image
			# since nomad container naming is not working on my host
			# bits:	1st - 1 for mantis, 2 for morpho
			#				2nd - faucet 
			#				3tr - prometheus
			#				4th - mining
			#				5th - bootstrap
			port "nonce" {
				to = 20000	
			}
		}

		task "checkpointing-3" {
			driver = "docker"
			
			env {
				#HTTP_PROXY = "hoverfly:8500"
			}

			config {	
				hostname = "checkpointing-3"
				network_aliases = ["morpho-3"]
				network_mode = "nomad_mantis"
				ports = ["nonce"]
				labels {
					checkpointing = "enabled"
				}
				image = "morpho-3:local"
				command = "/root/morpho-common/sbin/run_morpho.sh"
				interactive = false
			}

			resources {
				#memory = 4096
				#memory = 512
				memory = 128
				cpu = 200
			}
			
			service {
        name = "metrics"
        port = "metrics"
      }
		}
	}
	
	group "checkpointing-4" {
		count = 1

		network {

			port "metrics" {
        to = 13788
      }

			# only for the "docker ps --no-trunc" output command	
			# to be able to distinguish between containers based on same image
			# since nomad container naming is not working on my host
			# bits:	1st - 1 for mantis, 2 for morpho
			#				2nd - faucet 
			#				3tr - prometheus
			#				4th - mining
			#				5th - bootstrap
			port "nonce" {
				to = 20000	
			}
		}

		task "checkpointing-4" {
			driver = "docker"
			
			env {
				#HTTP_PROXY = "hoverfly:8500"
			}

			config {	
				hostname = "checkpointing-4"
				network_aliases = ["morpho-4"]
				network_mode = "nomad_mantis"
				ports = ["nonce"]
				labels {
					checkpointing = "enabled"
				}
				image = "morpho-4:local"
				command = "/root/morpho-common/sbin/run_morpho.sh"
				interactive = false
			}

			resources {
				#memory = 4096
				#memory = 512
				memory = 128
				cpu = 200
			}

			service {
        name = "metrics"
        port = "metrics"
      }
		}
	}

	group "checkpointing-5" {
		count = 1

		network {

			port "metrics" {
        to = 13788
      }

			# only for the "docker ps --no-trunc" output command	
			# to be able to distinguish between containers based on same image
			# since nomad container naming is not working on my host
			# bits:	1st - 1 for mantis, 2 for morpho
			#				2nd - faucet 
			#				3tr - prometheus
			#				4th - mining
			#				5th - bootstrap
			port "nonce" {
				to = 20000	
			}
		}

		task "checkpointing-5" {
			driver = "docker"
			
			env {
				#HTTP_PROXY = "hoverfly:8500"
			}

			config {	
				hostname = "checkpointing-5"
				network_aliases = ["morpho-5"]
				network_mode = "nomad_mantis"
				ports = ["nonce"]
				labels {
					checkpointing = "enabled"
				}
				image = "morpho-5:local"
				command = "/root/morpho-common/sbin/run_morpho.sh"
				interactive = false
			}

			resources {
				#memory = 4096
				#memory = 512
				memory = 128
				cpu = 200
			}

			service {
        name = "metrics"
        port = "metrics"
      }
		}
	}
}