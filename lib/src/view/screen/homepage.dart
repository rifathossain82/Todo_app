

import 'dart:math';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:todo_app/src/util/export.dart';
import 'package:todo_app/src/view/screen/note_details.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var noteController = Get.find<NoteController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: const Text(AppConstants.appName),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Obx(
            () => noteController.noteList.isEmpty ?
            Center(child: Lottie.asset(Images.emptyNoteLottie),)
                :
            RefreshIndicator(
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 8,
                children: [
                  ...List.generate(noteController.noteList.length, (index) => ShowNote(controller: noteController, noteData: noteController.noteList[index], index: index))
                ],
              ),
              onRefresh: ()async{
                noteController = Get.find<NoteController>();
              },
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(() => NoteAddUpdate());
        },
        backgroundColor: kMainColor,
        child: Icon(Icons.note_add_rounded),
      ),
    );
  }
}

class ShowNote extends StatelessWidget {
  ShowNote({Key? key, required this.controller, required this.noteData, required this.index}) : super(key: key);

  NoteController controller;
  NoteData noteData;
  int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() => NoteDetails(index: index, noteData: noteData,));
      },
      child: Column(
        children: [
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kMainColor,
                boxShadow: [
                  // BoxShadow(
                  //   color: kWhite.withOpacity(0.02),
                  //   blurRadius: 5,
                  //   spreadRadius: 1,
                  //   offset: Offset(0.0, 0.3),
                  // ),
                  // BoxShadow(
                  //   color: kWhite.withOpacity(0.02),
                  //   blurRadius: 5,
                  //   spreadRadius: 1,
                  //   offset: Offset(0.0, 0.3),
                  // )
                ]
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeExtraLarge),
                child: Text(
                  noteData.description,
                  style: TextStyle(fontSize: 12, color: kWhite),
                ),
              ),
            ),
          ),
          //Text(noteData.title),
          SizedBox(height: Dimensions.paddingSizeExtraSmall,),
          Text(noteData.date, style: TextStyle(fontSize: 10,),),
        ],
      ),
    );
  }
}

