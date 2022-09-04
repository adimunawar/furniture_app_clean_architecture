import 'package:e_furniture/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';

class MockDataNetworkConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late MockDataNetworkConnectionChecker dataConnectionChecker;
  late NetworkInfoImpl networkInfoImpl;

  setUp(() {
    dataConnectionChecker = MockDataNetworkConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(connectionChecker: dataConnectionChecker);
  });

  group('Get Network Status', () {
    test('Should return true if network connection connected', () async {
      when(() => dataConnectionChecker.hasConnection)
          .thenAnswer((_) async => true);
      //act
      var result = await networkInfoImpl.isConnected;
      expect(result, equals(true));
    });

    test('should return false if not connected to internet', () async {
      //arrange
      when(() => dataConnectionChecker.hasConnection)
          .thenAnswer((_) async => false);
      //act
      var result = await networkInfoImpl.isConnected;
      //assert
      expect(result, equals(false));
    });
  });
}
