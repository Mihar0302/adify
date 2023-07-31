import 'package:adify/controller/add_keywords_controller.dart';
import 'package:adify/controller/global_controller.dart';
import 'package:adify/presentation/pages/google_ad_module/widgets/create_campaigns_bottom_sheet.dart';
import 'package:adify/presentation/widgets/custom_appbar.dart';
import 'package:adify/utils/app_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../../domain/auth_services.dart';
import '../../helper/shared_pref_helper.dart';
import '../../utils/app_color.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_popup_widget.dart';
import 'log_in_screen.dart';

class HomeWidget extends StatefulWidget {
  final Size size;

  const HomeWidget({Key? key, required this.size}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final AddKeywordsController addKeywordsController =
      Get.put(AddKeywordsController());
  final GlobalController globalController = Get.put(GlobalController());
  VideoPlayerController? videoPlayerController;
  Future<void>? initVideoFuture;

  RxBool playPush = false.obs;
  Rx<Duration> duration = Duration.zero.obs;
  Rx<Duration> position = Duration.zero.obs;

  String formatTime(int seconds) {
    return "${(Duration(seconds: seconds))}".split(".")[0].padLeft(8, "0");
  }

  videoPlay() async {
    // ignore: deprecated_member_use
    videoPlayerController = VideoPlayerController.network(
        "https://firebasestorage.googleapis.com/v0/b/adify-9b833.appspot.com/o/WhatsApp%20Video%202023-07-31%20at%209.27.00%20AM.mp4?alt=media&token=220692bf-d1f6-4853-ab55-660ffedfffd4")
      ..addListener(() => setState(() {}))
      ..setLooping(true);
    initVideoFuture = videoPlayerController!.initialize();
    videoPlayerController!.setLooping(true);
    videoPlayerController!.setVolume(1.0);
  }

  datatime() {
    videoPlayerController!.addListener(() {
      position.value = videoPlayerController!.value.position;
      duration.value = videoPlayerController!.value.duration;
    });
  }

  @override
  void initState() {
    videoPlay();
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(
            mainLabel: "".toUpperCase(),
            columnShow: false,
            campaing: false,
            widgetShow: true,
            onClick: () {},
            size: widget.size,
            widget: InkWell(
              onTap: () async {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => CustomPopUpWidget(
                    size: widget.size,
                    cancel: () {
                      Get.back();
                    },
                    done: () async {
                      AuthService().signOutWithGoogle();
                      final SharedPreferencesHelper prefs =
                          SharedPreferencesHelper(
                        pref: await SharedPreferences.getInstance(),
                      );
                      globalController.jwt.value = "";
                      globalController.idToken.value = "";
                      globalController.accessToken.value = "";
                      // globalController.dispose();
                      addKeywordsController.dispose();
                      globalController.jwtList.clear();
                      await prefs.setjWT("");
                      FirebaseAuth.instance.signOut();
                      Get.offAll(() => const LoginScreen());
                    },
                    text: "Do you confirm your logout ?",
                  ),
                );
              },
              child: Icon(
                Icons.logout,
                color: AppColor.red,
              ),
            )),
        SizedBox(height: widget.size.height * 0.02),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widget.size.width * 0.05),
                  child: Text(
                    "Hi ${globalController.username.value},",
                    style: TextStyle(
                      letterSpacing: 0.34,
                      fontSize: widget.size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.size.width * 0.05),
                    child: RichText(
                      text: TextSpan(
                        text: "Let's Create ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: AppColor.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Stunning Google Ads',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColor.btnColor),
                          ),
                        ],
                      ),
                    )),
                SizedBox(height: widget.size.height * 0.1),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widget.size.width * 0.05),
                  child: FutureBuilder(
                    future: initVideoFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return AspectRatio(
                          aspectRatio: videoPlayerController!.value.aspectRatio,
                          child: Stack(
                            children: [
                              VideoPlayer(videoPlayerController!),
                              videoPlayerController!.value.isPlaying
                                  ? InkWell(
                                      onTap: () async {
                                        if ((videoPlayerController!
                                            .value.isPlaying)) {
                                          await videoPlayerController!.pause();
                                          playPush.value = false;
                                        } else {
                                          await videoPlayerController!.play();
                                          playPush.value = true;
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(110),
                                        height: widget.size.height * 0.4,
                                        width: widget.size.width,
                                        color: Colors.transparent,
                                        child: Image.asset(
                                          AppImages.pause,
                                          fit: BoxFit.contain,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () async {
                                        if ((videoPlayerController!
                                            .value.isPlaying)) {
                                          await videoPlayerController!.pause();
                                          playPush.value = false;
                                        } else {
                                          await videoPlayerController!.play();
                                          playPush.value = true;
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(110),
                                        height: widget.size.height * 0.4,
                                        width: widget.size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.2),
                                          image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              AppImages.thubmnail,
                                            ),
                                          ),
                                        ),
                                        child: Image.asset(
                                          AppImages.play,
                                          width: widget.size.width * 0.1,
                                          fit: BoxFit.contain,
                                          color: AppColor.white,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            SizedBox(height: widget.size.height * 0.25),
                            const Center(
                              child: CircularProgressIndicator(),
                            ),
                            SizedBox(height: widget.size.height * 0.02),
                          ],
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: widget.size.height * 0.05),
                // InkWell(
                //   onTap: () async {
                //     if ((videoPlayerController!.value.isPlaying)) {
                //       await videoPlayerController!.pause();
                //       playPush.value = false;
                //     } else {
                //       await videoPlayerController!.play();
                //       playPush.value = true;
                //     }
                //   },
                //   child: Container(
                //     padding: const EdgeInsets.all(20),
                //     decoration: BoxDecoration(
                //       color: AppColor.btnColor,
                //       borderRadius: BorderRadius.circular(32),
                //     ),
                //     child: videoPlayerController!.value.isPlaying
                //         ? Image.asset(
                //             AppImages.pause,
                //             fit: BoxFit.contain,
                //             color: AppColor.secondaryColor,
                //             height: widget.size.height * 0.0245,
                //           )
                //         : Image.asset(
                //             AppImages.play,
                //             fit: BoxFit.contain,
                //             color: AppColor.secondaryColor,
                //             height: 20,
                //             width: 20,
                //           ),
                //   ),
                // ),
                SizedBox(height: widget.size.height * 0.06),
              ],
            ),
          ),
        ),
        CustomBtn(
          size: widget.size,
          iconShow: false,
          btnName: "Create New Ad",
          onClick: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      15,
                    ),
                  ),
                ),
                backgroundColor: AppColor.secondaryColor,
                context: context,
                builder: (BuildContext context) {
                  return CreateNewCampaignsWidget(size: widget.size);
                });
          },
        ),
        SizedBox(height: widget.size.height * 0.02),
      ],
    );
  }
}

