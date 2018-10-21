#创建通道

ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/blockchain.com/orderers/orderer1.blockchain.com/msp/tlscacerts/tlsca.blockchain.com-cert.pem

peer channel create -o orderer1.blockchain.com:7050 -c mychannel -f ./channel-artifacts/channel.tx --tls true --cafile $ORDERER_CA


#peer加入到channel

peer channel join -b mychannel.block


CORE_PEER_LOCALMSPID="Org1MSP"		

CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.blockchain.com/peers/peer0.org1.blockchain.com/tls/ca.crt		

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.blockchain.com/users/Admin@org1.blockchain.com/msp

CORE_PEER_ADDRESS=peer1.org1.blockchain.com:7051

peer channel join -b mychannel.block

CORE_PEER_LOCALMSPID="Org2MSP"	

CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.blockchain.com/peers/peer0.org2.blockchain.com/tls/ca.crt

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.blockchain.com/users/Admin@org2.blockchain.com/msp

CORE_PEER_ADDRESS=peer0.org2.blockchain.com:7051

peer channel join -b mychannel.block



CORE_PEER_LOCALMSPID="Org2MSP"		

CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.blockchain.com/peers/peer1.org2.blockchain.com/tls/ca.crt		

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.blockchain.com/users/Admin@org2.blockchain.com/msp

CORE_PEER_ADDRESS=peer1.org2.blockchain.com:7051

peer channel join -b mychannel.block


#更新锚节点
CORE_PEER_LOCALMSPID="Org1MSP"		

CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.blockchain.com/peers/peer0.org1.blockchain.com/tls/ca.crt		

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.blockchain.com/users/Admin@org1.blockchain.com/msp

CORE_PEER_ADDRESS=peer0.org1.blockchain.com:7051

ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/blockchain.com/orderers/orderer1.blockchain.com/msp/tlscacerts/tlsca.blockchain.com-cert.pem

peer channel update -o orderer1.blockchain.com:7050 -c mychannel -f ./channel-artifacts/${CORE_PEER_LOCALMSPID}anchors.tx --tls true --cafile $ORDERER_CA

CORE_PEER_LOCALMSPID="Org2MSP"		

CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.blockchain.com/peers/peer0.org2.blockchain.com/tls/ca.crt		

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.blockchain.com/users/Admin@org2.blockchain.com/msp

CORE_PEER_ADDRESS=peer0.org2.blockchain.com:7051

ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/blockchain.com/orderers/orderer1.blockchain.com/msp/tlscacerts/tlsca.blockchain.com-cert.pem

peer channel update -o orderer1.blockchain.com:7050 -c mychannel -f ./channel-artifacts/${CORE_PEER_LOCALMSPID}anchors.tx --tls true --cafile $ORDERER_CA 


#安装链码
CORE_PEER_LOCALMSPID="Org1MSP"	

CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.blockchain.com/peers/peer0.org1.blockchain.com/tls/ca.crt		

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.blockchain.com/users/Admin@org1.blockchain.com/msp

CORE_PEER_ADDRESS=peer0.org1.blockchain.com:7051

peer chaincode install -n test -v 2.0 -p github.com/hyperledger/fabric/blockchains/chaincode/go/chaincode_example02



CORE_PEER_LOCALMSPID="Org1MSP"		

CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.blockchain.com/peers/peer0.org1.blockchain.com/tls/ca.crt		

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.blockchain.com/users/Admin@org1.blockchain.com/msp

CORE_PEER_ADDRESS=peer1.org1.blockchain.com:7051

peer chaincode install -n test -v 2.0 -p github.com/hyperledger/fabric/blockchains/chaincode/go/chaincode_example02



CORE_PEER_LOCALMSPID="Org2MSP"		

CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.blockchain.com/peers/peer0.org2.blockchain.com/tls/ca.crt		

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.blockchain.com/users/Admin@org2.blockchain.com/msp

CORE_PEER_ADDRESS=peer0.org2.blockchain.com:7051

peer chaincode install -n test -v 2.0 -p github.com/hyperledger/fabric/blockchains/chaincode/go/chaincode_example02


CORE_PEER_LOCALMSPID="Org2MSP"		

CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.blockchain.com/peers/peer1.org2.blockchain.com/tls/ca.crt		

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.blockchain.com/users/Admin@org2.blockchain.com/msp

CORE_PEER_ADDRESS=peer1.org2.blockchain.com:7051

peer chaincode install -n test -v 2.0 -p github.com/hyperledger/fabric/blockchains/chaincode/go/chaincode_example02



#链码实例化与升级
ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/blockchain.com/orderers/orderer1.blockchain.com/msp/tlscacerts/tlsca.blockchain.com-cert.pem


peer chaincode instantiate -o orderer1.blockchain.com:7050 --tls true --cafile $ORDERER_CA -C mychannel -n test -v 2.0 -c '{"Args":["init","a","100","b","200"]}' -P "OR('Org1MSP.member','Org2MSP.member')"


peer chaincode upgrade -o orderer1.blockchain.com:7050 --tls true --cafile $ORDERER_CA -C mychannel -n test -v 2.0 -c '{"Args":["init","a","100","b","200"]}' -P "OR('Org1MSP.member','Org2MSP.member')"


#链码调用
peer chaincode query -C mychannel -v 2.0 -n test -c '{"Args":["query","a"]}'






