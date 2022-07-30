
import 'package:todo_app/src/util/export.dart';

class NoteController extends GetxController{
  var noteList = <NoteData>[].obs;

  @override
  void onInit(){
    List? storedNotes = GetStorage().read<List>('notes');
    if(!storedNotes.isNull){
      noteList = storedNotes!.map((e) => NoteData.fromJson(e)).toList().obs;
    }

    ever(noteList, (_){
      GetStorage().write('notes', noteList.toList());
    });
    super.onInit();
  }

  addNote(NoteData noteData){
    noteList.add(noteData);
  }
}