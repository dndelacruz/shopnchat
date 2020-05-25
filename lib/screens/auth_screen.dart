import '../widgets/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;
  void _submitAuthData(Map _formData) async {
    // print(_formData);
    AuthResult _authResult;
    setState(() => _isLoading = true);
    try {
      if (_formData['isLoginMode']) {
        _authResult = await _auth.signInWithEmailAndPassword(
            email: _formData['email'], password: _formData['password']);
      } else {
        _authResult = await _auth.createUserWithEmailAndPassword(
            email: _formData['email'], password: _formData['password']);

        // upload the image
        final ref =  FirebaseStorage.instance.ref().child('user-image').child(_authResult.user.uid + '.jpg');
        await ref.putFile(_formData['userImage']).onComplete;
        final url = await ref.getDownloadURL();

        await Firestore.instance.collection('users').document(_authResult.user.uid).setData({
          'username': _formData['username'],
          'email': _formData['email'],
          'image_url': url
        });
      }
      setState(() => _isLoading = false);
    } on PlatformException catch (e) {
      var message = 'Authentication error';
      Scaffold.of(_formData['context']).showSnackBar(
        SnackBar(
            backgroundColor: Theme.of(context).errorColor,
          content: Text(e.toString(), textAlign: TextAlign.center,),
        ),
      );
      setState(() => _isLoading = false);
    } catch (e) {
      print(e.toString());
      // setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AuthForm(_isLoading, _submitAuthData));
  }
}
