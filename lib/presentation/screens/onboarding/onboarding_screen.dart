import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app_klass/common_widgets/common_widgets.dart';
import 'package:flutter_app_klass/core/constants/constants.dart';
import 'package:flutter_app_klass/themes/themes.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _selectedIndex = 0;

  //KImages _images = new KImages();
  // ignore: lines_longer_than_80_chars
  final onBoardingImageList = [
    KImages.onBoarding1,
    KImages.onBoarding2,
    KImages.onBoarding3
  ]; //= DataPush.onBoardingImagesList;
  final onBoardingTitleList = [
    "About TIME !!",
    'Stay in TOUCH!',
    "Payments on a click!"
  ];
  final onBoardingSubtitleList = [
    "Manage your klasses and schedules withutmost ease.",
    "Connecting with your class is just aclick away.",
    "Super smooth payments/ reconciliation withautomated notifications.Sending /receiving payments was neverso easy!"
  ];

  //List onBoardingList=["man","can","do","anything"];
  late PageController _imagePageController;
  late PageController _textPageController;

  @override
  void dispose() {
    _imagePageController.dispose();
    _textPageController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _imagePageController = PageController();
    _textPageController = PageController();
  }

  //Builds the Images in Onboarding
  Widget _buildOnBoardingImages() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: PageView.builder(
            controller: _imagePageController,
            onPageChanged: (index) {
              setState(
                () {
                  _selectedIndex = index;
                },
              );
              _textPageController.animateToPage(index,
                  duration: const Duration(
                    microseconds: 500,
                  ),
                  curve: Curves.linear);
            },
            itemCount: onBoardingImageList.length,
            itemBuilder: (context, index) {
              return Image.asset(
                onBoardingImageList[_selectedIndex]!,
              ); //.pH(10);
            },
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  //Builds text for respective images
  Widget _buildOnBoardingTexts() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2.5,
              child: PageView.builder(
                controller: _textPageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                  _imagePageController.animateToPage(index,
                      duration: const Duration(
                        microseconds: 500,
                      ),
                      curve: Curves.linear);
                },
                itemCount: onBoardingTitleList.length,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KText(
                      //onBoardingList[_selectedIndex],
                      onBoardingTitleList[_selectedIndex]!,
                      variant: TypographyVariant.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    KText(
                      onBoardingSubtitleList[_selectedIndex]!,
                      variant: TypographyVariant.h1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 3,
                    ), //.pH(50),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ),
            if (_selectedIndex == (onBoardingImageList.length - 1))
              KButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                onPressed: () {
                  ///Navigating to [LoginScreen]
                  // NavigationHelpers.pushRelacement(
                  //     context, LoginSelectRoleScreen());
                },
                child: const KText(
                  "Get Started",
                  variant: TypographyVariant.h1,
                  style: TextStyle(
                    color: KColors.secondaryColor,
                  ),
                ),
              )
            else
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: onBoardingImageList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Opacity(
                    opacity: _selectedIndex == index ? 1 : 0.5,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: const CircleAvatar(
                        radius: 6.0,
                        backgroundColor: KColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primaryColor,
      body: Column(
        children: [
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: _buildOnBoardingImages(),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: _buildOnBoardingTexts(),
          ),
        ],
      ),
    );
  }
}
