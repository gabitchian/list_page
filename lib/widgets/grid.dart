import 'package:flutter/material.dart';
import 'package:list_page/shared/extensions/list_extension.dart';
import 'package:list_page/widgets/pagination.dart';

class Grid<T> extends StatefulWidget {
  int maxRows, maxColumns;
  List<T> elements;
  Widget Function(T e) onMap;
  Grid(
      {Key? key,
      required this.maxRows,
      required this.maxColumns,
      required this.elements,
      required this.onMap})
      : super(key: key);

  @override
  State<Grid<T>> createState() => _Grid<T>();
}

class _Grid<T> extends State<Grid<T>> {
  int _selectedPage = 0, _rows = 0, _columns = 0;

  late List<List<T>> matrix;
  late int numberOfPages;

  @override
  void initState() {
    _rows = widget.maxRows;
    _columns = widget.maxColumns;
    matrix = widget.elements.chunk(_columns);
    numberOfPages = (matrix.length / _rows).ceil();
  }

  void updateSelectedPage(int selectedPage) {
    if (selectedPage != _selectedPage) {
      setState(() {
        _selectedPage = selectedPage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int maxRangeInCurrentPage = (_rows * (_selectedPage + 1));
    int untilRange = matrix.length <= maxRangeInCurrentPage
        ? matrix.length
        : maxRangeInCurrentPage;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              spacing: 8,
              direction: Axis.vertical,
              children: matrix
                  .getRange(_selectedPage * _rows, untilRange)
                  .map((column) {
                return Wrap(
                  spacing: 8,
                  children: column.map((e) => widget.onMap(e)).toList(),
                );
              }).toList(),
            ),
            //TODO: fix pagination when there are too many pages
            Pagination(
                numberOfPages: numberOfPages,
                selectedPage: _selectedPage,
                onClick: updateSelectedPage),
          ],
        ),
      ),
    );
  }
}
