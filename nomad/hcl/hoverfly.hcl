job "hoverfly" {
	datacenters = ["dc1"]

  #
	# Custom morpho client configuration
	# mining enabled
	#
	group "hoverfly" {
		count = 1

		network {
			port "proxy" {
				to = 8500
			}

			port "admin" {
				to = 8888
			}
		}

		task "hoverfly" {
			driver = "docker"
		
			config {	
				hostname = "hoverfly"
				network_aliases = ["hoverfly"]
				network_mode = "nomad_mantis"
				ports = ["proxy", "admin"]
				labels {
					hoverfly = "enabled"
				}
				image = "chrisatiohk/hoverfly"
				command = "/root/hoverfly/hoverfly"
				args = [
					"-capture",
					"-listen-on-host=0.0.0.0"
				]
				interactive = true
			}

			resources {
				memory = 512
				#memory = 2048
				cpu = 200
			}
		}
	}
}
