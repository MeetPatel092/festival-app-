import 'dart:io';
import 'dart:ui';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotely/colors/colors.dart';
import 'package:quotely/modeal/modeal.dart';
import 'package:quotely/utills/utills.dart';
import 'package:share_extend/share_extend.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color selFontColor = Colors.white;
  String? selImage;
  Color selBackGroundColor = primaryblack;

  List<String> fontFamilies = GoogleFonts.asMap().keys.toList();
  late String? selFont = fontFamilies.isNotEmpty ? fontFamilies.first : null;
  double textSize = 18;
  double dx = 0;
  double dy = 0;
  GlobalKey repaintKey = GlobalKey();
  Future<void> shareImage() async {
    RenderRepaintBoundary renderRepaintBoundary =
        repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    var image = await renderRepaintBoundary.toImage(pixelRatio: 5);

    var byteData = await image.toByteData(format: ImageByteFormat.png);

    var fetchImage = byteData!.buffer.asUint8List();

    Directory directory = await getApplicationCacheDirectory();

    String path = directory.path;

    File file = File('$path.png');

    file.writeAsBytes(fetchImage as List<int>);

    ShareExtend.share(file.path, "Image");
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Festify",
          style: TextStyalling.appbar_title,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.save),
          ),
          IconButton(
            onPressed: () async {
              await FlutterClipboard.copy(AllQuote.allquotes[0]['quote'])
                  .then((value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    content: Text("copy successfully..."),
                  ),
                );
              });
            },
            style: IconButton.styleFrom(
              hoverColor: Colors.greenAccent,
            ),
            icon: Icon(Icons.copy),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RepaintBoundary(
            key: repaintKey,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 420,
              width: 380,
              alignment: Alignment(dx, dy),
              decoration: BoxDecoration(
                color: selBackGroundColor,
                borderRadius: BorderRadius.circular(20),
                image: (selImage != null)
                    ? DecorationImage(
                        image: AssetImage(selImage!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: SelectableText(
                textAlign: TextAlign.center,
                "${AllQuote.allquotes[3]['quote']}",
                style: GoogleFonts.getFont(
                  selFont!,
                  textStyle: TextStyle(
                    fontSize: textSize,
                    color: selFontColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Change Image :",
                          style: TextStyalling.fontsize,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...data['f_image'].map((imagePath) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selImage =
                                          imagePath; // Corrected assignment
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.purple,
                                      image: DecorationImage(
                                        image: AssetImage(imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Change Fonts :",
                          style: TextStyalling.fontsize,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: fontFamilies
                                .map((e) => (fontFamilies.indexOf(e) <= 20)
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selFont = e;
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 10, top: 10),
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            // border: Border.all(
                                            //   color: Colors.black87,
                                            //   width: 3,
                                            // ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Aa",
                                            style: GoogleFonts.getFont(
                                              e,
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container())
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Change Font Colors :",
                          style: TextStyalling.fontsize,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: Colors.primaries
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selImage;
                                          selFontColor = e;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: 10, top: 10),
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: e,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Change for a  Align :",
                          style: TextStyalling.fontsize,
                        ),
                        Slider(
                          value: dy,
                          min: -0.95,
                          max: 0.95,
                          onChanged: (val) {
                            setState(() {
                              dy = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Change Font Size :",
                          style: TextStyalling.fontsize,
                        ),
                        Slider(
                          value: textSize,
                          min: 10,
                          max: 18,
                          onChanged: (val) {
                            setState(() {
                              textSize = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await shareImage();
        },
        child: Icon(Icons.share_rounded),
      ),
    );
  }
}
