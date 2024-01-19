import 'package:flutter/material.dart';
import 'main.dart'; // Import the file containing your EncryptorScreen class

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/bglogin.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text(
                  
                  "Welcome to Enigma",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color:Colors.white),
                ),
               SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                   color:Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Enigma is a cutting-edge application designed to provide advanced encryption capabilities, ensuring the utmost security for your messages and sensitive data. With its user-friendly interface,\nEnigma empowers you to safeguard your information against unauthorized access,guaranteeing confidentiality and privacy. Whether youre communicating with colleagues, sharing confidential files, or simply seeking to fortify your digital interactions,Enigma offers a reliable solution that leverages state-of-the-art encryption techniques. Experience the peace of mind that comes from knowing your information is shielded with industry-leading security measures. Take control of your data security with Enigma andembark on a new era of secure communication.",
                    
                     textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: ('Roboto'),
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EncryptorScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, 
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), 
                      ),
                    ),
                  child: Text("Click to Get Started",style: TextStyle(color:Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
