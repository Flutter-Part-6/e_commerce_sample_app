/// title : "asda"
/// malltype : "aaa"

class Menu {
  Menu({
      String title, 
      String malltype,}){
    _title = title;
    _malltype = malltype;
}

  Menu.fromJson(dynamic json) {
    _title = json['title'];
    _malltype = json['malltype'];
  }
  String _title;
  String _malltype;
Menu copyWith({  String title,
  String malltype,
}) => Menu(  title: title ?? _title,
  malltype: malltype ?? _malltype,
);
  String get title => _title;
  String get malltype => _malltype;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['malltype'] = _malltype;
    return map;
  }

}