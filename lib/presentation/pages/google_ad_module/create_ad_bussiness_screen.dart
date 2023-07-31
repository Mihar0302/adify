import 'package:adify/presentation/pages/google_ad_module/create_ad_location_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:adify/presentation/widgets/custom_text_feild.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:get/get.dart';
import '../../../controller/add_keywords_controller.dart';
import '../../../controller/global_controller.dart';
import '../../../models/lists.dart';
import '../../widgets/string_stream.dart';
import 'widgets/next_buttoon_widget.dart';

class CreateAdBusinessScreen extends StatefulWidget {
  final String campaingId;
  final bool update;

  const CreateAdBusinessScreen({
    super.key,
    required this.campaingId,
    this.update = false,
  });

  @override
  State<CreateAdBusinessScreen> createState() => _CreateAdBusinessScreenState();
}

class _CreateAdBusinessScreenState extends State<CreateAdBusinessScreen> {
  final _formKey = GlobalKey<FormState>();

  final AddKeywordsController addKeywordsController =
      Get.put(AddKeywordsController());
  final GlobalController globalController = Get.find();

  final stringData = StringStream();
  RxString flag = "🇮🇳".obs;

  Widget locationData() {
    return InkWell(
      onTap: () {
        showCountryPicker(
          context: context,
          showPhoneCode: true,
          // optional. Shows phone code before the country name.
          onSelect: (Country country) {
            addKeywordsController.countryCode.value = country.countryCode;
            debugPrint("===> ${addKeywordsController.countryCode.value}");
            flag.value = country.flagEmoji;
          },
        );
      },
      child: Container(
        width: 80,
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(flag.value, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 5),
            const Icon(Icons.keyboard_arrow_down_outlined),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    debugPrint("====> uodate CreateAdBusinessScreen ===> ${widget.update}");
    if (widget.update) {
      addKeywordsController.updateData(campaingId: widget.campaingId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackColor,
      appBar: appBar(context, size),
      body: Obx(
        () => addKeywordsController.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: size.height -
                            (AppBar().preferredSize.height +
                                MediaQuery.of(context).padding.top),
                        maxWidth: size.width),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: SingleChildScrollView(
                        child: Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: size.height * 0.02),
                              headerWidget(size),
                              SizedBox(height: size.height * 0.022),
                              progressWidget(size),
                              SizedBox(height: size.height * 0.04),
                              Text(
                                textAlign: TextAlign.center,
                                "Share details about your business and our AI will take care of the rest",
                                style: TextStyle(
                                  fontSize: size.width * 0.038,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: size.height * 0.06),
                              businessNameField(size),
                              SizedBox(height: size.height * 0.03),
                              CustomTextFild(
                                label: "Select Category (eg: Dentist)",
                                validator: (value) {
                                  if (addKeywordsController
                                      .categoryCtrl.text.isEmpty) {
                                    return "Please Select Category";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (val) {
                                  debugPrint("ffff");
                                  filter(addKeywordsController.categoryCtrl.text
                                      .toLowerCase());
                                  // setState(() {});
                                },
                                // button: PopupMenuButton(
                                //   icon: const Icon(
                                //     Icons.arrow_drop_down,
                                //     size: 30,
                                //   ),
                                //   onSelected: (value) {
                                //     addKeywordsController.categoryCtrl.text =
                                //         value.toString();
                                //     debugPrint(
                                //         "===> category ===> ${addKeywordsController.categoryCtrl.text}");
                                //   },
                                //   itemBuilder: (BuildContext context) {
                                //     return AppList.categoryList
                                //         .map<PopupMenuItem>((value) {
                                //       return PopupMenuItem(
                                //           value: value, child: Text(value));
                                //     }).toList();
                                //   },
                                // ),
                                size: size,
                                hint: "Category",
                                controller: addKeywordsController.categoryCtrl,
                              ),
                              addKeywordsController.search.isEmpty
                                  ? const SizedBox(
                                      height: 0,
                                    )
                                  : SizedBox(
                                      height: Get.height / 3,
                                      child: ListView.builder(
                                        shrinkWrap: false,
                                        itemCount:
                                            addKeywordsController.search.length,
                                        // physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                InkWell(
                                          onTap: () {
                                            addKeywordsController
                                                    .categoryCtrl.text =
                                                addKeywordsController
                                                    .search[index]
                                                    .toString();
                                            addKeywordsController.search
                                                .clear();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                                addKeywordsController
                                                    .search[index],
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: size.height * 0.03),
                              productServicesField(size),
                              SizedBox(height: size.height * 0.03),
                              Obx(() => landingPageField(size)),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              widget.update
                                  ? Center(
                                      child: UpdateBtn(
                                        size: size,
                                        btnName: "Save & Update",
                                        onClick: () {
                                          debugPrint(
                                              "====> adid ===> ${addKeywordsController.adId.value}");
                                          if (addKeywordsController
                                              .websiteUrl.text.isNotEmpty) {
                                            addKeywordsController
                                                .Updateadsurlapicall(
                                              path1: 'path1',
                                              path2: 'path2',
                                              url:
                                                  "https://${addKeywordsController.websiteUrl.text}/",
                                              adId: addKeywordsController
                                                  .adId.value,
                                            );
                                          }
                                          if (addKeywordsController
                                              .phoneNumber.text.isNotEmpty) {
                                            addKeywordsController
                                                .Calladsapicall(
                                                    campaignId:
                                                        addKeywordsController
                                                            .campaingId.value,
                                                    phoneCountry:
                                                        addKeywordsController
                                                            .countryCode.value,
                                                    phoneNumber:
                                                        addKeywordsController
                                                            .phoneNumber.text);
                                          }
                                        },
                                      ),
                                    )
                                  : Container(),
                              SizedBox(height: size.height * 0.01),
                              Obx(
                                () => addKeywordsController.loading.value
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 3,
                                        ),
                                      )
                                    : NextButtonWidget(
                                        size: size,
                                        globalController: globalController,
                                        onClick: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            addKeywordsController.keywordsList
                                                .clear();
                                            addKeywordsController
                                                .keywordsApiCall(onTap: () {
                                              Get.to(
                                                () => CreateAdLocationScreen(
                                                  update: widget.update,
                                                ),
                                              );
                                            });
                                          }
                                        },
                                        title: 'Next',
                                      ),
                              ),
                              SizedBox(height: size.height * 0.02),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void filter(String inputString) {
    addKeywordsController.search.value = AppList.categoryList
        .where((i) => i.toLowerCase().contains(inputString))
        .toList();
    debugPrint("==========>filter<==========${addKeywordsController.search}");
  }

  Widget landingPageField(Size size) {
    return CustomTextFild(
      max: true,
      location: Center(child: locationData()),
      label: "Phone Number",
      margin: false,
      validator: (value) {
        if (addKeywordsController.phoneNumber.text.isEmpty) {
          return "Please Enter Number";
        } else if (addKeywordsController.phoneNumber.text.isNum) {
        } else {
          return "Enter valid number";
        }
        return null;
      },
      numberKeyboard: true,
      size: size,
      hint: "Enter phone number",
      controller: addKeywordsController.phoneNumber,
    );
  }

  Widget productServicesField(Size size) {
    return CustomTextFild(
      label: "Website URL (eg:www.google.com)",
      margin: false,
      size: size,
      validator: (value) {
        if (addKeywordsController.websiteUrl.text.isEmpty) {
          return "Please Enter Website URL";
        } else {
          return null;
        }
      },
      hint: "for ex.www.google.com",
      controller: addKeywordsController.websiteUrl,
    );
  }

  Widget businessNameField(Size size) {
    return CustomTextFild(
      label: "Enter Your Brand/Company Name",
      margin: false,
      validator: (value) {
        if (addKeywordsController.businessNameCtrl.text.isEmpty) {
          return "Please Enter Name";
        } else {
          return null;
        }
      },
      size: size,
      hint: "Company Name",
      controller: addKeywordsController.businessNameCtrl,
    );
  }

  Widget progressWidget(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: size.height * 0.013,
          width: size.width / 4.8,
          decoration: BoxDecoration(
              color: AppColor.black, borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: size.height * 0.013,
          width: size.width / 4.8,
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: size.height * 0.013,
          width: size.width / 4.8,
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: size.height * 0.013,
          width: size.width / 4.8,
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(50)),
        )
      ],
    );
  }

  Widget headerWidget(Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Business",
          style: TextStyle(
            letterSpacing: 0.34,
            fontWeight: FontWeight.w600,
            fontSize: size.width * 0.036,
            color: AppColor.black,
          ),
        ),
        SizedBox(width: size.width * 0.012),
        slashWidget(size),
        SizedBox(width: size.width * 0.009),
        Text(
          "Location",
          style: TextStyle(
            letterSpacing: 0.34,
            color: AppColor.textGreyColor,
            fontSize: size.width * 0.036,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: size.width * 0.012),
        slashWidget(size),
        SizedBox(width: size.width * 0.009),
        Text(
          "Preview",
          style: TextStyle(
            letterSpacing: 0.34,
            color: AppColor.textGreyColor,
            fontSize: size.width * 0.036,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: size.width * 0.012),
        slashWidget(size),
        SizedBox(width: size.width * 0.009),
        Text(
          'Budget',
          style: TextStyle(
            letterSpacing: 0.34,
            color: AppColor.textGreyColor,
            fontSize: size.width * 0.036,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Text slashWidget(Size size) {
    return Text(
      "/",
      style: TextStyle(
        letterSpacing: 0.34,
        color: AppColor.textGreyColor,
        fontSize: size.width * 0.036,
        fontWeight: FontWeight.w500,
      ),
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
              top: size.height * 0.023,
              bottom: size.height * 0.023,
              left: size.width * 0.04,
              right: size.width * 0.04),
          child: InkWell(
            onTap: () {},
            child: Image.asset(AppImages.bell, height: size.height * 0.028),
          ),
        ),
      ],
    );
  }
}

class UpdateBtn extends StatelessWidget {
  final Size size;
  final String btnName;
  final Function onClick;

  const UpdateBtn(
      {Key? key,
      required this.size,
      required this.btnName,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.height * 0.017,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28), color: AppColor.btnColor),
        child: Text(
          btnName,
          style: TextStyle(
            color: AppColor.white,
            fontSize: size.width * 0.04,
          ),
        ),
      ),
    );
  }
}
