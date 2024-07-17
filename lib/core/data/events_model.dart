import 'package:gatherly/core/database/event_fields.dart';

class EventsModel {
  int? id;
  String? eventImage;
  String? eventName;
  String? eventStartDate;
  String? eventEndDate;
  String? eventVenue;
  String? files;

  EventsModel(this.id, this.eventImage, this.eventName, this.eventStartDate, this.eventEndDate,
      this.eventVenue, this.files);

  EventsModel.fromJson(Map<String, dynamic> json) {
    id = json[EventFields.id];
    eventName = json[EventFields.eventName];
    eventName = json[EventFields.eventImage];
    eventStartDate = json[EventFields.eventStartDate];
    eventEndDate = json[EventFields.eventEndDate];
    eventVenue = json[EventFields.eventVenue];
    files = json[EventFields.files];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[EventFields.id] = id;
    data[EventFields.eventName] = eventName;
    data[EventFields.eventImage] = eventImage;
    data[EventFields.eventStartDate] = eventStartDate;
    data[EventFields.eventEndDate] = eventEndDate;
    data[EventFields.eventVenue] = eventVenue;
    data[EventFields.files] = files;
    return data;
  }
}


