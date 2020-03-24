#!/bin/sh
if [[ ! -d "tm" ]]; then
	mkdir tm
	mv txnode1.key tm/txnode1.key
	mv txnode1.pub tm/txnode1.pub
fi

ls
echo "Launching tessera..."
java -jar /tessera/tessera-app.jar -configfile config.json >> tessera.log 2>&1