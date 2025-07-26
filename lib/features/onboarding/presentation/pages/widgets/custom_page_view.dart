import 'package:basic_restaurant/core/utils/constants/app_constants.dart';
import 'package:basic_restaurant/core/utils/router/routes_name.dart';
import 'package:basic_restaurant/features/onboarding/presentation/pages/widgets/custom_elevated_button.dart';
import 'package:basic_restaurant/features/onboarding/presentation/pages/widgets/custom_page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({
    super.key,
  });

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
 late  PageController controller;
int currentPage=0;
 @override
  void initState() {
controller=PageController();
    super.initState();
  }
  @override
  void dispose() {
controller.dispose();
    super.dispose();
  }
  Future<void>onNext()async{
  if(currentPage==AppConstants.pages.length-1){
    GoRouter.of(context).go(RoutesName.auth);
  }else{
 await controller.nextPage(duration: const Duration(milliseconds: 300),
 curve: Curves.easeInOut);
  }
   
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        onPageChanged: (index){
          setState(() {
            currentPage=index;
          });
        },
        controller: controller,
        itemCount: AppConstants.pages.length,
        itemBuilder: (context, index) {
          final page = AppConstants.pages[index];
          return Column(
            children: [
              CustomItemPageView(
                  image: page['image'],
                  title: page['title'],
                  subtitle: page['subtitle']),
              const Spacer(),
               CustomElevatedButton(text: "Next",onPressed:onNext,),
               Expanded(
                child:
                  GestureDetector  (
                    onTap: (){GoRouter.of(context).go(RoutesName.auth);},
                    child: const Align(alignment: Alignment.bottomLeft, child: Text("Skip"))),
              ),
            ],
          );
        },
      ),
    );
  }
}
