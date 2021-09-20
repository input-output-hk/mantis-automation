package main

import (
	"context"
	"time"

	"github.com/ethereum/go-ethereum/ethclient"
	"github.com/ethereum/hive/hivesim"
)

func main() {
	suite := hivesim.Suite{
		Name:        "obft-simulator",
		Description: "This suite tests the obft protocol",
	}
	suite.Add(hivesim.TestSpec{
		Name:        "run 2 clients",
		Description: "this test launches 2 clients",
		Run:         runOBFTTest,
	})
	hivesim.MustRunSuite(hivesim.New(), suite)
}

func runOBFTTest(t *hivesim.T) {
	clientBootstrap := t.StartClient("mantis", hivesim.StartOption(hivesim.Params{
		"HIVE_MINER":    "00011abc",
		"HIVE_LOGLEVEL": "5",
	}))
	enodeURL, err := clientBootstrap.EnodeURL()
	if err != nil {
		t.Fatal("can't get client enode URL:", err)
	} else {
		t.Logf("bootstrap enode URL %s", enodeURL)
	}
	clientSecond := t.StartClient("mantis", hivesim.StartOption(hivesim.Params{
		"HIVE_MINER":    "00011abc",
		"HIVE_LOGLEVEL": "5",
		"HIVE_BOOTNODE": enodeURL,
	}))

	for true {
		t.Log("getting block")
		myEthClient := ethclient.NewClient(clientSecond.RPC())
		ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
		block, err := myEthClient.HeaderByNumber(ctx, nil)
		if err != nil {
			t.Log("error getting block")
		} else {
			t.Logf("new head %d", block.Number.Uint64())
		}
		time.Sleep(10 * time.Second)
	}
}
