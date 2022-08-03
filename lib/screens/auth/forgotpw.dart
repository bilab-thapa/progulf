import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios_new_sharp),
              ),
              Center(
                child: SizedBox(
                  height: height * 0.4,
                  width: width * 0.9,
                  child: Image.network(
                      'https://media.istockphoto.com/vectors/man-forgot-the-password-concept-of-forgotten-password-key-account-vector-id1306827906?k=20&m=1306827906&s=612x612&w=0&h=pQBbTdryITE9Dok1NNlF3N1KnbisjDbPXTDKzbOzs1o='),
                ),
              ),
              // Text(
              //   'Forgot Password?',
              //   style: TextStyle(fontSize: 24),
              // ),
              Center(
                child: SizedBox(
                  width: width * 0.85,
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.deepOrange, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.deepOrange, width: 3.0),
                      ),
                      focusColor: Colors.deepOrange,
                      hintText: 'Email Address',
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
              Center(
                child: SizedBox(
                  height: height * 0.05,
                  width: width * 0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () {},
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
