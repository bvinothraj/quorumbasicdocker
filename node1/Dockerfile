FROM quorumengineering/quorum:2.5.0
WORKDIR /root/nodedata
ADD nodekey .
ADD enode .
ADD keystore keystore/
ADD genesis.json .
ADD pp.txt .
ADD static-nodes.json .
ADD start.sh .
EXPOSE 9501
RUN ["chmod", "+x", "/root/nodedata/start.sh"]
ENTRYPOINT ["/bin/sh", "/root/nodedata/start.sh"]