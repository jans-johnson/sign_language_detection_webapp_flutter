import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
      cameras = await availableCameras();
      if(cameras != null){
        controller = CameraController(cameras![1], ResolutionPreset.max);
                    //cameras[0] = first camera, change to 1 to another camera
                    
        controller!.initialize().then((_) {
            if (!mounted) {
              return;
            }
            setState(() {});
        });
      }else{
        print("NO any camera found");
      }
  }

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
          appBar: AppBar( 
              title: Text("Capture Image from Camera"),
              backgroundColor: Colors.redAccent,
          ),
          body: Container( 
            child: Column(
              children:[
                  Container(
                      height:300,
                      width:400,
                      child: controller == null?
                          Center(child:Text("Loading Camera...")):
                                !controller!.value.isInitialized?
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ):
                                  CameraPreview(controller!)
                  ),

                  ElevatedButton.icon( //image capture button
                    onPressed: () async{
                        try {
                          if(controller != null){ //check if contrller is not null
                              if(controller!.value.isInitialized){ //check if controller is initialized
                                  image = await controller!.takePicture(); //capture image
                                  setState(() {
                                    //update UI
                                  });
                              }
                          }
                        } catch (e) {
                            print(e); //show error
                        }
                    },
                    icon: Icon(Icons.camera),
                    label: Text("Capture"),
                  ),

                  Container( //show captured image
                     padding: EdgeInsets.all(30),
                     child: image == null?
                           Text("No image captured"):
                           Image.file(File(image!.path), height: 300,), 
                  )
              ]
            )
          ),
           
       );
  }
}