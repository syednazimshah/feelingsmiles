import 'package:feelingsmiles/loading.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tflite/tflite.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool initialized=false;
  List<CameraDescription>? cameras;
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  FaIcon icon= FaIcon(FontAwesomeIcons.faceGrin);

  loadicon(output){
    if(output=="Happy"){
      setState(() {
        icon = FaIcon(FontAwesomeIcons.faceGrin,size: 70,);
      });

    }
    else if(output=="sad"){
        setState(() {
          icon = FaIcon(FontAwesomeIcons.faceSadCry,size: 70);
      });

    }
    else{
      setState(() {
        icon = FaIcon(FontAwesomeIcons.faceAngry,size: 70);
    });

    }
  }

  @override
  void initState() {
    super.initState();
    loadCamera().whenComplete(() => loadmodel().whenComplete(()=>initialized=true ));
  }
  vibrate(output){
    if(output=="Happy"){
      Vibrate.feedback(FeedbackType.medium);

    }
    else if(output=="sad"){
      Vibrate.feedback(FeedbackType.light);
    }
    else{
      Vibrate.feedback(FeedbackType.heavy);

    }
  }
  loadCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras![1], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }
  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 3,
          threshold: 0.1,
          asynch: true);
      predictions!.forEach((element) {
        setState(() {
          output = element['label'];
          loadicon(output);
          vibrate(output);
        });
      });
    }
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt");
  }

  @override
  Widget build(BuildContext context) {
    if(initialized){
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: !cameraController!.value.isInitialized
                ? Container()
                : AspectRatio(
              aspectRatio: cameraController!.value.aspectRatio,
              child: CameraPreview(cameraController!),
            ),
          ),
        ),
        Text(
          output,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 10,),
        icon,


      ]),
    );
  }
    else{
      return loading();

    }
  }


}
