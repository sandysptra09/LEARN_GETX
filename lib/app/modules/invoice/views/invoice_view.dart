import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/invoice_controller.dart';

class InvoiceView extends StatelessWidget {
  InvoiceView({Key? key}) : super(key: key);

  final InvoiceController invoiceController = Get.put(InvoiceController());

  int _selectedIndex = 2;

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
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                        onChanged: (value) =>
                            invoiceController.fullname.value = value,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Place of Birth',
                            prefixIcon: Icon(Icons.place)),
                        onChanged: (value) =>
                            invoiceController.place_of_birth.value = value,
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () => invoiceController.dateOfBirth(context),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Date of Birth',
                            hintText: 'Please input your date of birth',
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() =>
                                  Text(invoiceController.date_of_birth.value)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Icon(Icons.person_pin_rounded)),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Text(
                                  "Gender",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 27, top: 5),
                        child: Row(
                          children: [
                            Obx(() => Radio(
                                  value: 'Man',
                                  groupValue: invoiceController.gender.value,
                                  onChanged: (value) =>
                                      invoiceController.gender.value = value!,
                                )),
                            Text('Man'),
                            Obx(() => Radio(
                                  value: 'Woman',
                                  groupValue: invoiceController.gender.value,
                                  onChanged: (value) =>
                                      invoiceController.gender.value = value!,
                                )),
                            Text('Woman'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email', prefixIcon: Icon(Icons.email)),
                        onChanged: (value) =>
                            invoiceController.email.value = value,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Nationality',
                            prefixIcon: Icon(Icons.approval)),
                        onChanged: (value) =>
                            invoiceController.nationality.value = value,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Type of Membership",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Obx(() => Radio(
                                    value: 'Reguler',
                                    groupValue:
                                        invoiceController.type_membership.value,
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
                                    groupValue:
                                        invoiceController.type_membership.value,
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
                                    groupValue:
                                        invoiceController.type_membership.value,
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
                                    groupValue:
                                        invoiceController.type_membership.value,
                                    onChanged: (value) => invoiceController
                                        .setTypeMembership(value!),
                                  )),
                              Text('VIP'),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Payment Details",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Card Number'),
                        onChanged: (value) =>
                            invoiceController.card_number.value = value,
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () => invoiceController.expireDate(context),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Expire Date',
                            hintText:
                                'Please input your expire date for the payment',
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() =>
                                  Text(invoiceController.expire_date.value)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Payment : ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Obx(() => Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey, // Warna garis bawah
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
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => invoiceController.submitForm(),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.grey,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
                GButton(
                  icon: Icons.collections_bookmark_outlined,
                  text: 'Invoice',
                ),
                GButton(
                  icon: Icons.account_tree_outlined,
                  text: 'Category',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                (() {
                  _selectedIndex = index;
                });
                switch (index) {
                  case 0:
                    Get.toNamed('/home');
                    break;
                  case 1:
                    Get.toNamed('/profile');
                    break;
                  case 2:
                    Get.toNamed('/invoice');
                    break;
                  case 3:
                    Get.toNamed('/category');
                    break;
                  default:
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
