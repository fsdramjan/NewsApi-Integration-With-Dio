import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/src/configs/appColors.dart';
import 'package:news_api/src/controllers/baseController.dart';
import 'package:news_api/src/models/article.dart';
import 'package:news_api/src/widgets/kText.dart';

class UpdateNewsPage extends StatefulWidget {
  final Article allNews;
  UpdateNewsPage({
    required this.allNews,
  });

  @override
  State<UpdateNewsPage> createState() => _UpdateNewsPageState();
}

class _UpdateNewsPageState extends State<UpdateNewsPage>
    with BaseController {
  //

  final authorController = TextEditingController();
  final descriptionController = TextEditingController();
  final titleController = TextEditingController();
  final urlToImageController = TextEditingController();
  final urlController = TextEditingController();
  // final publishedAtController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    authorController.text = widget.allNews.author.toString();
    descriptionController.text = widget.allNews.description.toString();
    titleController.text = widget.allNews.title.toString();
    urlController.text = widget.allNews.url.toString();
    urlToImageController.text = widget.allNews.urlToImage.toString();
    contentController.text = widget.allNews.content.toString();
    super.initState();
  }

  //
  final _formKey = GlobalKey<FormState>();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: newsC.article.isEmpty? 'Update News' : 'Add News',
          color: black,
          fontFamily: medium,
        ),
      ),
      body: Padding(
        padding: padding10,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              kTextFormField(
                hintText: 'Author',
                color: blueGrey,
                controller: authorController,
                onChanged: newsC.author,
                validator: 'Author',
              ),
              sizeBox10,
              kTextFormField(
                hintText: 'Title',
                color: blueGrey,
                controller: titleController,
                onChanged: newsC.title,
                validator: 'Title',
              ),
              sizeBox10,
              kTextFormField(
                hintText: 'Url',
                color: blueGrey,
                controller: urlController,
                onChanged: newsC.url,
                validator: 'Url',
              ),
              sizeBox10,
              kTextFormField(
                hintText: 'Url To Image',
                color: blueGrey,
                controller: urlToImageController,
                onChanged: newsC.urlToImage,
                validator: 'Url To Image',
              ),
              sizeBox10,
              kTextFormField(
                hintText: 'Content',
                color: blueGrey,
                controller: contentController,
                onChanged: newsC.content,
                validator: 'Content',
              ),
              sizeBox10,
              kTextFormField(
                hintText: 'Description',
                color: blueGrey,
                controller: descriptionController,
                onChanged: newsC.description,
                validator: 'Description',
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
      // resizeToAvoidBottomInset: false,
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: InkWell(
          onTap: () {
            newsC.editNews();
          },
          child: Container(
            height: 50,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: blueGrey,
            ),
            child: Center(
              child: KText(
                text: 'Update News',
                fontFamily: medium,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget kTextFormField({
    required final String hintText,
    // required final String errorText,
    required final Color color,
    required final TextEditingController controller,
    required final void Function(String)? onChanged,
    required final String validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KText(
          text: validator,
          color: black,
        ),
        TextFormField(
          style: TextStyle(
            fontSize: 12,
            fontFamily: regular,
          ),
          controller: controller,
          onChanged: onChanged,
          validator: (value) {
            if (value == null) {
              return 'Please enter $validator';
            }
            return '';
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: red),
            ),
            // errorText: errorText,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
