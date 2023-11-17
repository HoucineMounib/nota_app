import 'package:flutter/material.dart';
import 'package:nota_app/components/build_custom_indicator.dart';
import 'package:nota_app/components/custom_buttons.dart';
import 'package:nota_app/models/onboarding_model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<OnboardData> pages = [
    OnboardData(
        title: 'Get Organized Instantly',
        description:
            'Welcome to Nota – Your new favorite companion for staying organized. Create, edit, and organize your notes effortlessly.',
        image: 'assets/onboard 01.png'),
    OnboardData(
        title: 'Level Up Your Prodactivity',
        description:
            'Our intuitive interface lets you create and customize notes in a snap. Capture your ideas with simplicity and style.',
        image: 'assets/onboard 02.png'),
    OnboardData(
        title: 'Create Free Notes & Collaborate With Your Team',
        description:
            ' With Nota, sharing ideas and working together has never been smoother',
        image: 'assets/onboard 03.png'),
  ];
  int currentindex = 0;

  final controller = PageController(initialPage: 0);

  _onchange(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
            itemCount: pages.length,
            controller: controller,
            onPageChanged: _onchange,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () => controller.animateToPage(2,
                                duration: const Duration(milliseconds: 900),
                                curve: Curves.ease),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .primaryColorDark
                                      .withOpacity(.5)),
                            )),
                      ),
                    ),
                    Expanded(flex: 3, child: Image.asset(pages[index].image)),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            pages[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontSize: 26,
                                height: 1.5,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            pages[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .hintColor
                                    .withOpacity(0.7),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIndicator(
                          currentIndex: currentindex,
                        ),
                        PrimaryButton(
                          currentPagr: index,
                          onTap: () => index == 2
                              ? Navigator.of(context).pushNamed('home')
                              : controller.nextPage(
                                  duration: Duration(milliseconds: 350),
                                  curve: Curves.easeInOut),
                        )
                      ],
                    ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
