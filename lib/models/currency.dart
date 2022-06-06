class Currency {
  final String name;
  final String short;

  Currency({required this.name, required this.short});
}

List<Currency> loadCurrency(){
  List currList = [];
  return currList = <Currency>[
    Currency(name: 'US Dollar', short: 'USD'),
    Currency(name: 'Euro', short: 'EUR'),
    Currency(name: 'United Arab Emirates Dirham', short: 'AED'),
    Currency(name: 'Saudi Riyal', short: 'SAR'),
    Currency(name: 'Ethiopian Birr', short: 'ETB'),
    Currency(name: 'Canadian Dollar', short: 'CAD'),
  ];
}