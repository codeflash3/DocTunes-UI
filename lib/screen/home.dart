import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isVisible = false;
  final ImagePicker _picker = ImagePicker();
  void pickImagesCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
  }

  void pickImagesGallery() async {
    final List<XFile>? result = await _picker.pickMultiImage();
  }

  void getpdf() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
  }

  Widget dialog() {
    return Dialog(
      backgroundColor: Colors.red,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Type here",
        ),
      ),
      elevation: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffdbecf6),
                borderRadius: BorderRadius.circular(300),
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 8.0),
                ],
              ),
              padding: EdgeInsets.all(0),
              child: Icon(
                Icons.add_circle_rounded,
                color: Colors.blue,
                size: h * 0.32,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: w * 0.05, top: h * 0.01),
          // margin: EdgeInsets.symmetric(horizontal: 40),
          child: RichText(
            text: TextSpan(
              text: 'Tap on the ',
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
                fontFamily: 'Ondo',
                fontWeight: FontWeight.w300,
              ),
              children: const <TextSpan>[
                TextSpan(
                  text: '+',
                  style: TextStyle(color: Colors.blue, fontSize: 19),
                ),
                TextSpan(
                  text: ' icon to',
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: w * 0.05, top: h * 0.01),
          child: Text(
            "browse files on your phone",
            style: TextStyle(
              fontSize: 19,
            ),
          ),
        ),
        Spacer(),
        Visibility(
          visible: _isVisible,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),

              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.08, vertical: h * 0.02),
              // margin: EdgeInsets.symmetric(horizontal: w*0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print("text");
                            showAlertDialog(context);
                          },
                          child: Icon(
                            Icons.text_fields_rounded,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Text",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print("image");
                            pickImagesGallery();
                          },
                          child: Icon(
                            Icons.image,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Image",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            pickImagesCamera();
                            print("object");
                          },
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print("PDF");
                            getpdf();
                          },
                          child: Icon(
                            Icons.picture_as_pdf_rounded,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "PDF",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: const Text(
        'Search',
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Search Here'),
      content: TextField(
        decoration: InputDecoration(
          hintText: "Type Here",
        ),
      ),
      actions: [okButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
