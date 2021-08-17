{ cfg, pkgs, ... }:

with cfg.steps.commands;
let 
	commonAttrs = {
		agents.host = "e2e.mantis.ws";
	};
in
{
	steps.commands = {
		runTests = commonAttrs // {
			label = "run tests";
			command = ''
				cd performance/caliper
				./prepare.sh
				cd smartcontract/hello
				npm install
				cd ../../networks/sagano
				./prepare_run.sh
				./setup_account.sh
				./run.sh
			'';
			retry.automatic = false;
		};
	};
}
