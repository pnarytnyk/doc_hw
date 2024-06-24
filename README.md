1) How to build images
   
To create image from **Dockerfile** you need to run the following command in the directory:
`docker build --tag testimage .`

2) How to create network
   
To create custom bridge network run:
`docker network create testnetwork`

3) How to run containers 

Asuming image and network are called as above run following commands:

```docker container run --mount type=bind,source="$(pwd)",target=/net_test --net testnetwork --hostname testserver.com --name testserver  -dt testimage```
to run server and

```docker container run --mount type=bind,source="$(pwd)",target=/net_test --net testnetwork --hostname testclient.com --name testclient  -dt testimage```
to run client

4) Commands to verify containers connectivity between container

To manually check connectivity between containers you can attach to both containers using:
```docker attach testserver``` and ```docker attach testclient``` in separate shells or tabs.
Start `tcpdump` inside **testserver** container and run ```ping testserver.com``` from the **client** container.
Verify that tcpdump on server container shows ICMP packets received from client container.

5) Commands to verify netcat scripts

To check TCP connectivity using netcat `cd` into `net_test` directory and start `server.sh` script on `server` container and then start `client.sh` script on `client` from the same directory.
Verify that contents of `testdata` file are displayed on server side.
To check UDP connectivity use same logic with `serverUDP.sh` and `clientUDP.sh`
