import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learn_getx/app/modules/invoice/views/invoice_view_output.dart';

class InvoiceController extends GetxController {
  // state for personal information
  var fullname = ''.obs;
  var place_of_birth = ''.obs;
  var date_of_birth = ''.obs;
  var age = ''.obs;
  var gender = ''.obs;
  var email = ''.obs;
  var nationality = ''.obs;

  Future<void> dateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (picked != null) {
      final currentDate = DateTime.now();
      final ageResult = currentDate.year -
          picked.year -
          ((currentDate.month > picked.month ||
                  (currentDate.month == picked.month &&
                      currentDate.day >= picked.day))
              ? 0
              : 1);

      date_of_birth.value = DateFormat('yyyy-MM-dd').format(picked);
      age.value = ageResult.toString();
    }
  }

  // state for type of membership
  var type_membership = ''.obs;
  var benefit = ''.obs;

  // state for payment details
  var card_number = ''.obs;
  var expire_date = ''.obs;
  var payment = ''.obs;

  void setTypeMembership(String type) {
    type_membership.value = type;

    if (type == 'Reguler') {
      payment.value = '50000';
      benefit.value = 'Membership 1 month';
    } else if (type == 'Gold') {
      payment.value = '150000';
      benefit.value = 'Membership 1 month and free snacks';
    } else if (type == 'Premium') {
      payment.value = '250000';
      benefit.value = 'Membership 2 months, free snacks, and free Wi-fi';
    } else if (type == 'VIP') {
      payment.value = '500000';
      benefit.value =
          'Membership 3 months, free snacks, free Wi-fi, and concer tickets';
    } else {
      payment.value = '';
      benefit.value = '';
    }
    print('Payment: ${payment.value}, Benefit: ${benefit.value}');
  }

  Future<void> expireDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));

    if (picked != null) {
      final expired = picked.add(Duration(days: 7));
      final formattedDate = DateFormat('yyyy-MM-dd').format(expired);
      expire_date.value = formattedDate;
    }
  }

  var isFormSubmitted = false.obs;

  void submitForm() {
    '$fullname, $place_of_birth, $date_of_birth, $age, $gender, $email, $nationality, $setTypeMembership(type), $card_number, $expire_date';
    isFormSubmitted.value = true;
    Get.to(InvoiceViewOutput());
  }

  // reset form data
  void resetData() {
    fullname.value = '';
    place_of_birth.value = '';
    date_of_birth.value = '';
    gender.value = '';
    email.value = '';
    nationality.value = '';
    type_membership.value = '';
    card_number.value = '';
    expire_date.value = '';
    payment.value = '';
    benefit.value = '';
  }
}
