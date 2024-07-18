import 'package:flutter/material.dart';
import 'package:gatherly/core/data/events_model.dart';
import 'package:gatherly/utils/app_margins.dart';
import 'package:gatherly/utils/app_text_style.dart';
import 'package:gatherly/utils/color_assets.dart';
import 'package:gatherly/utils/screen_dimensions.dart';

class StallItemWidget extends StatelessWidget {
  final EventsModel event;

  const StallItemWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppMargins.dm_26),
                topRight: Radius.circular(AppMargins.dm_26)),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image.network(
                  event.eventImage ?? '',
                  fit: BoxFit.cover,
                ))),
        Container(
          padding: const EdgeInsets.all(AppMargins.dm_16),
          decoration: const BoxDecoration(
              color: AppColors.white_100,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppMargins.dm_26),
                  bottomRight: Radius.circular(AppMargins.dm_26))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildVerticalSpace(AppMargins.dm_01),
                  Text(
                    "${event.eventStartDate} - ${event.eventEndDate}, 2024",
                    style: sfCompactMedium(),
                  ),
                  buildVerticalSpace(AppMargins.dm_01),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      "${event.eventName}",
                      style: sfCompactSemiBold(AppMargins.dm_18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  buildVerticalSpace(AppMargins.dm_01),
                  Text(
                    "${event.eventVenue}",
                    style: sfCompactRegular(),
                  ),
                  buildVerticalSpace(AppMargins.dm_01),
                  Text(
                    "${event.files}",
                    style: sfCompactRegular(),
                  ),
                ],
              ),
              FloatingActionButton(
                shape: const CircleBorder(),
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
        ),
      ],
    );
  }
}
