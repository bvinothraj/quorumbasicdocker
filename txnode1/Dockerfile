FROM quorumengineering/tessera:0.10.4
WORKDIR /qtxnode
ADD config.json .
ADD starttx.sh .
ADD txnode1.key .
ADD txnode1.pub .
ADD pass.txt .
EXPOSE 9001 9081
RUN ["ls"]
RUN ["chmod", "+x", "/qtxnode/starttx.sh"]
ENTRYPOINT ["/bin/sh", "/qtxnode/starttx.sh"]