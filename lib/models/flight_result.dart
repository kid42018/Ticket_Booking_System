import 'dart:convert';

class SearchFlight {
  final String originLocationCode;
  final String destinationLocationCode;
  final String departureDate;
  String? returnDate;
  final String travelClass;
  final String currencyCode;
  final String isOneWay;
  final String adults;
  final String children;
  final String infants;

  SearchFlight({required this.originLocationCode, required this.destinationLocationCode, required this.departureDate, this.returnDate, required this.adults, required this.children, required this.infants, required this.travelClass, required this.currencyCode, required this.isOneWay});


  Map<String, dynamic> toJson(){
    return {
      "originLocationCode":originLocationCode,
      "destinationLocationCode":destinationLocationCode,
      "departureDate":departureDate,
      "returnDate":returnDate,
      "adults":adults,
      "children":children,
      "infants":infants,
      "travelClass":travelClass,
      "currencyCode":currencyCode,
      "isOneWay":isOneWay
    };
  }
}

class FlightResult {
	List<Itineraries>? itineraries;
	Price? price;
	PricingOptions? pricingOptions;
	List<String>? validatingAirlineCodes;
	List<TravelerPricings>? travelerPricings;

	FlightResult({this.itineraries, this.price, this.pricingOptions, this.validatingAirlineCodes, this.travelerPricings});

	FlightResult.fromJson(Map<String, dynamic> json) {
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
	String? duration;
	List<Segments>? segments;

	Itineraries({this.duration, this.segments});

	Itineraries.fromJson(Map<String, dynamic> json) {
		duration = json['duration'];
		if (json['segments'] != null) {
			segments = <Segments>[];
			json['segments'].forEach((v) { segments!.add(new Segments.fromJson(v)); });
		}
	}
}

class Segments {
	Departure? departure;
	Departure? arrival;
	String? carrierCode;
	String? number;
	Aircraft? aircraft;
	Operating? operating;
	String? duration;
	String? id;
	int? numberOfStops;
	bool? blacklistedInEU;

	Segments({this.departure, this.arrival, this.carrierCode, this.number, this.aircraft, this.operating, this.duration, this.id, this.numberOfStops, this.blacklistedInEU});

	Segments.fromJson(Map<String, dynamic> json) {
		departure = json['departure'] != null ? Departure.fromJson(json['departure']) : null;
		arrival = json['arrival'] != null ?  Departure.fromJson(json['arrival']) : null;
		carrierCode = json['carrierCode'];
		number = json['number'];
		aircraft = json['aircraft'] != null ? Aircraft.fromJson(json['aircraft']) : null;
		operating = json['operating'] != null ? Operating.fromJson(json['operating']) : null;
		duration = json['duration'];
		id = json['id'];
		numberOfStops = json['numberOfStops'];
		blacklistedInEU = json['blacklistedInEU'];
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

class Aircraft {
	String? code;

	Aircraft({this.code});

	Aircraft.fromJson(Map<String, dynamic> json) {
		code = json['code'];
	}
}

class Operating {
	String? carrierCode;

	Operating({this.carrierCode});

	Operating.fromJson(Map<String, dynamic> json) {
		carrierCode = json['carrierCode'];
	}
}

class Price {
	String? currency;
	String? total;
	String? base;
	List<Fees>? fees;
	String? grandTotal;

	Price({this.currency, this.total, this.base, this.fees, this.grandTotal});

	Price.fromJson(Map<String, dynamic> json) {
		currency = json['currency'];
		total = json['total'];
		base = json['base'];
		if (json['fees'] != null) {
			fees = <Fees>[];
			json['fees'].forEach((v) { fees!.add(new Fees.fromJson(v)); });
		}
		grandTotal = json['grandTotal'];
	}
}

class Fees {
	String? amount;
	String? type;

	Fees({this.amount, this.type});

	Fees.fromJson(Map<String, dynamic> json) {
		amount = json['amount'];
		type = json['type'];
	}
}

class PricingOptions {
	List<String>? fareType;
	bool? includedCheckedBagsOnly;

	PricingOptions({this.fareType, this.includedCheckedBagsOnly});

	PricingOptions.fromJson(Map<String, dynamic> json) {
		fareType = json['fareType'].cast<String>();
		includedCheckedBagsOnly = json['includedCheckedBagsOnly'];
	}
}

class TravelerPricings {
	String? travelerId;
	String? fareOption;
	String? travelerType;
	TravlerPrice? price;
	List<FareDetailsBySegment>? fareDetailsBySegment;

	TravelerPricings({this.travelerId, this.fareOption, this.travelerType, this.price, this.fareDetailsBySegment});

	TravelerPricings.fromJson(Map<String, dynamic> json) {
		travelerId = json['travelerId'];
		fareOption = json['fareOption'];
		travelerType = json['travelerType'];
		price = json['price'] != null ? new TravlerPrice.fromJson(json['price']) : null;
		if (json['fareDetailsBySegment'] != null) {
			fareDetailsBySegment = <FareDetailsBySegment>[];
			json['fareDetailsBySegment'].forEach((v) { fareDetailsBySegment!.add(new FareDetailsBySegment.fromJson(v)); });
		}
	}
}

class TravlerPrice {
	String? currency;
	String? total;
	String? base;

	TravlerPrice({this.currency, this.total, this.base});

	TravlerPrice.fromJson(Map<String, dynamic> json) {
		currency = json['currency'];
		total = json['total'];
		base = json['base'];
	}
}

class FareDetailsBySegment {
	String? segmentId;
	String? cabin;
	String? fareBasis;
	String? cabinClass;
	IncludedCheckedBags? includedCheckedBags;

	FareDetailsBySegment({this.segmentId, this.cabin, this.fareBasis, this.cabinClass, this.includedCheckedBags});

	FareDetailsBySegment.fromJson(Map<String, dynamic> json) {
		segmentId = json['segmentId'];
		cabin = json['cabin'];
		fareBasis = json['fareBasis'];
		cabinClass = json['class'];
		includedCheckedBags = json['includedCheckedBags'] != null ? new IncludedCheckedBags.fromJson(json['includedCheckedBags']) : null;
	}
}

class IncludedCheckedBags {
	int? quantity;

	IncludedCheckedBags({this.quantity});

	IncludedCheckedBags.fromJson(Map<String, dynamic> json) {
		quantity = json['quantity'];
	}
}


class Airlines{
  final String airlineCode;
  final String name;
  final String logo;

  Airlines({required this.airlineCode, required this.name, required this.logo});
}