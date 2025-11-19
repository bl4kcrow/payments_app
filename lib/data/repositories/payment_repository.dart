import 'package:payments_app/data/data.dart';

abstract class PaymentRepository {
  Future<bool> payWithExistingCard({
    required String amount,
    required String currency,
    required CustomCreditCard card,
  });

  Future<bool> payWithNewCard({
    required String amount,
    required String currency,
  });
  
  Future<bool> payWithApplePayGooglePay({
    required String amount,
    required String currency,
  });
}
