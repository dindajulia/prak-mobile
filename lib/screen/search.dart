import 'package:flutter/material.dart';
import 'package:yummly_ui/detail.dart';
import 'package:yummly_ui/screen/constans.dart';
import 'package:yummly_ui/shared.dart';
import 'package:yummly_ui/data.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<bool> optionSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.sort,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 16,
            ),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextTitleVariation1('Hi! Yummly Me'),
                  buildTextSubTitleVariation1(
                      'Healthy and nutritious food recipes'),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      option('Vegetable', 'assets/images/icons/salad.jpg', 0),
                      SizedBox(
                        width: 8,
                      ),
                      option('Rice', 'assets/images/icons/rice.jpg', 1),
                      SizedBox(
                        width: 8,
                      ),
                      option('Fruit', 'assets/images/icons/fruit.jpg', 2),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 350,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildRecipes(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                children: [
                  buildTextSubTitleVariation2('Popular', false),
                  SizedBox(
                    width: 8,
                  ),
                  buildTextTitleVariation2('Food', true),
                ],
              ),
            ),
            Container(
              height: 190,
              child: PageView(
                physics: BouncingScrollPhysics(),
                children: buildPopulars(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget option(String text, String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          optionSelected[index] = !optionSelected[index];
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: optionSelected[index] ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [kBoxShadow],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 22,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 10,
              child: Image.asset(
                image,
                color: optionSelected[index] ? Colors.black : Colors.white,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: TextStyle(
                color: optionSelected[index] ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildRecipes() {
    List<Widget> list = [];
    for (var i = 0; i < getRecipe().length; i++) {
      list.add(buildRecipe(getRecipe()[i], i, context));
    }
    return list;
  }
}

Widget buildRecipe(Recipe recipe, int index, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Detail(recipe: recipe)),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [kBoxShadow],
      ),
      margin: EdgeInsets.only(
          right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
      padding: EdgeInsets.all(16),
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Hero(
              tag: recipe.image,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(recipe.image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          buildRecipeTitle(recipe.title),
          buildTextSubTitleVariation1(recipe.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCalories(recipe.calories.toString() + " Kcal"),
              Icon(
                Icons.favorite_border,
                color: Colors.white,
              )
            ],
          ),
        ],
      ),
    ),
  );
}

List<Widget> buildPopulars() {
  List<Widget> list = [];
  for (var i = 0; i < getRecipe().length; i++) {
    list.add(buildPopular(getRecipe()[i]));
  }
  return list;
}

Widget buildPopular(Recipe recipe) {
  return Container(
    margin: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.all(
        Radius.circular(3),
      ),
      boxShadow: [kBoxShadow],
    ),
    child: Row(
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(recipe.image),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildRecipeTitle(recipe.title),
                buildRecipeSubTitle(recipe.description),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCalories(recipe.calories.toString() + " Kcal"),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
