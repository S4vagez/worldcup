import 'package:flutter/material.dart';
import 'package:flutter_food_20221016/models/food_item.dart';
import 'package:flutter_food_20221016/services/api.dart';


class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List<FoodItem>? _foodList;
  var _isLoading = false;
  String? _errMessage;

  @override
  void initState() {
    super.initState();
    _fetchFoodData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FIFA WORLD CUP 2022')),
      backgroundColor: Colors.red,
      body: Column(

        children: [
      Card(
      child: InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.jpg', width: 350.0 , height:200),
          ],
      ),
      ),
      ),

          /*Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _fetchFoodData,
              child: const Text('GET FOOD DATA'),
            ),
          ),*/
          Expanded(
            child: Stack(
              children: [
                if (_foodList != null)
                  ListView.builder(
                    itemBuilder: _buildListItem,
                    itemCount: _foodList!.length,
                  ),
                if (_isLoading)
                  const Center(child: CircularProgressIndicator()),
                if (_errMessage != null && !_isLoading)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(_errMessage!),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _fetchFoodData();
                          },
                          child: const Text('RETRY'),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _fetchFoodData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var data = await Api().fetch('');
      setState(() {
        _foodList = data
            .map<FoodItem>((item) => FoodItem.fromJson(item))
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  Widget _buildListItem(BuildContext context, int index) {
    var foodItem = _foodList![index];

    return Card(
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Image.network(
              foodItem.flagImage,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8.0),
            Text(foodItem.team),

          ],
        ),
      ),
    );
  }
}
