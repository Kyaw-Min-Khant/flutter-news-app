import 'package:blog_app/services/api_services.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatefulWidget {
  final Function(List<dynamic>) onDataFetched;
  final Function(bool) onLoadingStateChanged;
  const HomeSearchBar({
    super.key,
    required this.onDataFetched,
    required this.onLoadingStateChanged,
  });

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  String? selectedCategory;
  bool isLoading = false;
  Future<void> searchData(String name) async {
    widget.onLoadingStateChanged(true);
    try {
      final data = await ApiServices().searchNews(name);
      widget.onDataFetched(data);
    } catch (e) {
      debugPrint('Error Searching data : $e');
    } finally {
      widget.onLoadingStateChanged(false);
    }
  }

  Future<void> fetchData(String category) async {
    widget.onLoadingStateChanged(true);
    try {
      final data = await ApiServices().fetchNewsByCategory(category);
      widget.onDataFetched(data);
    } catch (e) {
      debugPrint('Error Fetching data : $e');
    } finally {
      widget.onLoadingStateChanged(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Expanded(
          child: SizedBox(
            height: 60, // Set the desired height
            child: TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  debugPrint("Searching for : $value");
                  searchData(value);
                }
              },
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Search",
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 236, 236, 236),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 236, 236, 236),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintStyle: TextStyle(textBaseline: TextBaseline.alphabetic),
                prefixIcon: Icon(Icons.search, size: 26),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 120, // Adjust the width of the dropdown
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: "Category",
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            icon: Icon(Icons.tune, size: 26),
            items: [
              DropdownMenuItem(value: "technology", child: Text("Tech")),
              DropdownMenuItem(value: "sports", child: Text("Sports")),
              DropdownMenuItem(value: 'entertainment', child: Text("Art")),
              DropdownMenuItem(value: 'business', child: Text("Business")),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedCategory = value;
                  fetchData(value);
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
