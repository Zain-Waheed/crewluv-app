


class PlanModel{
int? months;
int? pricePerMonth;
double? price;
bool isPopular;

PlanModel({this.months,this.pricePerMonth,this.price,required this.isPopular});
}

List<PlanModel> plans=[
  PlanModel(months:11,pricePerMonth: 4,price: 97.99,isPopular: false),
  PlanModel(months:12,pricePerMonth: 4,price: 98.99,isPopular: true),
  PlanModel(months:10,pricePerMonth: 4,price: 99.99,isPopular: false),
];