import 'package:baseproject/src/base/models/listings/listing_model_response.dart';
import 'package:baseproject/src/home_page/domain/home_card_model.dart';
import 'package:flutter/material.dart';

import '../../../../resources/res.dart';

class HomeListingCard extends StatelessWidget {
  final ListingModelResponse model;

  const HomeListingCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Sizes.padding),
      padding: EdgeInsets.all(Sizes.padding),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(Sizes.borderRadiusS)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FadeInImage.assetNetwork(placeholder: ImageSrc.logo, image: model.image, width: MediaQuery.of(context).size.width, height: 200, fit: BoxFit.fitWidth),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
