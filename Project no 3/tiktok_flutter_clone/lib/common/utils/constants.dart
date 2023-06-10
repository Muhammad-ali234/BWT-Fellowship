import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_flutter_clone/features/auth/controller/auth_controller.dart';
import 'package:tiktok_flutter_clone/features/home/screens/video_screen.dart';
import 'package:tiktok_flutter_clone/features/post/screens/add_video_screen.dart';
import 'package:tiktok_flutter_clone/features/profile/screens/profile_screen.dart';
import 'package:tiktok_flutter_clone/features/search/screens/search_screen.dart';

List pages = [
  VideoScreen(),
  SearchScreen(),
  const AddVideoScreen(),
  const Text('Messages Screen'),
  ProfileScreen(uid: authController.user.uid),
];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
