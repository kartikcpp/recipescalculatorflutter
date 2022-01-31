import 'package:flutter/material.dart';
import './recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: Image(
                image: AssetImage(widget.recipe.imgUrl),
              ),
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 20),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: widget.recipe.ingredients.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ingredient = widget.recipe.ingredients[index];
                      return Center(
                        child: Text(
                            '${ingredient.quantity*_sliderVal} ${ingredient.measure} ${ingredient.name} '),
                      );
                    })),
                    Center(child: Text('No of Servings: ${widget.recipe.servings * _sliderVal}'),),
                    
            Slider(
                min: 1,
                max: 10,
                label: '${widget.recipe.servings * _sliderVal}',
                value: _sliderVal.toDouble(),
                onChanged: (newValue) {
                  setState(() {
                    _sliderVal = newValue.round();
                  });
                },
                activeColor: Colors.blue,
                inactiveColor: Colors.black,)
          ],
        ),
      ),
    );
  }
}
