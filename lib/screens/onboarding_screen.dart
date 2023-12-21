import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter_application_1/shared_components/button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int activeIndex = 0;
  CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              carouselController: controller,
              itemCount: AppConstants.carouselImages.length,
              itemBuilder: (context, index, realIndex) {
                final imageUrl = AppConstants.carouselImages[index];
                return buildCarouselImage(imageUrl, index);
              },
              options: CarouselOptions(
                viewportFraction: 1,
                enableInfiniteScroll: false,
                height: 500,
                onPageChanged: ((index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                }),
              ),
            ),
            const SizedBox(height: 16),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: AppConstants.carouselImages.length,
              effect: const ExpandingDotsEffect(
                expansionFactor: 2,
              ),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              title: 'Next',
              btColor: Colors.deepPurple,
              onTap: () {
                controller.nextPage();
              },
            ),
            const SizedBox(height: 16),
            ButtonWidget(
              title: 'Skip',
              btColor: Colors.grey.shade100,
              onTap: () {
                Navigator.pushNamed(context, "/home");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCarouselImage(String imageUrl, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
