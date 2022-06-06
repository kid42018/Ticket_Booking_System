class TripsCardModel{
  String? id;
  String? reference;
  String? originIata;
  String? originCity;
  String? destinationIata;
  String? destinationCity;
  DateTime? departureDate;
  DateTime? returnDate;
  DateTime? bookingTime;
  bool? isOneWay;

  TripsCardModel({this.id, this.reference, this.originIata, this.originCity, this.destinationIata, this.destinationCity, this.departureDate, this.returnDate, this.bookingTime, this.isOneWay});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['reference'] = reference;
    data['originIata'] = originIata;
    data['originCity'] = originCity;
    data['destinationIata'] = destinationIata;
    data['destinationCity'] = destinationCity;
    data['departureDate'] = departureDate!.toIso8601String();
    data['returnDate'] = returnDate!.toIso8601String();
    data['bookingTime'] = bookingTime!.toIso8601String();
    data['isOneWay'] = isOneWay;

    return data;
  }
}

class TripsDetailModel {
	String? type;
	String? id;
	String? queuingOfficeId;
	List<AssociatedRecords>? associatedRecords;
	List<FlightOffers>? flightOffers;
	List<Travelers>? travelers;
	Remarks? remarks;
	TicketingAgreement? ticketingAgreement;
	List<Contacts>? contacts;

	TripsDetailModel({this.type, this.id, this.queuingOfficeId, this.associatedRecords, this.flightOffers, this.travelers, this.remarks, this.ticketingAgreement, this.contacts});

	TripsDetailModel.fromJson(Map<String, dynamic> json) {
		type = json['type'];
		id = json['id'];
		queuingOfficeId = json['queuingOfficeId'];
		if (json['associatedRecords'] != null) {
			associatedRecords = <AssociatedRecords>[];
			json['associatedRecords'].forEach((v) { associatedRecords!.add(new AssociatedRecords.fromJson(v)); });
		}
		if (json['flightOffers'] != null) {
			flightOffers = <FlightOffers>[];
			json['flightOffers'].forEach((v) { flightOffers!.add(new FlightOffers.fromJson(v)); });
		}
		if (json['travelers'] != null) {
			travelers = <Travelers>[];
			json['travelers'].forEach((v) { travelers!.add(new Travelers.fromJson(v)); });
		}
		remarks = json['remarks'] != null ? new Remarks.fromJson(json['remarks']) : null;
		ticketingAgreement = json['ticketingAgreement'] != null ? new TicketingAgreement.fromJson(json['ticketingAgreement']) : null;
		if (json['contacts'] != null) {
			contacts = <Contacts>[];
			json['contacts'].forEach((v) { contacts!.add(new Contacts.fromJson(v)); });
		}
	}
}

class AssociatedRecords {
	String? reference;
	String? originSystemCode;
	String? flightOfferId;
	String? creationDate;

	AssociatedRecords({this.reference, this.originSystemCode, this.flightOfferId, this.creationDate});

	AssociatedRecords.fromJson(Map<String, dynamic> json) {
		reference = json['reference'];
		originSystemCode = json['originSystemCode'];
		flightOfferId = json['flightOfferId'];
		creationDate = json['creationDate'];
	}
}

class FlightOffers {
	String? type;
	String? id;
	String? source;
	bool? nonHomogeneous;
	String? lastTicketingDate;
	List<Itineraries>? itineraries;
	Price? price;
	PricingOptions? pricingOptions;
	List<String>? validatingAirlineCodes;
	List<TravelerPricings>? travelerPricings;

	FlightOffers({this.type, this.id, this.source, this.nonHomogeneous, this.lastTicketingDate, this.itineraries, this.price, this.pricingOptions, this.validatingAirlineCodes, this.travelerPricings});

	FlightOffers.fromJson(Map<String, dynamic> json) {
		type = json['type'];
		id = json['id'];
		source = json['source'];
		nonHomogeneous = json['nonHomogeneous'];
		lastTicketingDate = json['lastTicketingDate'];
		if (json['itineraries'] != null) {
			itineraries = <Itineraries>[];
			json['itineraries'].forEach((v) { itineraries!.add(new Itineraries.fromJson(v)); });
		}
		price = json['price'] != null ? new Price.fromJson(json['price']) : null;
		pricingOptions = json['pricingOptions'] != null ? new PricingOptions.fromJson(json['pricingOptions']) : null;
		validatingAirlineCodes = json['validatingAirlineCodes'].cast<String>();
		if (json['travelerPricings'] != null) {
			travelerPricings = <TravelerPricings>[];
			json['travelerPricings'].forEach((v) { travelerPricings!.add(new TravelerPricings.fromJson(v)); });
		}
	}
}

