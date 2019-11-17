### geth導入
genesis.json
```
{
  "config": {
        "chainId": 10,
        "homesteadBlock": 0,
        "eip155Block": 0,
        "eip158Block": 0
    },
  "alloc"      : {},
  "coinbase"   : "0x0000000000000000000000000000000000000000",
  "difficulty" : "0x20000",
  "extraData"  : "",
  "gasLimit"   : "0x2fefd8",
  "nonce"      : "0x0000000000000042",
  "mixhash"    : "0x0000000000000000000000000000000000000000000000000000000000000000",
  "parentHash" : "0x0000000000000000000000000000000000000000000000000000000000000000",
  "timestamp"  : "0x00"
}
```

geth初期化処理
```
geth --datadir ~/geth/private_net/ init ~/geth/private_net/genesis.json
```
↓
```
INFO [11-17|17:04:10.303] Successfully wrote genesis state
```

geth起動
```
geth --networkid "10" --nodiscover --datadir ~/geth/private_net/ --rpc --rpcaddr "localhost" --rpcport "8545" --rpccorsdomain "*" --rpcapi "etc,net,web3,personal" --targetgaslimit "20000000" --allow-insecure-unlock console 2>> ~/geth/private_net/error.log
```
↓
```
Welcome to the Geth JavaScript console!
```

### gethコマンド
アカウントの作成
 ```
 personal.newAccount("password")
 ```
 アカウントの確認
 ```
 eth.accounts
 ```
 または
 ```
 eth.accounts[<int>]
 ```
 
 コインベースのアカウント確認
 ```
 eth.coinbase
 ```
 コインベースのアカウント変更
 ```
 miner.setEtherbase(eth.accounts[<int>])
 ```
 genesisブロックの確認
 ```
 eth.getBlock(0)
 ```
 マイニングの開始
 ```
 miner.start(<スレッド数>)
 ```
 マイニング動作確認
 ```
 eth.mining
 ```
 コインベースの残高確認
 ```
 eth.getBalance(eth.accounts[0])
 ```
 ```
 web3.fromWei(eth.getBalance(eth.accounts[0]), "ether")
 ```
 マイニングの終了
 ```
 miner.stop()
 ```
 送金
 ```
 eth.sendTransaction({from: eth.accounts[0], to: eth.accounts[2], value: web3.toWei(5, "ether")})
 
 Error: authentication needed: password or unlock
    at web3.js:3143:20
    at web3.js:6347:15
    at web3.js:5081:36
    at <anonymous>:1:1
 ```
 ロックの解除
 ```
 personal.unlockAccount(eth.accounts[0])
 ```
 - error
 ```
 Error: could not decrypt key with given password
 ```
 ↓
 起動時に以下のオプションをつける
 ```
 --allow-insecure-unlock
 ```
 
 