// class HomeWidget extends StatelessWidget {
//   final Size size;

//   const HomeWidget({Key? key, required this.size}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: ConstrainedBox(
//         constraints:
//             BoxConstraints(maxHeight: size.height - 130, maxWidth: size.width),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: size.height * 0.02),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//               child: Text(
//                 "GOOGLE ADS",
//                 style: TextStyle(

//                   fontSize: size.width * 0.048,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: size.height * 0.005),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//               child: Text(
//                 "7 Days",
//                 style: TextStyle(

//                   fontSize: size.width * 0.038,
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.grey,
//                 ),
//               ),
//             ),
//             SizedBox(height: size.height * 0.05),
//             Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: size.width * 0.08, right: size.width * 0.12),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Clicks",
//                         style: TextStyle(

//                           fontSize: size.width * 0.037,
//                           color: AppColor.grey,
//                         ),
//                       ),
//                       Expanded(child: Container()),
//                       Text(
//                         "Impressions",
//                         style: TextStyle(

//                           fontSize: size.width * 0.037,
//                           color: AppColor.grey,
//                         ),
//                       ),
//                       Expanded(child: Container()),
//                       Text(
//                         "Cost",
//                         style: TextStyle(

//                           fontSize: size.width * 0.037,
//                           color: AppColor.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: size.height * 0.008),
//                 Container(
//                   width: size.width,
//                   padding: EdgeInsets.symmetric(
//                       vertical: size.height * 0.016,
//                       horizontal: size.width * 0.05),
//                   margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//                   decoration: BoxDecoration(
//                     color: AppColor.white,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "785",
//                         style: TextStyle(

//                             fontSize: size.width * 0.05,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.amber),
//                       ),
//                       Expanded(child: Container()),
//                       Text(
//                         "785",
//                         style: TextStyle(

//                             fontSize: size.width * 0.05,
//                             fontWeight: FontWeight.w500,
//                             color: const Color(0xFFA43A94)),
//                       ),
//                       Expanded(child: Container()),
//                       Text(
//                         "\$${785}",
//                         style: TextStyle(

//                           fontSize: size.width * 0.05,
//                           fontWeight: FontWeight.w500,
//                           color: const Color(0xFF7042F4),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             // SizedBox(height: size.height * 0.5),
//             const Spacer(),
//             CustomBtn(
//               size: size,
//               iconShow: false,
//               btnName: "Create New Ad",
//               onClick: () {},
//             ),
//             SizedBox(height: size.height * 0.04),
//           ],
//         ),
//       ),
//     );
//   }
// }
