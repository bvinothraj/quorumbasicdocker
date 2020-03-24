FROM quorumengineering/quorum:2.5.0
WORKDIR /qnode
ADD genesis.json .
ADD nodekey .
ADD enode .
ADD keystore keystore/
ADD genesis.json .
ADD pp.txt .
ADD static-nodes.json .
ADD start.sh .
EXPOSE 9501
RUN ["ls"]
RUN ["chmod", "+x", "/qnode/start.sh"]
ENTRYPOINT ["/bin/sh", "/qnode/start.sh"]