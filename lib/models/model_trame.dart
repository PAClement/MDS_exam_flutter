class ModelTrame {
  final String recordid;
  final String stop_name;
  final String stop_id;
  final String wheelchair_boarding;

  const ModelTrame(this.recordid, this.stop_name, this.stop_id, this.wheelchair_boarding);

  factory ModelTrame.fromGeoJson(Map<String, dynamic> json){

    final Map<String, dynamic> records = json['fields'] ?? {};
    final String recordid = json['recordid'];
    final String stop_name = records['stop_name'];
    final String stop_id = records['stop_id'];
    final String wheelchair_boarding = records['wheelchair_boarding'];

    return ModelTrame(recordid, stop_name, stop_id, wheelchair_boarding);
  }

  Map<String, dynamic> toJson(){
    return{
      'recordid': recordid,
      'stop_name': stop_name,
      'stop_id': stop_id,
      'wheelchair_boarding': wheelchair_boarding,
    };
  }

  factory ModelTrame.fromJson(Map<String, dynamic> json){
    return ModelTrame(json['recordid'], json['stop_name'], json['stop_id'], json['wheelchair_boarding']);
  }
}