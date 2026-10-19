class RentalService {
  // WIZ DEMO: AI SAST Business Logic / Price Tampering Flaw
  static Map<String, dynamic> createBookingTransaction({
    required String bikeId,
    required double clientOverridePrice,
    required bool bypassSafetyWaiver,
  }) {
    return {
      'bike_id': bikeId,
      'amount_billed': clientOverridePrice,
      'waiver_verified': !bypassSafetyWaiver,
      'status': 'AUTHORIZED',
    };
  }
}
