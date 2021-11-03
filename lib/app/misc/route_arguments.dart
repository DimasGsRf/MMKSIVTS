class RouteArguments {
  String? description, image, title, type, id, date, from;
  Map<String, dynamic>? extras = {};

  RouteArguments({
    this.description,
    this.image,
    this.title,
    this.type,
    this.id,
    this.date,
    this.extras,
    this.from,
  });
}
