import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "package:pointycastle/export.dart";
import "package:asn1lib/asn1lib.dart";

List<int> decodePEM(String pem) {
  var startsWith = [
    "-----BEGIN PUBLIC KEY-----",
    "-----BEGIN RSA PUBLIC KEY-----",
    "-----BEGIN PRIVATE KEY-----",
    "-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: React-Native-OpenPGP.js 0.1\r\nComment: http://openpgpjs.org\r\n\r\n",
    "-----BEGIN PGP PRIVATE KEY BLOCK-----\r\nVersion: React-Native-OpenPGP.js 0.1\r\nComment: http://openpgpjs.org\r\n\r\n",
  ];
  var endsWith = [
    "-----END PUBLIC KEY-----",
    "-----END PRIVATE KEY-----",
    "-----END RSA PRIVATE KEY-----",
    "-----END PGP PUBLIC KEY BLOCK-----",
    "-----END PGP PRIVATE KEY BLOCK-----",
  ];
  bool isOpenPgp = pem.indexOf('BEGIN PGP') != -1;

  for (var s in startsWith) {
    if (pem.startsWith(s)) {
      pem = pem.substring(s.length);
    }
  }

  for (var s in endsWith) {
    if (pem.endsWith(s)) {
      pem = pem.substring(0, pem.length - s.length);
    }
  }

  if (isOpenPgp) {
    var index = pem.indexOf('\r\n');
    pem = pem.substring(0, index);
  }

  pem = pem.replaceAll('\n', '');
  pem = pem.replaceAll('\r', '');

  return base64.decode(pem);
}

class RsaKeyHelper {
  /* AsymmetricKeyPair<PublicKey, PrivateKey> generateKeyPair() {
    var keyParams = RSAKeyGeneratorParameters(BigInt.parse('65537'), 2048, 12);

    var secureRandom = FortunaRandom();
    var random = Random.secure();
    List<int> seeds = [];
    for (int i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));

    var rngParams = ParametersWithRandom(keyParams, secureRandom);
    var k = RSAKeyGenerator();
    k.init(rngParams);

    return k.generateKeyPair();
  } */

  void generateKeyPairFromSeed() async {
    // Replace this with your 4-digit PIN
    String pin = "1234";

    // Convert PIN to Uint8List using UTF-8 encoding
    Uint8List pinBytes = Uint8List.fromList(utf8.encode(pin));

    // Ensure the seed is 32 bytes (256 bits)
    Uint8List seed = Uint8List(32)..setAll(0, pinBytes);

    // Create a secure random number generator with a 256-bit key
    final secureRandom = FortunaRandom()..seed(KeyParameter(seed));

    // Create RSA key pair parameters
    final rsaParams = RSAKeyGeneratorParameters(
      BigInt.parse('65537'), // Public exponent (e)
      2048, // Bit length
      12, // Number of Miller-Rabin rounds
    );

    // Initialize RSA key generator
    final keyGen = RSAKeyGenerator()
      ..init(ParametersWithRandom(rsaParams, secureRandom));

    // Generate RSA key pair
    AsymmetricKeyPair<PublicKey, PrivateKey> genericKeyPair =
        keyGen.generateKeyPair();
    AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> keyPair =
        AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey>(
      genericKeyPair.publicKey as RSAPublicKey,
      genericKeyPair.privateKey as RSAPrivateKey,
    );

    // Access public and private keys
    RSAPublicKey publicKey = keyPair.publicKey;
    RSAPrivateKey privateKey = keyPair.privateKey;

    // Print public key
    print('Public Key:');
    print('Modulus: ${publicKey.modulus}');
    print('Exponent: ${publicKey.exponent}');

    // Print private key
    print('\nPrivate Key:');
    print('Modulus: ${privateKey.modulus}');
    print('Exponent: ${privateKey.privateExponent}');

    //print pem public key
    print('public encoded : ' + encodePublicKeyToPem(publicKey));

    //print pem private key
    print('private encoded : ' + encodePrivateKeyToPem(privateKey));

    //////////////////////////////////////////encryption and decryption///////////////////////////////////////////////////////

    // Replace this with your data to be encrypted
    String originalData = "Hello, World!";
    Uint8List dataToEncrypt = Uint8List.fromList(utf8.encode(originalData));

    // Encrypt data using the public key
    final encrypter = RSAEngine()
      ..init(
        true, // true for encryption
        PublicKeyParameter<RSAPublicKey>(keyPair.publicKey),
      );

    var encryptedBytes = encrypter.process(dataToEncrypt);

// Convert the encrypted bytes to a base64-encoded string for easy display
    String encryptedData = base64.encode(encryptedBytes);
    print("Encrypted Data: $encryptedData");

    // Decrypt data using the private key
    final decrypter = RSAEngine()
      ..init(
        false, // false for decryption
        PrivateKeyParameter<RSAPrivateKey>(keyPair.privateKey),
      );

    Uint8List decryptedBytes =
        decrypter.process(Uint8List.fromList(base64.decode(encryptedData)));

    // Convert the decrypted bytes to a string
    String decryptedText = utf8.decode(decryptedBytes);

    print("Decrypted Data: $decryptedText");

    final aOptions = AndroidOptions(keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_PKCS1Padding);
    final iOption = IOSOptions();

    /* dynamic option = null;

    // Create storage
    if (Platform.isAndroid) {
      option = aOptions;
    } else if (Platform.isIOS) {
      option = iOption;
    } */
    final storage = FlutterSecureStorage(aOptions: aOptions,iOptions: iOption);
    await storage.write(key: 'reza', value: encryptedData);
    await storage.read(
      key: 'reza',
    ).then((value) {print(value);});
  }

