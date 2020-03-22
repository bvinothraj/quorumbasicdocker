#!/bin/sh

#if [[ ! -e "./nodedata/genesis.json" && ! -d "./nodedata/geth/chaindata" ]]; then
if [[ ! -e "./node/genesis.json" ]]; then
	echo "Initializing chain..."
	mkdir node
	mkdir node/keystore
	mkdir node/geth
	cp keystore/* node/keystore
	cp nodekey node/nodekey
	cp genesis.json node/genesis.json
	cp static-nodes.json node/static-nodes.json

	geth --datadir node init node/genesis.json
else
	echo "Already initialized...starting up..."
fi

echo "Launching geth..."
PRIVATE_CONFIG=ignore nohup geth \
	--datadir node \
	--nodiscover \
	--verbosity 5 \
	--networkid 12345 \
	--raft \
	--raftport 50401 \
	--rpc \
	--rpcaddr 0.0.0.0 \
	--rpcport 9501 \
	--rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft \
	--emitcheckpoints \
	--port 21000 >> node.log 2>&1