// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"inputs":[],"name":"cancelInsurance","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[],"name":"claimInsurance","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_templateId","type":"uint256"},{"internalType":"string","name":"_templateName","type":"string"},{"internalType":"string","name":"_flightNumber","type":"string"},{"internalType":"string","name":"_departureTime","type":"string"},{"internalType":"address","name":"_insurer","type":"address"},{"internalType":"address","name":"_insured","type":"address"},{"internalType":"uint256","name":"_premium","type":"uint256"},{"internalType":"uint256","name":"_payoutAmount","type":"uint256"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},{"components":[{"internalType":"uint256","name":"templateId","type":"uint256"},{"internalType":"string","name":"templateName","type":"string"},{"internalType":"string","name":"flightNumber","type":"string"},{"internalType":"string","name":"departureTime","type":"string"},{"internalType":"address","name":"insurer","type":"address"},{"internalType":"address","name":"insured","type":"address"},{"internalType":"uint256","name":"premium","type":"uint256"},{"internalType":"uint256","name":"payoutAmount","type":"uint256"},{"internalType":"bool","name":"isActive","type":"bool"},{"internalType":"bool","name":"isPaidOut","type":"bool"}],"indexed":false,"internalType":"struct TravelInsurance.TravelInsuranceData","name":"data","type":"tuple"}],"name":"ClaimEvent","type":"event"},{"inputs":[],"name":"data","outputs":[{"internalType":"uint256","name":"templateId","type":"uint256"},{"internalType":"string","name":"templateName","type":"string"},{"internalType":"string","name":"flightNumber","type":"string"},{"internalType":"string","name":"departureTime","type":"string"},{"internalType":"address","name":"insurer","type":"address"},{"internalType":"address","name":"insured","type":"address"},{"internalType":"uint256","name":"premium","type":"uint256"},{"internalType":"uint256","name":"payoutAmount","type":"uint256"},{"internalType":"bool","name":"isActive","type":"bool"},{"internalType":"bool","name":"isPaidOut","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getData","outputs":[{"components":[{"internalType":"uint256","name":"templateId","type":"uint256"},{"internalType":"string","name":"templateName","type":"string"},{"internalType":"string","name":"flightNumber","type":"string"},{"internalType":"string","name":"departureTime","type":"string"},{"internalType":"address","name":"insurer","type":"address"},{"internalType":"address","name":"insured","type":"address"},{"internalType":"uint256","name":"premium","type":"uint256"},{"internalType":"uint256","name":"payoutAmount","type":"uint256"},{"internalType":"bool","name":"isActive","type":"bool"},{"internalType":"bool","name":"isPaidOut","type":"bool"}],"internalType":"struct TravelInsurance.TravelInsuranceData","name":"","type":"tuple"}],"stateMutability":"view","type":"function"}]',
  'TravelInsurance',
);

class TravelInsurance extends _i1.GeneratedContract {
  TravelInsurance({
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
  Future<String> cancelInsurance({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[0];
    assert(checkSignature(function, '3a0132c7'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> claimInsurance({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, 'a75ac608'));
    final params = [];
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
  Future<Data> data({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, '73d4a13a'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return Data(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<dynamic> getData({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '3bc5de30'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as dynamic);
  }

  /// Returns a live stream of all ClaimEvent events emitted by this contract.
  Stream<ClaimEvent> claimEventEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ClaimEvent');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ClaimEvent(decoded);
    });
  }
}

class Data {
  Data(List<dynamic> response)
      : templateId = (response[0] as BigInt),
        templateName = (response[1] as String),
        flightNumber = (response[2] as String),
        departureTime = (response[3] as String),
        insurer = (response[4] as _i1.EthereumAddress),
        insured = (response[5] as _i1.EthereumAddress),
        premium = (response[6] as BigInt),
        payoutAmount = (response[7] as BigInt),
        isActive = (response[8] as bool),
        isPaidOut = (response[9] as bool);

  final BigInt templateId;

  final String templateName;

  final String flightNumber;

  final String departureTime;

  final _i1.EthereumAddress insurer;

  final _i1.EthereumAddress insured;

  final BigInt premium;

  final BigInt payoutAmount;

  final bool isActive;

  final bool isPaidOut;
}

class ClaimEvent {
  ClaimEvent(List<dynamic> response)
      : from = (response[0] as _i1.EthereumAddress),
        data = (response[1] as dynamic);

  final _i1.EthereumAddress from;

  final dynamic data;
}
