# kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-qedadmin-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode package msgapp.tar.gz --path /opt/gopath/src/qed_clients_chaincodes/usercc --lang golang --label msgapp_1'

# sleep 5 

# kubectl exec -it $(kubectl get pods -o=name | grep cli-peer1-qedadmin-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode package msgapp.tar.gz --path /opt/gopath/src/qed_clients_chaincodes/go --lang golang --label msgapp_1'

# sleep 5 

# kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-consumer-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode package msgapp.tar.gz --path /opt/gopath/src/qed_clients_chaincodes/go --lang golang --label msgapp_1'

# sleep 5 

# kubectl exec -it $(kubectl get pods -o=name | grep cli-peer1-consumer-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode package msgapp.tar.gz --path /opt/gopath/src/qed_clients_chaincodes/go --lang golang --label msgapp_1'

sleep 5 

# install in chaincode
kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-qedadmin-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode install usercc-org1.tgz &> pkgmsgapp.txt'

sleep 5 
kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-qedadmin-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode install msgapp-qedadmin.tgz'

sleep 5 
# kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-manufacturer-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode install msgapp.tar.gz &> pkgmsgapp.txt'

# sleep 5 
# kubectl exec -it $(kubectl get pods -o=name | grep cli-peer1-manufacturer-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode install msgapp.tar.gz'
sleep 5 
kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-consumer-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode install msgapp.tar.gz &> pkgmsgapp.txt'

sleep 5 
kubectl exec -it $(kubectl get pods -o=name | grep cli-peer1-consumer-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode install msgapp.tar.gz'

sleep 5 
kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-qedadmin-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode approveformyorg -o orderer0-service:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-service-7054.pem  --channelID qedlitechannel --name usercc --version 1.1 --sequence 1 --package-id usercc:d78e072069238054ee43dffb7e37b979a613e2e0d67f079cabde4c73f574d8c1'



kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-manufacturer-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode approveformyorg -o orderer0-service:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-service-7054.pem  --channelID qedlitechannel --name usercc --version 1.0 --sequence 1 --package-id usercc:c77f25720ed6ee6be553e3f6d65ad7cfd347100dcd129c099158e787feea0c6e'


sleep 5 
kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-consumer-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode approveformyorg -o orderer0-service:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-service-7054.pem  --channelID qedlitechannel --name usercc --version 1.0 --sequence 1 --package-id usercc:413a0a793a21ad8521b27b41b3c64fe296590911c88a5ebebca589a411c5a7d2'

sleep 5 

kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-qedadmin-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode commit -o orderer0-service:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-service-7054.pem  --channelID qedlitechannel --name usercc --version 1.0 --sequence 1'

######################################################tokencc#################################

sleep 5 
kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-qedadmin-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode approveformyorg -o orderer0-service:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-service-7054.pem  --channelID qedlitechannel --name tokencc --version 1.1 --sequence 1 --package-id tokencc:ea5fa019449a0c921b0434c6f5a271cdc5c7c95a98bce058124049b6eb8dda7d'



kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-manufacturer-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode approveformyorg -o orderer0-service:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-service-7054.pem  --channelID qedlitechannel --name tokencc --version 1.1 --sequence 1 --package-id tokencc:5121b96962477af8c5e8470c8e51065e57439ddd7ccf3cb539868f110928a21f'


sleep 5 
kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-consumer-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode approveformyorg -o orderer0-service:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-service-7054.pem  --channelID qedlitechannel --name tokencc --version 1.0 --sequence 1 --package-id tokencc:ea5fa019449a0c921b0434c6f5a271cdc5c7c95a98bce058124049b6eb8dda7d'

sleep 5 

kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-qedadmin-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode commit -o orderer0-service:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-service-7054.pem  --channelID qedlitechannel --name tokencc --version 1.0 --sequence 1'

########################################################rulecc#################################

sleep 5 
kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-qedadmin-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode approveformyorg -o orderer0-service:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-service-7054.pem  --channelID qedlitechannel --name rulecc --version 1.0 --sequence 1 --package-id rulecc:18bdf0cc5ca3a234cc6204df9fc43574a5ba29640c37d14bd3542cc04a984d27'



kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-manufacturer-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode approveformyorg -o orderer0-service:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-service-7054.pem  --channelID qedlitechannel --name rulecc --version 1.0 --sequence 1 --package-id rulecc:8463b15c4c400f8d55d2314ac63b8e45d4c41a68b5a89b088c7d5fc6aa6fcab5'


sleep 5 
kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-consumer-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode approveformyorg -o orderer0-service:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-service-7054.pem  --channelID qedlitechannel --name rulecc --version 1.0 --sequence 1 --package-id rulecc:797ddfa8d6bbcc074748fbc26da2b53c0ffce2105ff7147719b14a4677842af3'

sleep 5 

kubectl exec -it $(kubectl get pods -o=name | grep cli-peer0-qedadmin-deployment | sed "s/^.\{4\}//") -- bash -c 'peer lifecycle chaincode commit -o orderer0-service:7050 --tls --cafile=/etc/hyperledger/orderers/msp/tlscacerts/orderers-ca-service-7054.pem  --channelID qedlitechannel --name rulecc --version 1.0 --sequence 1'
