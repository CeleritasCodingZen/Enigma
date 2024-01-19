import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'intro_page.dart';

void main() {
  runApp(EncryptorApp());
}

class EncryptorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
     
      ),
      home: IntroPage(),
    );
  }
}

class EncryptorScreen extends StatefulWidget {
  @override
  _EncryptorScreenState createState() => _EncryptorScreenState();
}

class _EncryptorScreenState extends State<EncryptorScreen> {
  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();
  TextEditingController keyInputController = TextEditingController();
  TextEditingController keyOutputController = TextEditingController();

  List<String> list = [];
  List<String> shuffledList = [];

  @override
  void initState() {
    super.initState();
   
  }

  void newKey() {
    list.clear();
    shuffledList.clear();

    for (int i = 33; i < 127; i++) {
      list.add(String.fromCharCode(i));
    }

    shuffledList = List.from(list);
    shuffledList.shuffle();
    showToast("New key generated.");
  }

  void setKey() {
    if (keyInputController.text.length != 94) {
      showToast("Invalid input. Key must be 94 characters long.");
      return;
    }

    List<String> newShuffledList = [];

    for (int i = 0; i < keyInputController.text.length; i++) {
      String c = keyInputController.text[i];
      if (newShuffledList.contains(c)) {
        showToast("Invalid input. Key must contain unique characters.");
        return;
      }
      newShuffledList.add(c);
    }

    list = list;
    shuffledList = newShuffledList;
    showToast("Key has been updated.");
    keyInputController.clear();
    keyOutputController.clear();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void encrypt() {
    List<String> letters = inputController.text.split('');

    for (int i = 0; i < letters.length; i++) {
      for (int j = 0; j < list.length; j++) {
        if (letters[i] == list[j]) {
          letters[i] = shuffledList[j];
          break;
        }
      }
    }

    outputController.text = letters.join();
  }

void decrypt() {
  List<String> letters = outputController.text.split('');

  for (int i = 0; i < letters.length; i++) {
    for (int j = 0; j < shuffledList.length; j++) {
      if (letters[i] == shuffledList[j]) {
        letters[i] = list[j];
        break;
      }
    }
  }

  inputController.text = letters.join(); 
}


  void clear() {
    inputController.clear();
    outputController.clear();
    keyInputController.clear();
    keyOutputController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/bgmain1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
           
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 35,),
              TextFieldWithClearIcon(
                labelText: 'Original Message',
                
                controller: inputController,
                onClear: () => inputController.clear(),
              ),
              SizedBox(height: 16.0),
              TextFieldWithClearIcon(
                labelText: 'Encrypted Message',
                
                controller: outputController,
                onClear: () => outputController.clear(),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: encrypt,
                   
                  style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, 
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), 
 
                      ),
                    ),
                     child: Text('Encrypt',style: TextStyle(color:Colors.white),),
                  ),
                  ElevatedButton(
                    onPressed: decrypt,
                    child: Text('Decrypt',style: TextStyle(color:Colors.white),), 

                  style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, 
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), 
                  // Change this to the desired border radius
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextFieldWithClearIcon(
                labelText: 'Enter Key',
                controller: keyInputController,
                onClear: () => keyInputController.clear(),
              ),
              SizedBox(height: 16.0),
              TextFieldWithClearIcon(
                labelText: 'Key Output',
                readOnly: true,
                controller: keyOutputController,
                onClear: () => keyOutputController.clear(),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: newKey,
                    child: Text('New Key',style: TextStyle(color:Colors.white),),
                    
                  style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, 
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), 
               
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: setKey,
                    child: Text('Set Key',style: TextStyle(color:Colors.white),),

                  style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, 
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), 
              
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: getKey,
                    child: Text('Get Key',style: TextStyle(color:Colors.white),),

                  style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, 
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), 
                
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: clear,
                    child: Text('Clear',style: TextStyle(color:Colors.white),),
                  style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, 
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), 
          
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getKey() {
    String key = shuffledList.join();
    keyOutputController.text = key;
  }
}

class TextFieldWithClearIcon extends StatelessWidget {
  final String labelText;
  final bool readOnly;
  final TextEditingController controller;
  final VoidCallback onClear;

  TextFieldWithClearIcon({
    required this.labelText,
    this.readOnly = false,
    required this.controller,
    required this.onClear,
  });

    @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            
            decoration: InputDecoration(
              labelText: labelText,
              
              labelStyle: TextStyle(fontFamily: 'ProximaNova',color: Colors.white),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black, 
                  width: 1.0, 
                ),
              ),
            ),
            controller: controller,
            readOnly: readOnly,
            style: TextStyle(fontFamily: 'ProximaNova', color: Colors.white ),
          ),
        ),
        IconButton(
          onPressed: onClear,
          
          icon: Icon(Icons.clear),
          color:Colors.white,
        ),
      ],
    );
  }
}