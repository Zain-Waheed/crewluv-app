import 'package:amigos/models/PreferenceModel.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterModel{
 List<PreferenceModel> friend=[];
 List<PreferenceModel> eventTypes=[];
 List<PreferenceModel> timeDuration=[];
 List<PreferenceModel> musicTaste=[];
 double distance=1;
 SfRangeValues age=SfRangeValues(20, 20);
}