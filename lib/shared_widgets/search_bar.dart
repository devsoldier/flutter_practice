import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final FocusNode focusNode;
  const SearchBarWidget({Key? key, required this.focusNode}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  void initState() {
    widget.focusNode.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: const InputDecoration(
          icon: Icon(Icons.search),
          hintText: 'Search food',
        ),
        focusNode: widget.focusNode,
        onTap: () {},
      ),
    );
  }
}
