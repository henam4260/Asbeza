class Item{
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;

Item({
  required this.id,
  required this.title,
  required this.price,
  required this.description,
  required this.category,
  required this.image,



});

factory Item.fromjson(Map<String, dynamic>parsedjson){
  return 
  Item(
    id: parsedjson['id'],
    title: parsedjson['title'],
    price: parsedjson['price'],
    description: parsedjson['description'],
    category: parsedjson['category'],
    image: parsedjson['image'],
  );
}

static List itemList(List item) {
  List items = [];
  for (var i = 0; i < item.length; i++) {
    items.add(Item.fromjson(item[i]));
  }
  return items;
}

}

