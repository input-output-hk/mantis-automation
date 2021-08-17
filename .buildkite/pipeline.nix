{ cfg, pkgs, ... }:

with cfg.steps.commands;
let 
	commonAttrs = {
		agents.host = "e2e.mantis.ws";
	};
in
{
	steps.commands = {
		prepareCaliper = commonAttrs // {
			label = "prepare caliper";
			command = ''
				cd performance/caliper
				./prepare.sh
			'';
			retry.automatic = false;
		};

		prepareSmartContractSetup = commonAttrs // {
			label = "prepare Smart Contract setup";
			dependsOn = [ prepareCaliper ];
			command = ''
				cd smartcontract/hello
				npm install
			'';
			retry.automatic = false;
		};

		prepareTestRun = commonAttrs //{
			label = "prepate Test Run";
			dependsOn = [ prepareSmartContractSetup ];
			command = ''
				cd ../../networks/sagano
				./prepare_run.sh
			'';
			retry.automatic = false;
		};

		setupAccount = commonAttrs // {
			label = "setup Account";
			dependsOn = [ prepareTestRun ];
			command = ''
				./setup_account.sh
			'';
			retry.automatic = false;
		};

		runTest = commonAttrs // {
			label = "run test";
			dependsOn = [ setupAccount ];
			command = ''
				./run.sh
			'';
			retry.automatic = false;
		};
	};
}
