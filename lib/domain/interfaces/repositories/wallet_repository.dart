abstract class WalletRepository {
  Future<String> getAccountAddress();
  Future<double> getBalance();
}