class Itineraries {
	List<Segments>? segments;

	Itineraries({this.segments});

	Itineraries.fromJson(Map<String, dynamic> json) {
		if (json['segments'] != null) {
			segments = <Segments>[];
			json['segments'].forEach((v) { segments!.add(new Segments.fromJson(v)); });
		}
	}
}

class Segments {
	Departure? departure;
	Arrival? arrival;
	String? carrierCode;
	String? number;
	Aircraft? aircraft;
	String? bookingStatus;
	String? segmentType;
	bool? isFlown;
	String? id;
	int? numberOfStops;

	Segments({this.departure, this.arrival, this.carrierCode, this.number, this.aircraft, this.bookingStatus, this.segmentType, this.isFlown, this.id, this.numberOfStops});

	Segments.fromJson(Map<String, dynamic> json) {
		departure = json['departure'] != null ? new Departure.fromJson(json['departure']) : null;
		arrival = json['arrival'] != null ? new Arrival.fromJson(json['arrival']) : null;
		carrierCode = json['carrierCode'];
		number = json['number'];
		aircraft = json['aircraft'] != null ? new Aircraft.fromJson(json['aircraft']) : null;
		bookingStatus = json['bookingStatus'];
		segmentType = json['segmentType'];
		isFlown = json['isFlown'];
		id = json['id'];
		numberOfStops = json['numberOfStops'];
	}
}

class Departure {
	String? iataCode;
	String? terminal;
	String? at;

	Departure({this.iataCode, this.terminal, this.at});

	Departure.fromJson(Map<String, dynamic> json) {
		iataCode = json['iataCode'];
		terminal = json['terminal'];
		at = json['at'];
	}
}

class Arrival {
	String? iataCode;
	String? at;

	Arrival({this.iataCode, this.at});

	Arrival.fromJson(Map<String, dynamic> json) {
		iataCode = json['iataCode'];
		at = json['at'];
	}
}

class Aircraft {
	String? code;

	Aircraft({this.code});

	Aircraft.fromJson(Map<String, dynamic> json) {
		code = json['code'];
	}
}

class Price {
	String? currency;
	String? total;
	String? base;
	String? grandTotal;

	Price({this.currency, this.total, this.base, this.grandTotal});

	Price.fromJson(Map<String, dynamic> json) {
		currency = json['currency'];
		total = json['total'];
		base = json['base'];
		grandTotal = json['grandTotal'];
	}
}

class PricingOptions {
	List<String>? fareType;

	PricingOptions({this.fareType});

	PricingOptions.fromJson(Map<String, dynamic> json) {
		fareType = json['fareType'].cast<String>();
	}
}

class TravelerPricings {
	String? travelerId;
	String? travelerType;
	PriceTr? price;
	List<FareDetailsBySegment>? fareDetailsBySegment;
	String? associatedAdultId;

	TravelerPricings({this.travelerId, this.travelerType, this.price, this.fareDetailsBySegment, this.associatedAdultId});

	TravelerPricings.fromJson(Map<String, dynamic> json) {
		travelerId = json['travelerId'];
		travelerType = json['travelerType'];
		price = json['price'] != null ? new PriceTr.fromJson(json['price']) : null;
		if (json['fareDetailsBySegment'] != null) {
			fareDetailsBySegment = <FareDetailsBySegment>[];
			json['fareDetailsBySegment'].forEach((v) { fareDetailsBySegment!.add(new FareDetailsBySegment.fromJson(v)); });
		}
		associatedAdultId = json['associatedAdultId'];
	}
}

class PriceTr {
	String? currency;
	String? total;
	String? base;
	List<Taxes>? taxes;

	PriceTr({this.currency, this.total, this.base, this.taxes});

	PriceTr.fromJson(Map<String, dynamic> json) {
		currency = json['currency'];
		total = json['total'];
		base = json['base'];
		if (json['taxes'] != null) {
			taxes = <Taxes>[];
			json['taxes'].forEach((v) { taxes!.add(new Taxes.fromJson(v)); });
		}
	}
}

class Taxes {
	String? amount;
	String? code;

	Taxes({this.amount, this.code});

