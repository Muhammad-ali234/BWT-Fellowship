import 'package:riverpod/riverpod.dart';

class Item {
  final String title;
  final String description;
  final String img;
  final String price;

  Item(
      {required this.title,
      required this.description,
      required this.img,
      required this.price});
}

final itemListProvider = Provider<List<Item>>((ref) {
  // For simplicity, we'll use a hardcoded list
  return [
    Item(
        title: 'Laptop',
        description:
            'A laptop is a portable computer that combines the convenience of mobility with the functionality of a desktop computer. It is designed to be compact and lightweight, allowing users to work, study, or entertain themselves while on the go.',
        img: 'assets/laptop.jpg',
        price: '\$30'),
    Item(
        title: 'Sofa',
        description:
            'A sofa, also known as a couch or settee, is a piece of furniture designed for comfortable seating in a living room, lounge, or other communal spaces. It serves as a central gathering spot for relaxation, socializing, and entertainment.',
        img: 'assets/sofa.jpg',
        price: '\$20'),
    Item(
        title: 'Home Decoration',
        description:
            'Modern minimalism is a home decoration style that embraces simplicity, clean lines, and a clutter-free environment. It is characterized by a sleek and contemporary aesthetic that focuses on functionality and the use of minimal decorative elements. This style creates a calming and serene atmosphere while maintaining a sense of elegance and sophistication.',
        img: 'assets/1.jpg',
        price: '\$70'),
    Item(
        title: 'Home Decoration',
        description:
            'Modern minimalism is a home decoration style that embraces simplicity, clean lines, and a clutter-free environment. It is characterized by a sleek and contemporary aesthetic that focuses on functionality and the use of minimal decorative elements. This style creates a calming and serene atmosphere while maintaining a sense of elegance and sophistication.',
        img: 'assets/2.jpg',
        price: '\$80'),
    Item(
        title: 'Home Decoration',
        description:
            'Modern minimalism is a home decoration style that embraces simplicity, clean lines, and a clutter-free environment. It is characterized by a sleek and contemporary aesthetic that focuses on functionality and the use of minimal decorative elements. This style creates a calming and serene atmosphere while maintaining a sense of elegance and sophistication.',
        img: 'assets/3.jpg',
        price: '\$90'),
  ];
});
