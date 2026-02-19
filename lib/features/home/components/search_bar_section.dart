// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SearchBarSection extends StatelessWidget {
   SearchBarSection({super.key , required this.searchContoller , required this.onChanged});

TextEditingController searchContoller ;
void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return    
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                child: TextField(
                  controller: searchContoller,
                  onChanged: onChanged ,
                  decoration: InputDecoration(
                    hintText: "Search",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade200,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade200,
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    ),

                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  cursorColor: Colors.grey,
                ),
              );


  }
}