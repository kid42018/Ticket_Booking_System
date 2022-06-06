class TravelersClass {
  Map<String, dynamic>? flightOffers;
  List<Travelers>? travelers;

  TravelersClass({this.flightOffers, this.travelers});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['flightOffers'] = flightOffers;
    if (travelers != null) {
      data['travelers'] = travelers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Travelers {
  String id;
  String dateOfBirth;
  Name name;
  String gender;
  Contact contact;

  Travelers({required this.id, required this.dateOfBirth, required this.name, required this.gender, required this.contact});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['dateOfBirth'] = dateOfBirth;
    if (name != null) {
      data['name'] = name.toJson();
    }
    data['gender'] = gender;
    if (contact != null) {
      data['contact'] = contact.toJson();
    }
    return data;
  }
}

class Name {
  String? firstName;
  String? lastName;

  Name({this.firstName, this.lastName});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    return data;
  }
}

class Contact {
  String? emailAddress;
  List<Phones>? phones;

  Contact({this.emailAddress, this.phones});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['emailAddress'] = emailAddress;
    if (phones != null) {
      data['phones'] = phones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Phones {
  String? deviceType;
  String? countryCallingCode;
  String? number;

  Phones({this.deviceType, this.countryCallingCode, this.number});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['deviceType'] = deviceType;
    data['countryCallingCode'] = countryCallingCode;
    data['number'] = number;
    return data;
  }
}