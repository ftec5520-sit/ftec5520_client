import 'package:http/http.dart';

import 'package:web3dart/web3dart.dart';

class Web3DataSource {

  // Geoiler
  // final String url = "https://ethereum-mainnet-rpc.allthatnode.com";
  // final String url = "https://goerli.infura.io/v3/e4aa6ad3fb4e4e0197c7badd0c897cac";
  // final String key = "83b19c39b9c9b6779b16694e9b42705b4bdf604a140cb31a27c1a4f4c5784cba";

  // Sepolia
  // final String url = "https://eth-sepolia.g.alchemy.com/v2/";
  final String url = "https://sepolia.infura.io/v3/e4aa6ad3fb4e4e0197c7badd0c897cac";
  final String key = "83b19c39b9c9b6779b16694e9b42705b4bdf604a140cb31a27c1a4f4c5784cba";
  
  final contractAbi = ContractAbi.fromJson(jsonData, name)

  late final Web3Client _web3Client;
  var httpClient = Client();

  Web3DataSource() {}

  Future<double> getBalance() async {
    _web3Client = Web3Client(url, httpClient);

    var credentials = EthPrivateKey.fromHex(key);
    var address = await credentials.extractAddress();
    print("address ${address.hex}");
    EtherAmount balance = await _web3Client.getBalance(address);

    print("balance ${balance.getValueInUnit(EtherUnit.wei)}");
    return balance.getValueInUnit(EtherUnit.ether);
  }
}
