import 'package:flutter/material.dart';
import 'package:gatherly/core/data/events_model.dart';
import 'package:gatherly/utils/app_margins.dart';
import 'package:gatherly/utils/app_text_style.dart';
import 'package:gatherly/utils/color_assets.dart';
import 'package:gatherly/utils/screen_dimensions.dart';

class StallItemWidget extends StatelessWidget {
  final EventsModel? event;

  const StallItemWidget({super.key, this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context),
      height: MediaQuery.of(context).size.height / 2,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppMargins.dm_14)),
          color: AppColors.white_100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildVerticalSpace(AppMargins.dm_16),
          Image.asset(event?.eventImage ?? ''),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildVerticalSpace(AppMargins.dm_06),
                  Text(
                    "${event?.eventStartDate} - ${event?.eventEndDate}, 2024",
                    style: sfCompactMedium(),
                  ),
                  buildVerticalSpace(AppMargins.dm_06),
                  Text(
                    "${event?.eventName}",
                    style: sfCompactSemiBold(),
                  ),
                  buildVerticalSpace(AppMargins.dm_06),
                  Text(
                    "${event?.eventVenue}",
                    style: sfCompactRegular(),
                  ),
                  buildVerticalSpace(AppMargins.dm_06),
                  Text(
                    "${event?.files}",
                    style: sfCompactRegular(),
                  ),
                ],
              ),
              FloatingActionButton(
                  onPressed: () {},
                  foregroundColor: AppColors.colorWhite,
                  backgroundColor: AppColors.red_300,
                  child: const Icon(
                    Icons.add,
                    color: AppColors.colorWhite,
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
