import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hmaserv/core/resources/resources.dart';
import 'package:hmaserv/core/view/views.dart';
import 'package:hmaserv/modules/movies/domain/entities/genre_entity.dart';

class GenreChip extends StatelessWidget {
  final Genre genre;

  const GenreChip({required this.genre, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
      child: CustomText(genre.name, fontSize: FontSize.s12, color: AppColors.white),
    );
  }
}
