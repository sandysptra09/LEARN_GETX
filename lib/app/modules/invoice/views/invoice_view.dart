import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/invoice_controller.dart';

class InvoiceView extends StatelessWidget {
  InvoiceView({Key? key}) : super(key: key);

  final InvoiceController invoiceController = Get.put(InvoiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('InvoiceView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, right: 10, left: 10),
                          color: Colors.blue[100],
                          child: Text(
                            "Personal Information",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Full Name'),
                            onChanged: (value) =>
                                invoiceController.fullname.value = value,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Place of Birth'),
                            onChanged: (value) =>
                                invoiceController.place_of_birth.value = value,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () => invoiceController.dateOfBirth(context),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'Date of Birth',
                                hintText: 'Please input your date of birth',
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(() => Text(
                                      invoiceController.date_of_birth.value)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 0, bottom: 5, left: 10, right: 10),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Gender",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Row(
                                children: [
                                  Obx(() => Radio(
                                        value: 'Man',
                                        groupValue:
                                            invoiceController.gender.value,
                                        onChanged: (value) => invoiceController
                                            .gender.value = value!,
                                      )),
                                  Text('Man'),
                                  Obx(() => Radio(
                                        value: 'Woman',
                                        groupValue:
                                            invoiceController.gender.value,
                                        onChanged: (value) => invoiceController
                                            .gender.value = value!,
                                      )),
                                  Text('Woman'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Email'),
                            onChanged: (value) =>
                                invoiceController.email.value = value,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Nationality'),
                            onChanged: (value) =>
                                invoiceController.nationality.value = value,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40, bottom: 30),
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, right: 10, left: 10),
                          color: Colors.blue[100],
                          child: Text(
                            "Type of Membership",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Obx(() => Radio(
                                      value: 'Reguler',
                                      groupValue: invoiceController
                                          .type_membership.value,
                                      onChanged: (value) => invoiceController
                                          .setTypeMembership(value!),
                                    )),
                                Text('Reguler'),
                              ],
                            ),
                            Row(
                              children: [
                                Obx(() => Radio(
                                      value: 'Gold',
                                      groupValue: invoiceController
                                          .type_membership.value,
                                      onChanged: (value) => invoiceController
                                          .setTypeMembership(value!),
                                    )),
                                Text('Gold'),
                              ],
                            ),
                            Row(
                              children: [
                                Obx(() => Radio(
                                      value: 'Premium',
                                      groupValue: invoiceController
                                          .type_membership.value,
                                      onChanged: (value) => invoiceController
                                          .setTypeMembership(value!),
                                    )),
                                Text('Premium'),
                              ],
                            ),
                            Row(
                              children: [
                                Obx(() => Radio(
                                      value: 'VIP',
                                      groupValue: invoiceController
                                          .type_membership.value,
                                      onChanged: (value) => invoiceController
                                          .setTypeMembership(value!),
                                    )),
                                Text('VIP'),
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 10),
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, right: 10, left: 10),
                          color: Colors.blue[100],
                          child: Text(
                            "Payment Details",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Card Number',
                            ),
                            onChanged: (value) =>
                                invoiceController.card_number.value = value,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () => invoiceController.expireDate(context),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'Expire Date',
                                hintText:
                                    'Please input your expire date for the payment',
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(() => Text(
                                      invoiceController.expire_date.value)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                "Payment : ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Obx(() => Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color:
                                              Colors.grey, // Warna garis bawah
                                          width: 2, // Lebar garis bawah
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      "Rp." + invoiceController.payment.value,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => invoiceController.submitForm(),
                          child: Text('Submit'),
                        ),
                        SizedBox(height: 16.0),
                        Obx(() {
                          if (invoiceController.isFormSubmitted.value) {
                            return Text(
                              'Output: ${invoiceController.fullname}, ${invoiceController.place_of_birth}, ${invoiceController.date_of_birth}, ${invoiceController.gender}, ${invoiceController.email}, ${invoiceController.nationality}, ${invoiceController.type_membership}, ${invoiceController.card_number}, ${invoiceController.expire_date}, ${invoiceController.payment}',
                              style: TextStyle(fontSize: 16.0),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
