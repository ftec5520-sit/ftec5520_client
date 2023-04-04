import 'dart:async';

import 'package:ftec5520_client/data/data_source/TravelInsurance.g.dart';
import 'package:ftec5520_client/data/data_source/TravelInsuranceFactory.g.dart';
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
  // final String _key =
  //     '83b19c39b9c9b6779b16694e9b42705b4bdf604a140cb31a27c1a4f4c5784cba';
  final String _key =
      '0a54058ddde8dd823f32b3320427c91cfe84b2cc55c945d5abd061177bb30fd4';
  late final EthPrivateKey _credentials;

  late final Web3Client _web3Client;
  late final EthereumAddress _address;

  final httpClient = Client();

  factory Web3DataSource() {
    return _instance;
  }

  Web3DataSource._internal() {
    _address =
        EthereumAddress.fromHex('0x4DdDd00C53dea877BeF167d6ba86936f40258c7D');

    _web3Client = Web3Client(_url, httpClient);
    _credentials = EthPrivateKey.fromHex(_key);
  }

  Future<String> getAccountAddress() async {
    var credentials = EthPrivateKey.fromHex(_key);
    print('getAccountAddress ${credentials.address}');
    return credentials.address.hex;
  }

  Future<double> getBalance() async {
    var credentials = EthPrivateKey.fromHex(_key);
    var address = await credentials.extractAddress();
    print("address ${address.hex}");
    EtherAmount balance = await _web3Client.getBalance(address);

    print("balance ${balance.getValueInUnit(EtherUnit.wei)}");
    return balance.getValueInUnit(EtherUnit.ether);
  }

  Future<List<dynamic>> getAvailableContractTemplates() async {
    final factory =
        TravelInsuranceFactory(address: _address, client: _web3Client);

    return factory.getInsuranceTemplates().then((value) {
      print('getInsuranceTemplates value:${value}');
      return value;
    });
  }

  Future<List<String>> getDeployedInsurances() async {
    final factory =
        TravelInsuranceFactory(address: _address, client: _web3Client);

    final function = factory.self.abi.functions[3];
    return _web3Client.call(
        sender: _credentials.address,
        contract: factory.self,
        function: function,
        params: []).then((value) {
      print('getDeployedInsurances value:${value}');
      return [];
    });
  }

  Future<List<dynamic>> getPurchasedInsuranceContracts() async {
    final factory =
        TravelInsuranceFactory(address: _address, client: _web3Client);

    final function = factory.self.abi.functions[6];
    return _web3Client.call(
        sender: _credentials.address,
        contract: factory.self,
        function: function,
        params: []).then((value) {
      print('getMyInsurances value:${value}');
      return value;
    });
  }

  Future<String> purchaseInsuranceContract(
    int templateId,
    String flightNumber,
    int departureTime,
    BigInt premium,
  ) async {
    final factory =
        TravelInsuranceFactory(address: _address, client: _web3Client);

    return factory.purchaseTravelInsurance(
      BigInt.from(templateId),
      flightNumber,
      departureTime.toString(),
      credentials: _credentials,
      transaction: Transaction(
        // from: _address,
        // maxGas: 3000000,
        value: EtherAmount.fromBigInt(EtherUnit.wei, premium),
      ),
    );
  }

  Stream<dynamic> listenClaimEvents(List<String> addresses) {

    final streamController = StreamController<dynamic>();

    List<StreamSubscription<dynamic>> stmSubscriptions = [];

    addresses.forEach((element) {
      final factory = TravelInsurance(address: EthereumAddress.fromHex(element), client: _web3Client);

      StreamSubscription stmSubscription = factory.claimEventEvents().listen((event) {
        print('listenClaimEvents event:${event.data}');
        streamController.add(event.data);
      });

      stmSubscriptions.add(stmSubscription);
    });

    streamController.onCancel = () {
      print('listenClaimEvents onCancel');
      for (var element in stmSubscriptions) {
        element.cancel();
      }
    };

    return streamController.stream;
  }
}
