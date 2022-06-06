class PriceDetails {
	List<TravelerPricings>? travelerPricings;

	PriceDetails({this.travelerPricings});

	PriceDetails.fromJson(Map<String, dynamic> json) {
		if (json['travelerPricings'] != null) {
			travelerPricings = <TravelerPricings>[];
			json['travelerPricings'].forEach((v) { travelerPricings!.add(TravelerPricings.fromJson(v)); });
		}
	}
}

class TravelerPricings {
	String? travelerId;
	String? fareOption;
	String? travelerType;
	Price? price;

	TravelerPricings({this.travelerId, this.fareOption, this.travelerType, this.price});

	TravelerPricings.fromJson(Map<String, dynamic> json) {
		travelerId = json['travelerId'];
		fareOption = json['fareOption'];
		travelerType = json['travelerType'];
		price = json['price'] != null ? Price.fromJson(json['price']) : null;
	}
}

class Price {
	String? currency;
	String? total;
	String? base;
	List<Taxes>? taxes;
	String? refundableTaxes;

	Price({this.currency, this.total, this.base, this.taxes, this.refundableTaxes});

	Price.fromJson(Map<String, dynamic> json) {
		currency = json['currency'];
		total = json['total'];
		base = json['base'];
		if (json['taxes'] != null) {
			taxes = <Taxes>[];
			json['taxes'].forEach((v) { taxes!.add(new Taxes.fromJson(v)); });
		}
		refundableTaxes = json['refundableTaxes'];
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

