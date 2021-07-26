'use strict';

const { WorkloadModuleBase } = require('@hyperledger/caliper-core');

class MyWorkload extends WorkloadModuleBase {
    async submitTransaction() {
        let requestsSettings = [{
            contract: 'myerc20',
            verb: 'transfer',
            args: ['0x0caf9db73edd872303d2b493a55adf7eee767a87', 1]
        }];

        await this.sutAdapter.sendRequests(requestsSettings);
    }
}

function createWorkloadModule() {
    return new MyWorkload();
}

module.exports.createWorkloadModule = createWorkloadModule;