	Taxes.fromJson(Map<String, dynamic> json) {
		amount = json['amount'];
		code = json['code'];
	}
}

class FareDetailsBySegment {
	String? segmentId;
	String? cabin;
	String? fareBasis;
	String? cabinClass;
	IncludedCheckedBags? includedCheckedBags;
	List<MealServices>? mealServices;

	FareDetailsBySegment({this.segmentId, this.cabin, this.fareBasis, this.cabinClass, this.includedCheckedBags, this.mealServices});

	FareDetailsBySegment.fromJson(Map<String, dynamic> json) {
		segmentId = json['segmentId'];
		cabin = json['cabin'];
		fareBasis = json['fareBasis'];
		cabinClass = json['class'];
		includedCheckedBags = json['includedCheckedBags'] != null ? new IncludedCheckedBags.fromJson(json['includedCheckedBags']) : null;
		if (json['mealServices'] != null) {
			mealServices = <MealServices>[];
			json['mealServices'].forEach((v) { mealServices!.add(new MealServices.fromJson(v)); });
		}
	}
}

class IncludedCheckedBags {
	int? quantity;

	IncludedCheckedBags({this.quantity});

	IncludedCheckedBags.fromJson(Map<String, dynamic> json) {
		quantity = json['quantity'];
	}
}

class MealServices {
	String? label;

	MealServices({this.label});

	MealServices.fromJson(Map<String, dynamic> json) {
		label = json['label'];
	}
}

class Travelers {
	String? id;
	Name? name;
	Contact? contact;
	String? dateOfBirth;

	Travelers({this.id, this.name, this.contact, this.dateOfBirth});

	Travelers.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'] != null ? new Name.fromJson(json['name']) : null;
		contact = json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
		dateOfBirth = json['dateOfBirth'];
	}
}

class Name {
	String? firstName;
	String? lastName;

	Name({this.firstName, this.lastName});

	Name.fromJson(Map<String, dynamic> json) {
		firstName = json['firstName'];
		lastName = json['lastName'];
	}
}

class Contact {
	String? purpose;
	List<Phones>? phones;
	String? emailAddress;

	Contact({this.purpose, this.phones, this.emailAddress});

	Contact.fromJson(Map<String, dynamic> json) {
		purpose = json['purpose'];
		if (json['phones'] != null) {
			phones = <Phones>[];
			json['phones'].forEach((v) { phones!.add(new Phones.fromJson(v)); });
		}
		emailAddress = json['emailAddress'];
	}
}

class Phones {
	String? deviceType;
	String? countryCallingCode;
	String? number;

	Phones({this.deviceType, this.countryCallingCode, this.number});

	Phones.fromJson(Map<String, dynamic> json) {
		deviceType = json['deviceType'];
		countryCallingCode = json['countryCallingCode'];
		number = json['number'];
	}
}

class Remarks {
	List<General>? general;
	List<Airline>? airline;

	Remarks({this.general, this.airline});

	Remarks.fromJson(Map<String, dynamic> json) {
		if (json['general'] != null) {
			general = <General>[];
			json['general'].forEach((v) { general!.add(new General.fromJson(v)); });
		}
		if (json['airline'] != null) {
			airline = <Airline>[];
			json['airline'].forEach((v) { airline!.add(new Airline.fromJson(v)); });
		}
	}
}

class General {
	String? subType;
	String? text;
	List<String>? flightOfferIds;

	General({this.subType, this.text, this.flightOfferIds});

	General.fromJson(Map<String, dynamic> json) {
		subType = json['subType'];
		text = json['text'];
		flightOfferIds = json['flightOfferIds'].cast<String>();
	}
}

class Airline {
	String? subType;
	String? airlineCode;
	String? text;
	List<String>? flightOfferIds;

	Airline({this.subType, this.airlineCode, this.text, this.flightOfferIds});

	Airline.fromJson(Map<String, dynamic> json) {
		subType = json['subType'];
		airlineCode = json['airlineCode'];
		text = json['text'];
		flightOfferIds = json['flightOfferIds'].cast<String>();
	}
}

class TicketingAgreement {
	String? option;

	TicketingAgreement({this.option});

	TicketingAgreement.fromJson(Map<String, dynamic> json) {
		option = json['option'];
	}
}

class Contacts {
	String? purpose;

	Contacts({this.purpose});

	Contacts.fromJson(Map<String, dynamic> json) {
		purpose = json['purpose'];
	}
}

