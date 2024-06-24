class User
{
  String? title;
  String? subtitle;
  String? date;

  userMap(){
    var mapping = {};
      mapping['title'] = title!;
      mapping['subtitle'] = subtitle!;
      mapping['date'] = date!;
      return mapping;
  }
}