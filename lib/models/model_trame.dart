class ModelTrame {
  final int recordid;
  final String stopname;
  final String wheelchairboarding;

  const ModelTrame(this.recordid, this.stopname, this.wheelchairboarding);

  factory ModelTrame.fromGeoJson(Map<String, dynamic> json){

    final Map<String, dynamic> properties = json['properties'] ?? {};
    final int recordid = properties['recordid'];
    final String stopname = properties['stopname'];
    final String wheelchairboarding = properties['wheelchairboarding'];

    return ModelTrame(recordid, stopname, wheelchairboarding);
  }

  Map<String, dynamic> toJson(){
    return{
      'recordid': recordid,
      'stopname': stopname,
      'wheelchairboarding': wheelchairboarding,
    };
  }

  factory ModelTrame.fromJson(Map<String, dynamic> json){
    return ModelTrame(json['recordid'], json['stopname'], json['wheelchairboarding']);
  }
}