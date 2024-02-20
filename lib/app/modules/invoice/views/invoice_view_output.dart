import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/invoice/views/invoice_view.dart';
import '../controllers/invoice_controller.dart';

class InvoiceViewOutput extends StatelessWidget {
  final InvoiceController invoiceController = Get.put(InvoiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Invoice"),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(16),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                          'FullName : ${invoiceController.fullname.value}'),
                    ),
                    ListTile(
                      title: Text(
                          'Place Of Birth : ${invoiceController.place_of_birth.value}'),
                    ),
                    ListTile(
                      title: Text(
                          'Date Of Birth : ${invoiceController.date_of_birth.value}'),
                    ),
                    ListTile(
                      title: Text('Age : ${invoiceController.age.value}'),
                    ),
                    ListTile(
                      title: Text('Gander : ${invoiceController.gender.value}'),
                    ),
                    ListTile(
                      title: Text('Email : ${invoiceController.email.value} '),
                    ),
                    ListTile(
                      title: Text(
                          'Nationality : ${invoiceController.nationality.value} '),
                    ),
                    ListTile(
                      title: Text(
                          'MemberShip : ${invoiceController.type_membership.value} '),
                    ),
                    ListTile(
                      title: Text(
                          'Card Number : ${invoiceController.card_number.value} '),
                    ),
                    ListTile(
                      title: Text(
                          'Expired Date : ${invoiceController.expire_date.value} '),
                    ),
                    ListTile(
                      title:
                          Text('Payment : ${invoiceController.payment.value} '),
                    ),
                    ListTile(
                      title: Text(
                          'Benefits : ${invoiceController.benefit.value} '),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        invoiceController.resetData();
                        Get.to(InvoiceView());
                      },
                      child: Text("Reset and Back"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
