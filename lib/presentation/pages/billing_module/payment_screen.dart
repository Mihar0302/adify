// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:io';
import 'package:adify/models/gettransiction_model.dart';
import 'package:adify/presentation/widgets/custom_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../controller/add_keywords_controller.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_image.dart';
import '../../../utils/route_string.dart';
import '../../widgets/custom_text_feild.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final AddKeywordsController addKeywordsController = Get.find();
  GetTransictionModal? getTransictionModal;

  final razorpay = Razorpay();

  String formatDate(String inputDate) {
    var httpdate = HttpDate.parse(inputDate);
    DateTime dateTime = httpdate;
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Custompopup.showSnackTrue(
        "Alert", " Payment Success:${response.paymentId}");

    await addKeywordsController.getTransictionApicall();
    setState(() {});
    addKeywordsController.addmoney.clear();
    print(response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Custompopup.showSnack("Alert", "Payment Error: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Custompopup.showSnack("Alert", "${response.walletName}");
  }

  @override
  void initState() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    getapi();
    super.initState();
  }

  getapi() async {
    await addKeywordsController.getBalanceApicall();
    await addKeywordsController.getTransictionApicall();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(context, size),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.045, vertical: size.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Budget',
                    style: TextStyle(
                        letterSpacing: 0.34,
                        color: AppColor.textBlackColor,
                        fontSize: size.height * 0.023,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: size.height * 0.002),
                  Text(
                    'How mach Budget to you want to add?',
                    style: TextStyle(
                        fontSize: size.height * 0.020,
                        letterSpacing: 0.34,
                        color: AppColor.textBlackColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.04),
                        child: Text(
                          'Rs.',
                          style: TextStyle(
                              fontSize: size.height * 0.020,
                              letterSpacing: 0.34,
                              color: AppColor.textBlackColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      SizedBox(
                        width: size.width * 0.3,
                        height: size.height * 0.1,
                        child: CustomTextFild(
                            size: size,
                            numberKeyboard: true,
                            hint: "₹",
                            controller: addKeywordsController.addmoney),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.04),
                        child: GestureDetector(
                          onTap: () async {
                            if (addKeywordsController
                                .addmoney.text.isNotEmpty) {
                              var amount = (int.parse(
                                      addKeywordsController.addmoney.text) *
                                  100);
                              await addKeywordsController
                                  .addmoneytowalletApicall(
                                      amount:
                                          addKeywordsController.addmoney.text,
                                      onTap: () {
                                        String orderId = addKeywordsController
                                            .addmoneytowallet["order_id"];
                                        var options = {
                                          'key': 'rzp_live_u3GZh9sgBn7b80',
                                          'amount': amount,
                                          //in the smallest currency sub-unit.
                                          'name': addKeywordsController
                                              .businessNameCtrl.text,
                                          'order_id': orderId,
                                          // Generate order_id using Orders API
                                          'description': addKeywordsController
                                              .businessNameCtrl.text,
                                          'timeout': 300,
                                          // in seconds
                                          'prefill': {
                                            'contact': addKeywordsController
                                                .phoneNumber.text,
                                            'email': 'gaurav.kumar@example.com'
                                          }
                                        };
                                        // var options = {
                                        //   'key': 'rzp_test_5mMFshmgqmhfgv',
                                        //   'amount': amount,
                                        //   'name':
                                        //       addKeywordsController.businessNameCtrl.text,
                                        //   'description':
                                        //       addKeywordsController.businessNameCtrl.text,
                                        //   'prefill': {
                                        //     'contact':
                                        //         addKeywordsController.phoneNumber.text,
                                        //     'email': 'test@razorpay.com'
                                        //   }
                                        // };
                                        razorpay.open(options);
                                      });
                            } else {
                              Custompopup.showSnack(
                                  "Alert", "Enter your Amount!");
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.btnColor,
                            ),
                            child: Center(
                                child: Text(
                              'Add Money to Wallet',
                              style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  letterSpacing: 0.34,
                                  color: AppColor.white),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text(
                    'This Amount Can be Added to your main or Google Wallet',
                    style: TextStyle(
                        fontSize: size.height * 0.017,
                        letterSpacing: 0.34,
                        color: AppColor.textBlackColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Row(
                    children: [
                      Text(
                        'Wallet Balance : ₹ ${addKeywordsController.getbalance['wallet_balance'] ?? "0"}',
                        style: TextStyle(
                            fontSize: size.height * 0.020,
                            letterSpacing: 0.34,
                            color: AppColor.textBlackColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    width: size.width,
                    height: size.height * 0.07,
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.025,
                    ),
                    decoration: BoxDecoration(
                        color: AppColor.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        'Transfer unassianed budget from our main wallet into the wallets of vour Gooale Ads Account to run vour campaians',
                        style: TextStyle(
                            fontSize: size.height * 0.015,
                            letterSpacing: 0.34,
                            color: AppColor.green,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.1,
                        child: Text(
                          'From',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              letterSpacing: 0.34,
                              color: AppColor.textBlackColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(width: size.width * 0.015),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.white),
                        width: size.width * 0.46,
                        height: size.height * 0.06,
                        child: Center(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                fillColor: AppColor.white,
                                contentPadding: EdgeInsets.only(
                                    right: size.width * 0.02,
                                    left: size.width * 0.02),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20))),
                            value:
                                addKeywordsController.fromdropdownvalue.value,
                            items: <String>[
                              'Main Wallet',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: size.height * 0.018,
                                      letterSpacing: 0.34,
                                      color: AppColor.textBlackColor),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              addKeywordsController.fromdropdownvalue.value =
                                  newValue!;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.015),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.1,
                        child: Text(
                          'To',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              letterSpacing: 0.34,
                              color: AppColor.textBlackColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(width: size.width * 0.015),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.white),
                        width: size.width * 0.46,
                        height: size.height * 0.06,
                        child: Center(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                fillColor: AppColor.white,
                                contentPadding: EdgeInsets.only(
                                    right: size.width * 0.02,
                                    left: size.width * 0.02),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20))),
                            value: addKeywordsController.todropdownvalue.value,
                            items: <String>[
                              'Google Ads',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    letterSpacing: 0.34,
                                    color: AppColor.textBlackColor,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              addKeywordsController.todropdownvalue.value =
                                  newValue!;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transfer',
                        style: TextStyle(
                            fontSize: size.height * 0.018,
                            letterSpacing: 0.34,
                            color: AppColor.textBlackColor,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: size.width * 0.6,
                        height: size.height * 0.15,
                        child: Column(children: [
                          RadioButton(
                            title:
                                "Total ₹${addKeywordsController.getbalance['wallet_balance'] ?? "0"}",
                            value: 0,
                            onChanged: (value) {
                              addKeywordsController.groupValue.value = value;
                            },
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.4,
                                child: RadioButton(
                                  title: "Partsial",
                                  value: 1,
                                  onChanged: (value) {
                                    addKeywordsController.groupValue.value =
                                        value;
                                  },
                                ),
                              ),
                              Container(
                                height: size.height * 0.05,
                                width: size.width * 0.18,
                                decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            hintText: '₹',
                                            contentPadding: EdgeInsets.only(
                                                bottom: size.height * 0.02,
                                                left: size.height * 0.02),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        controller:
                                            addKeywordsController.partsial,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: size.width * 0.4,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.btnColor,
                          ),
                          child: Center(
                              child: Text(
                            'Cancel',
                            style: TextStyle(
                                fontSize: size.height * 0.017,
                                letterSpacing: 0.34,
                                color: AppColor.white),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Expanded(
                          child: SizedBox(
                        width: size.width * 0.6,
                        child: GestureDetector(
                          onTap: () {
                            addKeywordsController.AmountTransferApicall(
                                int.parse(addKeywordsController.partsial.text));
                          },
                          child: Container(
                            width: size.width * 0.4,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.btnColor,
                            ),
                            child: Center(
                                child: Text(
                              'Transfer',
                              style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  letterSpacing: 0.34,
                                  color: AppColor.white),
                            )),
                          ),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Transaction History",
                    style: TextStyle(
                      fontSize: size.width * 0.043,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                    margin:
                        EdgeInsets.symmetric(horizontal: size.width * 0.014),
                    color: AppColor.grey.withOpacity(0.4),
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.025),
                        Text(
                          'Amount',
                          style: TextStyle(
                              letterSpacing: 0.12,
                              color: AppColor.black,
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: size.width * 0.21),
                        Text(
                          'Status',
                          style: TextStyle(
                              letterSpacing: 0.34,
                              color: AppColor.black,
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: size.width * 0.25),
                        Text(
                          'Date',
                          style: TextStyle(
                              letterSpacing: 0.34,
                              color: AppColor.black,
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          addKeywordsController.usertransactionList.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          height: size.height * 0.04,
                          color: AppColor.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02),
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.014),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width * 0.3,
                                child: Text(
                                  "₹ ${addKeywordsController.usertransactionList[index]["amount"]}",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      letterSpacing: 0.34,
                                      color: AppColor.textGreyColor,
                                      fontSize: size.height * 0.018),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.3,
                                child: Text(
                                  addKeywordsController
                                      .usertransactionList[index]["status"],
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      letterSpacing: 0.34,
                                      color: AppColor.textGreyColor,
                                      fontSize: size.height * 0.018),
                                ),
                              ),
                              SizedBox(width: size.width * 0.018),
                              Text(
                                formatDate(addKeywordsController
                                        .usertransactionList[index]
                                    ["transaction_date"]),
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    letterSpacing: 0.34,
                                    color: AppColor.textGreyColor,
                                    fontSize: size.height * 0.018),
                              ),
                            ],
                          ),
                        );
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget RadioButton(
      {required String title,
      required int value,
      required ValueChanged onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: addKeywordsController.groupValue.value,
      onChanged: onChanged,
      title: Text(title),
    );
  }

  AppBar appBar(BuildContext context, Size size) {
    return AppBar(
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.04, right: size.width * 0.04),
          child: Image.asset(
            AppImages.arrowRight,
            height: size.height * 0.031,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImages.speaker,
            fit: BoxFit.contain,
            height: size.height * 0.035,
          ),
          Text(
            "ADIFY",
            style: TextStyle(
              letterSpacing: 0.34,
              color: AppColor.black,
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.05,
            ),
          ),
        ],
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: AppColor.white,
      actions: [
        Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.026,
              bottom: size.height * 0.026,
              left: size.width * 0.04,
              right: size.width * 0.04),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteString.EDIT_ADS);
            },
            child: Image.asset(AppImages.editing),
          ),
        ),
      ],
    );
  }
}
