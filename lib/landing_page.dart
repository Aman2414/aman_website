import 'package:aman_website/services_widget.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  double resumeHeight = 40, resumeWidth = 150;
  bool downloadResumeHover = false;
  var servicesHovered = [false, false];
  late Animation<Color?> web_animation, app_animation;
  late AnimationController app_controller, web_controller;

  void initState() {
    super.initState();
    app_controller = AnimationController(duration: Duration.zero, vsync: this);
    web_controller = AnimationController(duration: Duration.zero, vsync: this);

    web_animation = ColorTween(begin: Colors.black, end: Colors.white)
        .animate(web_controller);
    app_animation = ColorTween(begin: Colors.black, end: Colors.white)
        .animate(app_controller);
  }

  void web_animateColor(bool isHovered) {
    isHovered ? web_controller.forward() : web_controller.reverse();
  }

  void app_animateColor(bool isHovered) {
    isHovered ? app_controller.forward() : app_controller.reverse();
  }

  designing_content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Designing With Passion While Exploring The World.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Hello WOrld how are you i am fine heelo world hello world hello world hello world hello world hello world hello world hello world hello world Hello WOrld how are you i am fine heelo world hello world hello world hello world hello world",
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Hello WOrld how are you i am fine heelo world hello world hello world hello world hello world",
        ),
      ],
    );
  }

  getHeight(BoxConstraints constraint) {
    if (constraint.maxWidth > 1200) {
      return 240;
    } else if (constraint.maxWidth > 800 && constraint.maxWidth < 1200) {
      return 240;
    } else {
      return 300;
    }
  }

  getServicesHeight(BoxConstraints constraint) {
    if (constraint.maxWidth > 800) {
      return 340;
    } else if (constraint.maxWidth < 800 && constraint.maxWidth > 400) {
      return 340;
    } else {
      return 450;
    }
  }

  getImageSize(BoxConstraints constraint) {
    if (constraint.maxWidth > 1200) {
      return 90;
    } else if (constraint.maxWidth > 800 && constraint.maxWidth < 1200) {
      return 80;
    } else {
      return 70;
    }
  }

  website_design_services(BoxConstraints constraints) {
    return ServicesWidget(
      titleColor: web_animation.value,
      height: getServicesHeight(constraints),
      onTap: () {},
      onHover: (val) {
        setState(() {
          servicesHovered[0] = val;
          web_animateColor(val);
        });
      },
      isHovered: servicesHovered[0],
      title1: "Website Design",
      title2:
          "Free resource that will help and Understand the cv design process and improve the understand and the design process andisi impor of quality",
      imageUrl: "images/website_img.png",
    );
  }

  app_design_services(BoxConstraints constraints) {
    return ServicesWidget(
      height: getServicesHeight(constraints),
      onTap: () {},
      onHover: (val) {
        setState(() {
          servicesHovered[1] = val;
          app_animateColor(val);
        });
      },
      isHovered: servicesHovered[1],
      title1: "App Development",
      title2:
          "Free resource that will help and Understand the cv design process and improve the understand and the design process andisi impor of quality",
      imageUrl: "images/app_img.png",
      titleColor: app_animation.value,
    );
  }

  my_desc(BoxConstraints constraints, screenSize) {
    return Expanded(
      child: Container(
        height: getHeight(constraints),
        width: screenSize.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hi, I am Aman, Creative Developer",
              maxLines: 3,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hello World hskdl sdlja alksdjff alskdfjl asdlkjflas dskljafl asldfkjal klajfd as; aldjl as;ldjlsdjl adlj lkjadsfljsalf s asldjlkj asdfjklalk asldkjsa as;dljkklsd asd;lkjlsaj sa;dlfjkl asldkj",
              maxLines: 6,
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: resumeWidth,
                  height: resumeHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: resumeHeight,
                  width: downloadResumeHover ? resumeWidth : 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xffe44239),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(3),
                  child: Ink(
                    height: resumeHeight,
                    width: resumeWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {},
                      onHover: (val) {
                        setState(() {
                          downloadResumeHover = val;
                        });
                      },
                      borderRadius: BorderRadius.circular(3),
                      child: Center(
                        child: Text(
                          "Download Resume",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  my_logo(BoxConstraints constraints) {
    return CircleAvatar(
      radius: getImageSize(constraints),
      backgroundImage: AssetImage(
        "images/my_img.jpeg",
      ),
    );
  }

  getGradientHeight(constraints) {
    if (constraints.maxWidth < 400) {
      return 500;
    } else if (constraints.maxWidth > 400 && constraints.maxWidth < 500) {
      return 400;
    } else {
      return 300;
    }
  }

  int animationMilliSeconds = 400;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey.shade200,
                    Colors.grey.shade100,
                    Colors.grey.shade50,
                  ],
                ),
              ),
              height: getGradientHeight(constraints),
              width: screenSize.width,
              child: constraints.maxWidth < 500
                  ? Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        my_logo(constraints),
                        my_desc(constraints, screenSize),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        my_desc(constraints, screenSize),
                        SizedBox(
                          width: 10,
                        ),
                        my_logo(constraints),
                      ],
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: designing_content(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: constraints.maxWidth < 700
                  ? Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: getServicesHeight(constraints),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: AnimatedContainer(
                                duration: Duration(
                                    milliseconds: animationMilliSeconds),
                                height: servicesHovered[0]
                                    ? getServicesHeight(constraints)
                                    : 0,
                                width: constraints.maxWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffe44239),
                                ),
                              ),
                            ),
                            website_design_services(constraints),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: [
                            Container(
                              height: getServicesHeight(constraints),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: AnimatedContainer(
                                duration: Duration(
                                    milliseconds: animationMilliSeconds),
                                height: servicesHovered[1]
                                    ? getServicesHeight(constraints)
                                    : 0,
                                width: constraints.maxWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffe44239),
                                ),
                              ),
                            ),
                            app_design_services(constraints),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                height: getServicesHeight(constraints),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: AnimatedContainer(
                                  duration: Duration(
                                      milliseconds: animationMilliSeconds),
                                  height: servicesHovered[0]
                                      ? getServicesHeight(constraints)
                                      : 0,
                                  width: constraints.maxWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xffe44239),
                                  ),
                                ),
                              ),
                              website_design_services(constraints),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                height: getServicesHeight(constraints),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: AnimatedContainer(
                                  duration: Duration(
                                      milliseconds: animationMilliSeconds),
                                  height: servicesHovered[1]
                                      ? getServicesHeight(constraints)
                                      : 0,
                                  width: constraints.maxWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xffe44239),
                                  ),
                                ),
                              ),
                              app_design_services(constraints),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(
              height: 1000,
            ),
          ],
        );
      },
    );
  }
}
