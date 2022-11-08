import 'package:country/controller/country_controller.dart';
import 'package:country/navigation/navigator.dart';
import 'package:country/screen/widget/home_country_widget.dart';
import 'package:country/utils/color.dart';
import 'package:country/utils/text.dart';
import 'package:flutter/material.dart';

import '../utils/icon.dart';
import 'home_country_search.dart';

class HomeCountry extends StatefulWidget {
  const HomeCountry({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeCountryState createState() => _HomeCountryState();
}

class _HomeCountryState extends State<HomeCountry>
    with TickerProviderStateMixin {
  final CountryController controller = CountryController();

  void getAllCountry() async {
    setState(() {
      controller.isLoading = true;
    });
    await controller.getAllCountry().whenComplete(() {
      setState(() {
        controller.isLoading = false;
      });
    });
  }

  void getCountryAsc() async {
    setState(() {
      controller.isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1), () {
      controller.listCountry
          .sort((a, b) => a.name!.official!.compareTo(b.name!.official!));
      setState(() {
        controller.isLoading = false;
      });
    });
  }

  void getCountryDesc() async {
    setState(() {
      controller.isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1), () {
      controller.listCountry
          .sort((a, b) => b.name!.official!.compareTo(a.name!.official!));
      setState(() {
        controller.isLoading = false;
      });
    });
  }

  @override
  void initState() {
    controller.isLoading = false;
    controller.currentPage = 0;
    getAllCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: InkWell(
            onTap: () {
              getAllCountry();
            },
            child: HomeCountryWidget.title(),
          ),
          actions: [AppIcons().search, AppIcons().moreVert]
              .map((element) => IconButton(
                    icon: element,
                    onPressed: () {
                      if (element.icon == AppIcons().search.icon) {
                        showSearch(
                            context: context,
                            delegate:
                                CountrySearchDelegate(controller.listCountry));
                      } else if (element.icon == AppIcons().moreVert.icon) {
                        showMenu(
                          color: AppColors().primary,
                          context: context,
                          position: RelativeRect.fromSize(
                            Rect.fromCenter(
                                center: const Offset(0, 1),
                                width: 100,
                                height: 100),
                            const Size(100, 100),
                          ),
                          items: [
                            PopupMenuItem(
                              child: TextButton(
                                onPressed: () {
                                  MyNavigator(context).pop();
                                  getCountryAsc();
                                },
                                child: Text(AppTexts().sortAsc),
                              ),
                            ),
                            PopupMenuItem(
                              child: TextButton(
                                onPressed: () {
                                  MyNavigator(context).pop();
                                  getCountryDesc();
                                },
                                child: Text(AppTexts().sortDesc),
                              ),
                            )
                          ],
                        );
                      }
                    },
                  ))
              .toList(),
        ),
        body: controller.isLoading == true
            ? HomeCountryWidget.linearProgressIndicator()
            : HomeCountryWidget(context)
                .displayCountry(controller.listCountry));
  }
}