  String encodePublicKeyToPem(RSAPublicKey publicKey) {
    var algorithmSeq = ASN1Sequence();
    var algorithmAsn1Obj = ASN1Object.fromBytes(Uint8List.fromList(
        [0x6, 0x9, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0xd, 0x1, 0x1, 0x1]));
    var paramsAsn1Obj = ASN1Object.fromBytes(Uint8List.fromList([0x5, 0x0]));
    algorithmSeq.add(algorithmAsn1Obj);
    algorithmSeq.add(paramsAsn1Obj);

    var publicKeySeq = ASN1Sequence();
    publicKeySeq.add(ASN1Integer(publicKey.modulus!));
    publicKeySeq.add(ASN1Integer(publicKey.exponent!));
    var publicKeySeqBitString =
        ASN1BitString(Uint8List.fromList(publicKeySeq.encodedBytes));

    var topLevelSeq = ASN1Sequence();
    topLevelSeq.add(algorithmSeq);
    topLevelSeq.add(publicKeySeqBitString);
    var dataBase64 = base64.encode(topLevelSeq.encodedBytes);

    return """-----BEGIN PUBLIC KEY-----$dataBase64-----END PUBLIC KEY-----""";
  }

  String encodePrivateKeyToPem(RSAPrivateKey privateKey) {
    var version = ASN1Integer(BigInt.from(0));

    var algorithmSeq = ASN1Sequence();
    var algorithmAsn1Obj = ASN1Object.fromBytes(Uint8List.fromList(
        [0x6, 0x9, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0xd, 0x1, 0x1, 0x1]));
    var paramsAsn1Obj = ASN1Object.fromBytes(Uint8List.fromList([0x5, 0x0]));
    algorithmSeq.add(algorithmAsn1Obj);
    algorithmSeq.add(paramsAsn1Obj);

    var privateKeySeq = ASN1Sequence();
    var modulus = ASN1Integer(privateKey.n!);
    var publicExponent = ASN1Integer(BigInt.parse('65537'));
    var privateExponent = ASN1Integer(privateKey.d!);
    var p = ASN1Integer(privateKey.p!);
    var q = ASN1Integer(privateKey.q!);
    var dP = privateKey.d! % (privateKey.p! - BigInt.from(1));
    var exp1 = ASN1Integer(dP);
    var dQ = privateKey.d! % (privateKey.q! - BigInt.from(1));
    var exp2 = ASN1Integer(dQ);
    var iQ = privateKey.q!.modInverse(privateKey.p!);
    var co = ASN1Integer(iQ);

    privateKeySeq.add(version);
    privateKeySeq.add(modulus);
    privateKeySeq.add(publicExponent);
    privateKeySeq.add(privateExponent);
    privateKeySeq.add(p);
    privateKeySeq.add(q);
    privateKeySeq.add(exp1);
    privateKeySeq.add(exp2);
    privateKeySeq.add(co);
    var publicKeySeqOctetString =
        new ASN1OctetString(Uint8List.fromList(privateKeySeq.encodedBytes));

    var topLevelSeq = new ASN1Sequence();
    topLevelSeq.add(version);
    topLevelSeq.add(algorithmSeq);
    topLevelSeq.add(publicKeySeqOctetString);
    var dataBase64 = base64.encode(topLevelSeq.encodedBytes);

    return """-----BEGIN PRIVATE KEY-----$dataBase64-----END PRIVATE KEY-----""";
  }
}
