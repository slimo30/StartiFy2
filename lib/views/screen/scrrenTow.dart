import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:startify/globale.dart';
import 'package:startify/views/component/MyBottomNavigationBar.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  int currentIndex = 2;
  List<File> _images = [];
  List<File> _files = [];

  Future<void> _pickImages() async {
    final imagePicker = ImagePicker();
    List<XFile>? pickedImages =
        await imagePicker.pickMultiImage(imageQuality: 50);

    setState(() {
      _images = pickedImages?.map((image) => File(image.path)).toList() ?? [];
    });
  }

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'xls'],
    );

    if (result != null) {
      setState(() {
        _files = result.paths?.map((path) => File(path!)).toList() ?? [];
      });
    }
  }

  Widget _buildImageList() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          File image = _images[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColor.bleu,
                  width: 1,
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(image, fit: BoxFit.cover),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.cancel,
                        color: AppColor.red,
                      ),
                      onPressed: () {
                        setState(() {
                          _images.remove(image);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFileList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _files.map((file) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              const Icon(Icons.insert_drive_file, color: AppColor.bleu),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  file.path,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.cancel,
                  color: AppColor.red,
                ),
                onPressed: () {
                  setState(() {
                    _files.remove(file);
                  });
                },
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: AppColor.bleu),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Add a startup',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: AppColor.bleu,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: AppColor.grey,
                  ),
                ),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColor.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.email, color: AppColor.bleu),
                ),
              ),
              const SizedBox(height: 20),
              const CustomContainer(),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _pickImages,
                icon: const Icon(Icons.image, color: AppColor.white),
                label: const Text(
                  'Upload Images',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.bleu,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Display selected images in a row
              _buildImageList(),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _pickFiles,
                icon: const Icon(Icons.file_upload, color: AppColor.white),
                label: const Text(
                  'Upload Files',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.bleu,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Display selected files in columns
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _files.isNotEmpty
                    ? [
                        const Text(
                          'Selected Files:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.bleu,
                          ),
                        ),
                        // Display selected files
                        _buildFileList(),
                        const SizedBox(height: 20),
                      ]
                    : [],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.bleu,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text(
                        "Send Request",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;

              switch (index) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/home');
                  break;
                case 1:
                  Navigator.pushReplacementNamed(context, '/news');
                  break;
                case 3:
                  Navigator.pushReplacementNamed(context, '/help');
                  break;
                case 4:
                  Navigator.pushReplacementNamed(context, '/profile');
                  break;
                default:
                  break;
              }
            });
          },
          selectedItemColor: AppColor.bleu,
          items: [
            buildBottomNavigationBarItem(
              'assets/icons/home.svg',
              'Home',
              currentIndex == 0 ? AppColor.bleu : AppColor.grey,
            ),
            buildBottomNavigationBarItem(
              'assets/icons/news.svg',
              'News',
              currentIndex == 1 ? AppColor.bleu : AppColor.grey,
            ),
            buildBottomNavigationBarItem(
              'assets/icons/add.svg',
              'Add',
              currentIndex == 2 ? AppColor.bleu : AppColor.grey,
            ),
            buildBottomNavigationBarItem(
              'assets/icons/help.svg',
              'Help',
              currentIndex == 3 ? AppColor.bleu : AppColor.grey,
            ),
            buildBottomNavigationBarItem(
              'assets/icons/profile.svg',
              'Profile',
              currentIndex == 4 ? AppColor.bleu : AppColor.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: AppColor.grey,
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Startup Social Media',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: AppColor.grey,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          _buildTextField(labelText: 'Instagram'),
          const SizedBox(height: 10.0),
          _buildTextField(labelText: 'LinkedIn'),
        ],
      ),
    );
  }

  Widget _buildTextField({required String labelText}) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: const UnderlineInputBorder(),
      ),
    );
  }
}
