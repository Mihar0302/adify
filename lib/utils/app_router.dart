// ignore_for_file: unused_import

import 'package:adify/models/add_new_keyword_model.dart';
import 'package:adify/presentation/pages/create_campaigns.dart';
import 'package:adify/presentation/pages/google_ad_module/add_keyword_screen.dart';
import 'package:adify/presentation/pages/google_ad_module/ads_budget_screen.dart';
import 'package:adify/presentation/pages/google_ad_module/create_ad_bussiness_screen.dart';
import 'package:adify/presentation/pages/google_ad_module/create_ad_location_screen.dart';
import 'package:adify/presentation/pages/google_ad_module/create_ad_preview_screen.dart';
import 'package:adify/presentation/pages/google_ad_module/get_keyword_ideas.dart';
import 'package:adify/presentation/pages/ads_groups_screen.dart';
import 'package:adify/presentation/pages/edit_ads.dart';
import 'package:adify/presentation/pages/home_screen.dart';
import 'package:adify/presentation/pages/keyword_screen/keywords_screen.dart';
import 'package:adify/presentation/pages/log_in_screen.dart';
import 'package:adify/presentation/pages/my_campaign_screen.dart';
import 'package:adify/presentation/pages/negative_keyword_screen.dart';
import 'package:adify/utils/route_string.dart';
import 'package:flutter/material.dart';

import '../presentation/pages/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case RouteString.SPLASH_SCREEN:
          return const SplashScreen();
        case RouteString.LOGIN_SCREEN:
          return const LoginScreen();
        case RouteString.HOME_SCREEN:
          return const HomeScreen();
        case RouteString.MY_CAMPAIGN_SCREEN:
          return const MyCampaignScreen();
        case RouteString.ADS_GROUPS_SCREEN:
          return const AdsGroupsScreen();
        case RouteString.KEY_WORDS_SCREEN:
          return const KeyWordsScreen();
        case RouteString.NEGATIVE_KEYWORD_SCREEN:
          return const NegativeKeywordScreen();
        case RouteString.EDIT_ADS:
          return const EditAdsScreen();
        // case RouteString.CREATE_AD_LOCATION:
        //   return  CreateAdLocationScreen();
        // case RouteString.ADD_KEYWORD:
        //   return  AddKeyWordScreen(updates: null,);
        case RouteString.GET_KEYWORD_IDEAS:
          return const GetKeywordIdeas();
        // case RouteString.CREATE_AD_PREVIEW:
        //   return CreateAdPriviewScreen();
        // case RouteString.ADS_BUDGET:
        //   return const AdsBudgetScreen();
        case RouteString.CAMPAIGN_CREATE:
          return const CreateCampaignsScreen();
        default:
          return const SplashScreen();
      }
    });
  }
}
