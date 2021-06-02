'use strict';

const { WorkloadModuleBase } = require('@hyperledger/caliper-core');

class MyWorkload extends WorkloadModuleBase {
    async submitTransaction() {
        let requestsSettings = [{
            contract: 'hello',
            verb: 'message',
            args: []
        }];

        await this.sutAdapter.sendRequests(requestsSettings);
    }
}

function createWorkloadModule() {
    return new MyWorkload();
}

module.exports.createWorkloadModule = createWorkloadModule;