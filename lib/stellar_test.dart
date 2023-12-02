import 'package:dartz/dartz.dart';
import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart';
import 'package:flutter/material.dart';

class StellarTest {}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void getKeypairFromMnemonics() async {
    await Wallet.from(
            "work joy retire discover monster stool ripple deliver across electric eternal order")
        .then((value) => value.getAccountId().then((value) {
              print(value);
            }));
    // String accountId = await wallet.getAccountId();
    // print(accountId);
  }

  void generateKeypair() {
    var keypair = KeyPair.random();
    print(keypair.accountId);
    print(keypair.secretSeed);
  }

  void getKeyPairFromMnemonics() async {
    Wallet wallet = await Wallet.from(
        "work joy retire discover monster stool ripple deliver across electric eternal order");
    var keyPair = await wallet.getKeyPair();
    print(keyPair.accountId);
    print(keyPair.secretSeed);
  }

  void getKeypairFromSecretSeed() {
    var keypair = KeyPair.fromSecretSeed(
        "SCXPXLCCVD7O3BCFTWZ3JMDBAB5F5FHQOOI2WBN7TIB6HJQLLK2MI7T4");
    print(keypair.accountId);
    print(keypair.secretSeed);
  }

  void generateKeypairAndFund() async {
    final StellarSDK sdk = StellarSDK.TESTNET;

    var keypair = KeyPair.random();
    print(keypair.accountId);
    print(keypair.secretSeed);

    bool funded = await FriendBot.fundTestAccount(keypair.accountId);
    print("funded: ${funded}");

    var accountResponse = await sdk.accounts.account(keypair.accountId);
    accountResponse.balances.forEach((element) {
      print(element.balance);
    });
  }

  void getBalances() async {
    final StellarSDK sdk = StellarSDK.TESTNET;
    KeyPair keypair = KeyPair.fromSecretSeed(
        "SCXPXLCCVD7O3BCFTWZ3JMDBAB5F5FHQOOI2WBN7TIB6HJQLLK2MI7T4");
        print("A");
    var accountResponse = await sdk.accounts.account(keypair.accountId);
    accountResponse.balances.forEach((element) {
      print(element.assetCode);
    });
  }

  void createTransacion() async {
    final StellarSDK sdk = StellarSDK.TESTNET;

    /// Create a key pair for your existing account.
    KeyPair keyA = KeyPair.fromSecretSeed(
        "SAPS66IJDXUSFDSDKIHR4LN6YPXIGCM5FBZ7GE66FDKFJRYJGFW7ZHYF");

    /// Load the data of your account from the stellar network.
    AccountResponse accA = await sdk.accounts.account(keyA.accountId);

    /// Create a keypair for a new account.
    KeyPair keyB = KeyPair.random();
    CreateAccountOperationBuilder createAccBuilder =
        CreateAccountOperationBuilder(
            keyB.accountId, "3"); // send 3 XLM (lumen)

    var transaction =
        TransactionBuilder(accA).addOperation(createAccBuilder.build()).build();
    transaction.sign(keyA, Network.TESTNET);
    SubmitTransactionResponse response =
        await sdk.submitTransaction(transaction);
    if (response.success) {
      print("account ${keyB.accountId} created");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: InkWell(
            child: Text('Hello World'),
            onTap: () {
              // getKeypairFromMnemonics();
              // generateKeypair();
              // getKeyPairFromMnemonics();
              // getKeypairFromSecretSeed();
              getBalances();
            },
          ),
        ),
      ),
    );
  }
}
