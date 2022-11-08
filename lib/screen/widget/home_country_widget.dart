import 'package:country/controller/country_controller.dart';
import 'package:country/model/country_model.dart';
import 'package:country/screen/home_country_search.dart';
import 'package:country/utils/color.dart';
import 'package:country/utils/text.dart';
import 'package:flutter/material.dart';

class HomeCountryWidget extends AppTexts with CountryController {
  final BuildContext context;

  HomeCountryWidget(this.context);

  /// title app country
  static Text title() => Text(AppTexts().titleApp,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold));

  /// button action application
  List<IconButton> buttonActionIcon(List<CountryModel> list) {
    List<Icon> listIcon = [search, moreVert];
    return listIcon
        .map((element) => IconButton(
              icon: element,
              onPressed: () {
                if (element == search) {
                  showSearch(
                      context: context, delegate: CountrySearchDelegate(list));
                } else if (element == moreVert) {
                  showMenu(
                    color: primary,
                    context: context,
                    position: RelativeRect.fromSize(
                      Rect.fromCenter(
                          center: const Offset(0, 1), width: 100, height: 100),
                      const Size(100, 100),
                    ),
                    items: [
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(sortAsc),
                        ),
                      ),
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(sortDesc),
                        ),
                      )
                    ],
                  );
                }
              },
            ))
        .toList();
  }

  static Widget linearProgressIndicator() => LinearProgressIndicator(
        backgroundColor: AppColors().primaryOpacity,
      );

  /// display inform country card
  ///
  ListView displayCountry(List<CountryModel> itemList) {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (context, index) {
        List<String> listTitle = [
          countryCode,
          nativeCountryName,
          altSpellings,
          idd
        ];
        List<String> listSubTitle = [
          '${itemList[index].cca2}, ${itemList[index].cca3}',
          '${itemList[index].name?.nativeName?.ron?.official}',
          '${itemList[index].altSpellings!.map((e) => e)}',
          '${itemList[index].idd!.root}, ${itemList[index].idd!.suffixes!.map((e) => e)}',
        ];
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: primaryOpacity,
            borderRadius: BorderRadius.circular(16),
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Image.network(
                  itemList[index].flags!.png!,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.hide_image_outlined, size: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              itemList[index].name!.official!,
                              style: TextStyle(
                                fontSize: 15,
                                color: secondary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            for (int i = 0; i < listTitle.length; i++)
                              Wrap(
                                children: [
                                  Text(
                                    '${listTitle[i]}: ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: secondary,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    listSubTitle[i],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: secondary,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {},
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: buttonColor.withOpacity(.45),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: Text(
                                  detail,
                                  style: TextStyle(color: secondary),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
      itemCount: itemList.length,
    );
  }
}
