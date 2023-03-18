import 'package:flutter/services.dart';
import 'package:ftec5520_client/data/data_source/TravelInsuranceFactory.g.dart';
import 'package:ftec5520_client/domain/entities/contract_template.dart';
import 'package:http/http.dart';

import 'package:web3dart/web3dart.dart';

class Web3DataSource {
  static final Web3DataSource _instance = Web3DataSource._internal();

  // Geoiler
  // final String url = "https://ethereum-mainnet-rpc.allthatnode.com";
  // final String url = "https://goerli.infura.io/v3/e4aa6ad3fb4e4e0197c7badd0c897cac";
  // final String key = "83b19c39b9c9b6779b16694e9b42705b4bdf604a140cb31a27c1a4f4c5784cba";

  // Sepolia
  // final String url = "https://eth-sepolia.g.alchemy.com/v2/";
  final String _url =
      'https://sepolia.infura.io/v3/e4aa6ad3fb4e4e0197c7badd0c897cac';
  final String _key =
      '83b19c39b9c9b6779b16694e9b42705b4bdf604a140cb31a27c1a4f4c5784cba';
  late final EthPrivateKey _credentials;

  // late final DeployedContract _contractAbi;
  late final Web3Client _web3Client;
  late final EthereumAddress _address;

  final httpClient = Client();

  factory Web3DataSource() {
    return _instance;
  }

  Web3DataSource._internal() {
    // final String abi =
    // rootBundle.loadString('assets/abi/travel_insurance.json') as String;
    _address =
        EthereumAddress.fromHex('0x01850F09c9E7e4AdA840c64A03910600e9E33120');
    // _contractAbi =
        // DeployedContract(ContractAbi.fromJson(abi, 'TravelInsurance'), _address);
    _web3Client = Web3Client(_url, httpClient);
    _credentials = EthPrivateKey.fromHex(_key);
  }

  Future<double> getBalance() async {
    var credentials = EthPrivateKey.fromHex(_key);
    var address = await credentials.extractAddress();
    print("address ${address.hex}");
    EtherAmount balance = await _web3Client.getBalance(address);

    print("balance ${balance.getValueInUnit(EtherUnit.wei)}");
    return balance.getValueInUnit(EtherUnit.ether);
  }

  Future<List<String>> getAvailableContractTemplates() async {
    final factory = TravelInsuranceFactory(
        address: _address, client: _web3Client);

    return factory.getInsuranceTemplateNames().then(
            (value) {
          print(value);
          return value;
        });
  }
  
  Future<String> purchaseInsuranceContract(
      String templateName,
      String flightNumber,
      int departureTime,
      ) async {
    final factory = TravelInsuranceFactory(
        address: _address, client: _web3Client);

    return factory.createTravelInsurance(
        templateName,
        flightNumber,
        departureTime.toString(),
        credentials: _credentials,
        transaction: Transaction(
          from: _address,
          maxGas: 1000000,
        ),
    );
  }
}
