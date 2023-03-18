

import '../../../domain/interfaces/repositories/wallet_repository.dart';
import '../../data_source/web3_datasource.dart';

class Web3WalletRepo implements WalletRepository {
  Web3DataSource web3DataSource = Web3DataSource();

  Web3WalletRepo() {
    // web3client = Web3Client(url, httpClient);
    // var address = await credentials.extractAddress();
  }

  @override
  Future<String> getAccountAddress() {
    return web3DataSource.getAccountAddress();
  }

  @override
  Future<double> getBalance() {
    return web3DataSource.getBalance();
  }

}