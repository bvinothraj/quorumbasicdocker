#!/bin/sh

if [[ ! -d "data" ]]; then
	echo "Initializing chain..."
	mkdir data
	mv keystore data/keystore
	mv nodekey data/nodekey
	mv static-nodes.json data/static-nodes.json
	geth --datadir data init genesis.json
else
	echo "Already initialized...starting up..."
fi

# TODO: find a way to check txnode rather than explicit wait
echo "Waiting for transaction node to launch (50 sec)..."
sleep 50

echo "Launching geth..."
PRIVATE_CONFIG=/qtxnode1/tm/tm.ipc nohup geth \
	--datadir data \
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
	--port 31000 \
	--unlock 0 \
	--password pp.txt