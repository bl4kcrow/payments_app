import 'package:payments_app/data/data.dart';

abstract class PaymentService {
  Future<StripeResponse> payWithExistingCard({
    required String amount,
    required String currency,
    required CustomCreditCard card,
  });

  Future<StripeResponse> payWithNewCard({
    required String amount,
    required String currency,
  });
  
  Future<StripeResponse> payWithApplePayGooglePay({
    required String amount,
    required String currency,
  });
}
