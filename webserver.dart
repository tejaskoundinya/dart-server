import 'dart:io';

void main() {
  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080).then((server) {
    print(server);
    server.listen((HttpRequest request) {
      //print(request.uri);
      String path = request.uri.toString();
      if(path.contains("favicon.ico")) {
        
      }
      else {
        //print(path);
        String filePath;
        filePath = "D:/DartServer" + path; // Here, "D:/DartServer" is web root
        new File(filePath).readAsString()
          .then((String contents) {
           request.response.write(contents);
           request.response.close();
           //print(contents);
          })
          .catchError((e) {
            request.response.write("Error 404");
            request.response.close();
          });
      }
    });
  });
}
