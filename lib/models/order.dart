class FlightOrder {
  String? type;
  String? id;
  List<AssociatedRecords>? associatedRecords;

  FlightOrder({this.type, this.id, this.associatedRecords});

  FlightOrder.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    if (json['associatedRecords'] != null) {
      associatedRecords = <AssociatedRecords>[];
      json['associatedRecords'].forEach((v) {
        associatedRecords!.add(AssociatedRecords.fromJson(v));
      });
    }
  }
}

class AssociatedRecords {
  String? reference;
  String? creationDate;
  String? originSystemCode;
  String? flightOfferId;

  AssociatedRecords(
      {this.reference,
      this.creationDate,
      this.originSystemCode,
      this.flightOfferId});

  AssociatedRecords.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    creationDate = json['creationDate'];
    originSystemCode = json['originSystemCode'];
    flightOfferId = json['flightOfferId'];
  }
}