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
            const Spacer(),
            CarouselSlider.builder(
              carouselController: controller,
              itemCount: AppConstants.carouselImages.length,
              itemBuilder: (context, index, realIndex) {
                final imageUrl = AppConstants.carouselImages[index]['image'];
                return buildCarouselImage(imageUrl, index);
              },
              options: CarouselOptions(
                viewportFraction: 1,
                enableInfiniteScroll: false,
                height: 670,
                onPageChanged: ((index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                }),
              ),
            ),
            const SizedBox(height: 32),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: AppConstants.carouselImages.length,
              effect: ExpandingDotsEffect(
                dotColor: Colors.blueAccent.shade100,
                activeDotColor: Colors.blueAccent.shade700,
                dotHeight: 10,
                dotWidth: 10,
                expansionFactor: 1.9,
              ),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              title: (activeIndex == 2) ? 'Get Started' : 'Next',
              titleColor: Colors.white,
              btColor: Colors.blueAccent.shade700,
              onTap: () {
                if (activeIndex == 2) {
                  Navigator.pushNamed(context, '/login');
                } else {
                  controller.nextPage();
                }
              },
            ),
            // const SizedBox(height: 24),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildCarouselImage(String imageUrl, int index) {
    return Column(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            AppConstants.carouselImages[index]['title'],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            AppConstants.carouselImages[index]['description'],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
