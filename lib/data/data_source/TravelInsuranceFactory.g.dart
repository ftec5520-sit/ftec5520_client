// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[{"internalType":"string","name":"_name","type":"string"},{"internalType":"uint256","name":"_premium","type":"uint256"},{"internalType":"uint256","name":"_payoutAmount","type":"uint256"}],"name":"createInsuranceTemplate","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"getDeployedInsurances","outputs":[{"internalType":"address[]","name":"","type":"address[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"string","name":"_flightNumber","type":"string"},{"internalType":"string","name":"_departureTime","type":"string"}],"name":"getDeployedInsurancesByFlight","outputs":[{"internalType":"address[]","name":"","type":"address[]"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getInsuranceTemplates","outputs":[{"components":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"string","name":"name","type":"string"},{"internalType":"uint256","name":"premium","type":"uint256"},{"internalType":"uint256","name":"payoutAmount","type":"uint256"}],"internalType":"struct TravelInsuranceFactory.InsuranceTemplate[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getMyInsurances","outputs":[{"components":[{"components":[{"internalType":"uint256","name":"templateId","type":"uint256"},{"internalType":"string","name":"templateName","type":"string"},{"internalType":"string","name":"flightNumber","type":"string"},{"internalType":"string","name":"departureTime","type":"string"},{"internalType":"address","name":"insurer","type":"address"},{"internalType":"address","name":"insured","type":"address"},{"internalType":"uint256","name":"premium","type":"uint256"},{"internalType":"uint256","name":"payoutAmount","type":"uint256"},{"internalType":"bool","name":"isActive","type":"bool"},{"internalType":"bool","name":"isPaidOut","type":"bool"}],"internalType":"struct TravelInsurance.TravelInsuranceData[]","name":"insurances","type":"tuple[]"},{"internalType":"address[]","name":"addresses","type":"address[]"}],"internalType":"struct TravelInsuranceFactory.MyInsurances","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"manager","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_templateId","type":"uint256"},{"internalType":"string","name":"_flightNumber","type":"string"},{"internalType":"string","name":"_departureTime","type":"string"}],"name":"purchaseTravelInsurance","outputs":[],"stateMutability":"payable","type":"function"}]',
  'TravelInsuranceFactory',
);

class TravelInsuranceFactory extends _i1.GeneratedContract {
  TravelInsuranceFactory({
    required _i1.EthereumAddress address,
    required _i1.Web3Client client,
    int? chainId,
  }) : super(
          _i1.DeployedContract(
            _contractAbi,
            address,
          ),
          client,
          chainId,
        );

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> createInsuranceTemplate(
    String _name,
    BigInt _premium,
    BigInt _payoutAmount, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, 'ef147ef8'));
    final params = [
      _name,
      _premium,
      _payoutAmount,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<_i1.EthereumAddress>> getDeployedInsurances(
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '942d361d'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<_i1.EthereumAddress>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<_i1.EthereumAddress>> getDeployedInsurancesByFlight(
    String _flightNumber,
    String _departureTime, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, '6f9c8bbb'));
    final params = [
      _flightNumber,
      _departureTime,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<_i1.EthereumAddress>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getInsuranceTemplates({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, 'be8af9aa'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<dynamic> getMyInsurances({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, '712bf5d7'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as dynamic);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i1.EthereumAddress> manager({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, '481c6a75'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i1.EthereumAddress);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> purchaseTravelInsurance(
    BigInt _templateId,
    String _flightNumber,
    String _departureTime, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, '051e280e'));
    final params = [
      _templateId,
      _flightNumber,
      _departureTime,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }
}
