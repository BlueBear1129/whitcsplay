// ignore_for_file: unused_local_variable, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class TextBox extends StatefulWidget {
  TextBox({Key? key, required this.text}) : super(key: key);
  String text;
  //TextStyle textStyle;

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    var printingText = Text(
      widget.text,
      //style: widget.textStyle,
      textAlign: TextAlign.left,
    ); // passing text and text style into printingText

    //Passing text from TextBox into printText so that it takes in 
    //the text from the txt file into the string and then displays it.
    String? printText = widget.text;
    void _loadData() async {
      final _loadedData =
          await rootBundle.loadString('.lib/textfile/lessonsfile.txt');
      setState(() {
        printText = _loadedData;
      });
    }

    @override
    void initState() {
      super.initState();
      _loadData();
    }

    return InkWell(
      child: Container(
        height: 350,
        padding: const EdgeInsets.all(40), // adding padding to the edges of the text.
         
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          color: Color(0xff5f9a80),
        ),
     
        constraints: const BoxConstraints(
          maxHeight: 400.0,
          maxWidth: 460.0,
          minWidth: 460.0,
          minHeight: 400.0,
        ),

        //child: Text(printText ?? 'empty',style: const TextStyle(color: Colors.white)),
        // making the text scrollable in the conatainer. 
        child: Positioned(
          top: 0,
          left: 10,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            //scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(printText ?? 'empty-textbox',
                    style: const TextStyle(color: Colors.white))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
