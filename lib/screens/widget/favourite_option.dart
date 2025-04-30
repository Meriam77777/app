import 'package:flutter/material.dart';

import '../../models/course.dart';

class FavouriteOption extends StatefulWidget {
  const FavouriteOption({Key? key, required this.course}) : super(key: key);  // Corrected this line


final Course course;

  @override
  State<FavouriteOption> createState() => _FavouriteOptionState();
}

class _FavouriteOptionState extends State<FavouriteOption> {

  bool isFavourite = false;
  @override
  void initState(){
    super.initState();
    isFavourite =  widget.course.isFavourite!;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:(){
      setState(() {
        isFavourite = !isFavourite;
         widget.course.isFavourite = isFavourite;
      });

  },
        icon: Icon(isFavourite ? Icons.favorite: Icons.favorite_border,
        color: Colors.pink,
        ));
  }
}
