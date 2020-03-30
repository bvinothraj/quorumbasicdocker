#!/bin/sh
if [[ ! -d "tm" ]]; then
	mkdir tm
	mv txnode1.key tm/txnode1.key
	mv txnode1.pub tm/txnode1.pub
fi

# Remove tm.ipc if already present
# else tessera will not launch
if[[ -e "/tm/tm.ipc"]]; then
	echo "Removing tm.ipc file..."
	rm tm/tm.ipc
fi

echo "Launching tessera..."
java -jar /tessera/tessera-app.jar -configfile config.json >> tessera.log 2>&1