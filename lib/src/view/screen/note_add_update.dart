
import 'package:intl/intl.dart';
import 'package:todo_app/src/util/export.dart';

class NoteAddUpdate extends StatefulWidget {
  NoteAddUpdate({Key? key, this.index}) : super(key: key);

  int? index;

  @override
  _NoteAddUpdateState createState() => _NoteAddUpdateState();
}

class _NoteAddUpdateState extends State<NoteAddUpdate> {

  TextEditingController titleTextController = TextEditingController();
  TextEditingController desTextController = TextEditingController();
  final noteController = Get.put(NoteController());
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if(widget.index != null){
      titleTextController.text = noteController.noteList[widget.index!].title;
      desTextController.text = noteController.noteList[widget.index!].description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.index == null ? 'Add Note' : 'Update Note'
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildTitleTextField(),
                SizedBox(height: Dimensions.paddingSizeDefault,),
                buildDescriptionTextField(),
                SizedBox(height: Dimensions.paddingSizeExtraLarge,),
                buildButton(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitleTextField(){
    return TextFormField(
      validator: (val){
        if(val.toString().isEmpty){
          return 'Title required!';
        }
      },
      controller: titleTextController,
      maxLines: 1,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Title',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildDescriptionTextField(){
    return TextFormField(
      validator: (val){
        if(val.toString().isEmpty){
          return 'Description required!';
        }
      },
      controller: desTextController,
      maxLines: 7,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Description here...',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildButton(Size size){
    return InkWell(
      onTap: (){
        if(formKey.currentState!.validate()){
          addUpdateNote();
        }
      },
      borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      child: Container(
        height: size.height * 0.08,
        width: size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
          color: kMainColor,
        ),
        child: Text(
          widget.index == null? 'Add' : 'Update',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kWhite,
          ),
        ),
      ),
    );
  }

  addUpdateNote()async{
    customLoader();

    DateTime now = DateTime.now();
    String date = DateFormat.yMMMMd('en_us').format(now);
    String time = DateFormat.jm().format(now);
    if(widget.index == null){
      noteController.addNote(
          NoteData(
              title: titleTextController.text,
              description: desTextController.text,
              date: date,
              time: time
          )
      );
    }
    else{
      var updateNote = noteController.noteList[widget.index!];
      updateNote.title = titleTextController.text;
      updateNote.description = desTextController.text;
      updateNote.date = date;
      updateNote.time = time;
      noteController.noteList[widget.index!] = updateNote;
    }

    await Future.delayed(Duration(seconds: 2), () {
      closeLoader();
    },);

    //exit from this page
    Get.back();
  }
}
