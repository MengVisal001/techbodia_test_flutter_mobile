import 'package:country/controller/country_controller.dart';
import 'package:country/model/country_model.dart';
import 'package:country/navigation/navigator.dart';
import 'package:country/utils/color.dart';
import 'package:country/utils/text.dart';
import 'package:flutter/material.dart';

class HomeCountryWidget extends AppTexts with CountryController {
  final BuildContext context;

  HomeCountryWidget(this.context);

  /// title app country
  static Text title() => Text(AppTexts().titleApp,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold));

  static Widget linearProgressIndicator() => LinearProgressIndicator(
        backgroundColor: AppColors().primaryOpacity,
      );

  /// display inform country card
  ///
  ListView displayCountry(List<CountryModel> itemList,
      {ScrollController? scrollController}) {
    return ListView.builder(
      controller: scrollController,
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
          '${itemList[index].name?.nativeName?.nativeNameData?.official}',
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
                          onTap: () {
                            _detailCountry(itemList[index]);
                          },
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

  /// dialog detail country
  ///
  dynamic _detailCountry(CountryModel countryModel) {
    List<String> label = [
      countriesName,
      countriesCode,
      countriesIndependent,
      countriesStatus,
      countriesUnMember,
      countriesCurrency,
      countriesCallingCode,
      countriesCapital,
      countriesLanguage,
      countriesArea,
      countriesPopulation,
      countriesTimezones,
      countriesContinents,
    ];
    List<String> value = [
      countryModel.name!.official!,
      countryModel.cca2!,
      countryModel.independent == true ? yes : no,
      countryModel.status!,
      countryModel.unMember == true ? yes : no,
      countryModel.currencies != null
          ? '${countryModel.currencies!.currencyName!.name!}(${countryModel.currencies!.currencyName!.symbol})'
          : no,
      countryModel.idd == null
          ? no
          : '${countryModel.idd!.root}, ${countryModel.idd!.suffixes!.map((e) => e)}',
      countryModel.capital!.map((e) => e).toString(),
      countryModel.languages!.name!,
      countryModel.area.toString(),
      countryModel.population.toString(),
      countryModel.timezones!.map((e) => e).toString(),
      countryModel.continents!.map((e) => e).toString(),
    ];
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Country Detail',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        onPressed: () => MyNavigator(context).pop(),
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  for (int i = 0; i < label.length; i++)
                    Row(
                      children: [
                        // Text label
                        Expanded(
                          child: Text(
                            label[i],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // text value
                        Expanded(
                          child: Text(
                            value[i],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                ],
              ),
            ),
          );
        });
  }
}
