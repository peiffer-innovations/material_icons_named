import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_icons_named/material_icons_named.dart';

import 'example_icon.dart';

void main() {
  runApp(const MaterialIconGalleryApp());
}

class MaterialIconGalleryApp extends StatelessWidget {
  const MaterialIconGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Icons Gallery',
      theme: ThemeData.light().copyWith(
        iconTheme: const IconThemeData(
          color: Colors.black87,
          size: 36.0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black87,
            fontSize: 16.0,
          ),
        ),
      ),
      home: const MaterialIconGalleryHome(),
    );
  }
}

class MaterialIconGalleryHome extends StatefulWidget {
  const MaterialIconGalleryHome({super.key});

  @override
  State<StatefulWidget> createState() => MaterialIconGalleryHomeState();
}

class MaterialIconGalleryHomeState extends State<MaterialIconGalleryHome> {
  final List<ExampleIcon> icons = [];

  @override
  void initState() {
    super.initState();

    for (var entry in materialIcons.entries) {
      icons.add(ExampleIcon(entry.value, entry.key));
    }
  }

  var _searchTerm = '';
  var _isSearching = false;

  @override
  Widget build(BuildContext context) {
    final filteredIcons = icons
        .where((icon) =>
            _searchTerm.isEmpty ||
            icon.title.toLowerCase().contains(_searchTerm.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: _isSearching ? _searchBar(context) : _titleBar(),
      body: Scrollbar(
        thumbVisibility: kIsWeb,
        child: GridView.builder(
          itemCount: filteredIcons.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            final icon = filteredIcons[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Hero(
                            tag: icon,
                            child: Icon(
                              icon.iconData,
                              size: 100,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(tag: icon, child: Icon(icon.iconData)),
                  Container(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(icon.title),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _titleBar() {
    return AppBar(
      title: const Text('Material Icons Gallery'),
      actions: [
        IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ModalRoute.of(context)?.addLocalHistoryEntry(
                LocalHistoryEntry(
                  onRemove: () {
                    setState(() {
                      _searchTerm = '';
                      _isSearching = false;
                    });
                  },
                ),
              );

              setState(() {
                _isSearching = true;
              });
            })
      ],
    );
  }

  AppBar _searchBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_left),
        onPressed: () {
          setState(
            () {
              Navigator.pop(context);
              _isSearching = false;
              _searchTerm = '';
            },
          );
        },
      ),
      title: TextField(
        onChanged: (text) => setState(() => _searchTerm = text),
        autofocus: true,
        style: const TextStyle(fontSize: 18.0),
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
