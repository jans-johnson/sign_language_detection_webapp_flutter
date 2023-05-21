class Constants {
  static String main_page_desc =
      '''The application converts Indian Sign Language into corresponding letters using skeletal-point feature extraction technology.'''
          .replaceAll("\n", "");
  static String about =
      '''SignScribe was developed as a final-year project with the objective of facilitating better 
communication between society's hearing and non-hearing sections. The ML model makes its predictions based on 
action recognition using skeletal points. Each sign has a distinct set of skeletal points, which can be 
accurately defined using MediaPipe. The application supports real-time translation and identifies 25 alphabets 
which high accuracy. The interface is created using Flutter.'''
          .replaceAll("\n", "");
  static String instructions = '''Make sure that you are in a well-lit room and your hands are completely visible in the frame. 
Click the Capture button below to start capturing 30 frames.'''.replaceAll("\n", "");
}
