# Hyperledger-fabric多机部署
基于Hyperledger-fabric的搭建--基于solo和kafka的两种版本

部署环境：<br/>
  部署主机：Centos 7.1<br/>
  go语言：1.9.2<br/>
  docker-CE:18.04<br/>
  docker-compose:1.19.0<br/>
  Hyperledger fabric:1.1<br/>
  
KAFKA:
10.10.44.120    orderer0.blockchain.com<br/>

10.10.44.122    orderer1.blockchain.com<br/>
10.10.44.122    peer0.org1.blockchain.com<br/>
10.10.44.122    zookeeper1.blockchain.com<br/>
10.10.44.122    kafka1.blockchain.com<br/>
10.10.44.122    couchdb0.org1.blockchain.com<br/>
10.10.44.122    ca0.org1.blockchain.com<br/><br/>


10.10.44.123    orderer2.blockchain.com<br/>
10.10.44.123    peer1.org1.blockchain.com<br/>
10.10.44.123    zookeeper2.blockchain.com<br/>
10.10.44.123    kafka2.blockchain.com<br/>
10.10.44.123    couchdb1.org1.blockchain.com<br/><br/>

10.10.44.124    peer0.org2.blockchain.com<br/>
10.10.44.124    zookeeper3.blockchain.com<br/>
10.10.44.124    kafka3.blockchain.com<br/>
10.10.44.124    couchdb0.org2.blockchain.com<br/><br/>


10.10.44.129    peer1.org2.blockchain.com<br/>
10.10.44.129    kafka4.blockchain.com<br/>
10.10.44.129    couchdb1.org2.blockchain.com<br/>
10.10.44.129    ca0.org2.blockchain.com<br/><br/>

  
