import 'package:todo_app/src/util/export.dart';

class NoteDetails extends StatelessWidget {
  NoteDetails({Key? key, required this.noteData, required this.index}) : super(key: key);

  NoteData noteData;
  int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var noteController = Get.find<NoteController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Details'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){
              Get.off(() => NoteAddUpdate(index: index,));
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: ()async{
              await Get.defaultDialog(
                  title: 'Delete note',
                  middleText: noteData.title,
                  onCancel: (){
                    Get.back();
                  },
                  confirmTextColor: Colors.white,
                  onConfirm: (){
                    noteController.noteList.removeAt(index);
                    Get.back();
                  }
              );

              Get.back();
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                height: size.height * 0.6,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  color: kMainColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        noteData.title,
                        style: TextStyle(color: kWhite, fontSize: 22, fontWeight: FontWeight.bold,),
                      ),
                    ),
                    SizedBox(height: Dimensions.paddingSizeLarge,),
                    Text(
                      noteData.description,
                      style: TextStyle(color: kWhite),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            noteData.time,
                            style: TextStyle(color: kWhite, fontSize: 12),
                          ),
                          Text(
                            noteData.date,
                            style: TextStyle(color: kWhite, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


//SizedBox(width: Dimensions.paddingSizeDefault,),
// Expanded(
//   flex: 1,
//   child: IconButton(
//       onPressed: (){
//         Get.to(() => NoteAddUpdate(index: index,));
//       },
//       icon: Icon(Icons.edit),
//   ),
// ),
// SizedBox(width: Dimensions.paddingSizeDefault,),
// Expanded(
//   flex: 1,
//   child: IconButton(
//       onPressed: (){
//         Get.defaultDialog(
//           title: 'Delete note',
//           middleText: noteData.title,
//           onCancel: (){
//             Get.back();
//           },
//           confirmTextColor: Colors.white,
//           onConfirm: (){
//             controller.noteList.removeAt(index);
//             Get.back();
//           }
//         );
//       },
//       icon: Icon(Icons.delete, color: Colors.red,),
//   ),
// ),