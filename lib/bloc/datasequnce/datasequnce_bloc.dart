import 'dart:async';
import 'dart:convert';

//----------------------------------------------------------------
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pick_edit_datatable/tabletap/tabletap1/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap10/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap11/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap12/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap3/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap4/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap5/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap6/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap7/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap8/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap9/modelintable.dart';
import 'datasequnce_event.dart';
import 'datatest.dart';
//----------------------------------------------------------------

//------------------------------------------------------- First

class FetchDataTable1Bloc
    extends Bloc<DataSequncePage1, List<MainStrucTableTap1>> {
  FetchDataTable1Bloc() : super([]);

  @override
  Stream<List<MainStrucTableTap1>> mapEventToState(
      DataSequncePage1 event) async* {
    if (event == DataSequncePage1.select) {
      yield* selectData_fn(state);
    } else if (event == DataSequncePage1.update) {
      yield* updateData_fn(state);
    } else if (event == DataSequncePage1.delete) {
      yield* deleteData_fn(state);
    } else if (event == DataSequncePage1.insert) {
      yield* InsertData_fn(state);
    }
  }
}

Stream<List<MainStrucTableTap1>> selectData_fn(
    List<MainStrucTableTap1> state) async* {
  print("SELECT FUNCTION BLOC");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Select"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = rListDataTableTap1;
  yield state;
}

Stream<List<MainStrucTableTap1>> updateData_fn(
    List<MainStrucTableTap1> state) async* {
  print("UPDATE FUNCTION BLOC");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Update"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap1>> deleteData_fn(
    List<MainStrucTableTap1> state) async* {
  print("DELETE FUNCTION BLOC");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Delete"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap1>> InsertData_fn(
    List<MainStrucTableTap1> state) async* {
  print("INSERT FUNCTION BLOC");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Insert"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

//------------------------------------------------------------------------------

class FetchDataTable2Bloc
    extends Bloc<DataSequncePage2, List<MainStrucTableTap2>> {
  FetchDataTable2Bloc() : super([]);

  @override
  Stream<List<MainStrucTableTap2>> mapEventToState(
      DataSequncePage2 event) async* {
    if (event == DataSequncePage2.select) {
      yield* selectData2_fn(state);
    } else if (event == DataSequncePage2.update) {
      yield* updateData2_fn(state);
    } else if (event == DataSequncePage2.delete) {
      yield* deleteData2_fn(state);
    } else if (event == DataSequncePage2.insert) {
      yield* InsertData2_fn(state);
    }
  }
}

Stream<List<MainStrucTableTap2>> selectData2_fn(
    List<MainStrucTableTap2> state) async* {
  print("SELECT FUNCTION BLOC 2");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Select"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = rListDataTableTap2;
  yield state;
}

Stream<List<MainStrucTableTap2>> updateData2_fn(
    List<MainStrucTableTap2> state) async* {
  print("UPDATE FUNCTION BLOC");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Update"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap2>> deleteData2_fn(
    List<MainStrucTableTap2> state) async* {
  print("DELETE FUNCTION BLOC 2");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Delete"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap2>> InsertData2_fn(
    List<MainStrucTableTap2> state) async* {
  print("INSERT FUNCTION BLOC 2");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Insert"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

//------------------------------------------------------------------------------ 3

class FetchDataTable3Bloc
    extends Bloc<DataSequncePage3, List<MainStrucTableTap3>> {
  FetchDataTable3Bloc() : super([]);

  @override
  Stream<List<MainStrucTableTap3>> mapEventToState(
      DataSequncePage3 event) async* {
    if (event == DataSequncePage3.select) {
      yield* selectData3_fn(state);
    } else if (event == DataSequncePage3.update) {
      yield* updateData3_fn(state);
    } else if (event == DataSequncePage3.delete) {
      yield* deleteData3_fn(state);
    } else if (event == DataSequncePage3.insert) {
      yield* InsertData3_fn(state);
    }
  }
}

Stream<List<MainStrucTableTap3>> selectData3_fn(
    List<MainStrucTableTap3> state) async* {
  print("SELECT FUNCTION BLOC 3");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Select"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = rListDataTableTap3;
  yield state;
}

Stream<List<MainStrucTableTap3>> updateData3_fn(
    List<MainStrucTableTap3> state) async* {
  print("UPDATE FUNCTION BLOC 3");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Update"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap3>> deleteData3_fn(
    List<MainStrucTableTap3> state) async* {
  print("DELETE FUNCTION BLOC 3");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Delete"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap3>> InsertData3_fn(
    List<MainStrucTableTap3> state) async* {
  print("INSERT FUNCTION BLOC 3");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Insert"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

//------------------------------------------------------------------------------ 4

class FetchDataTable4Bloc
    extends Bloc<DataSequncePage4, List<MainStrucTableTap4>> {
  FetchDataTable4Bloc() : super([]);

  @override
  Stream<List<MainStrucTableTap4>> mapEventToState(
      DataSequncePage4 event) async* {
    if (event == DataSequncePage4.select) {
      yield* selectData4_fn(state);
    } else if (event == DataSequncePage4.update) {
      yield* updateData4_fn(state);
    } else if (event == DataSequncePage4.delete) {
      yield* deleteData4_fn(state);
    } else if (event == DataSequncePage4.insert) {
      yield* InsertData4_fn(state);
    }
  }
}

Stream<List<MainStrucTableTap4>> selectData4_fn(
    List<MainStrucTableTap4> state) async* {
  print("SELECT FUNCTION BLOC 4");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Select"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = rListDataTableTap4;
  yield state;
}

Stream<List<MainStrucTableTap4>> updateData4_fn(
    List<MainStrucTableTap4> state) async* {
  print("UPDATE FUNCTION BLOC 4");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Update"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap4>> deleteData4_fn(
    List<MainStrucTableTap4> state) async* {
  print("DELETE FUNCTION BLOC 4");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Delete"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap4>> InsertData4_fn(
    List<MainStrucTableTap4> state) async* {
  print("INSERT FUNCTION BLOC 4");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Insert"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

//------------------------------------------------------------------------------ 5

class FetchDataTable5Bloc
    extends Bloc<DataSequncePage5, List<MainStrucTableTap5>> {
  FetchDataTable5Bloc() : super([]);

  @override
  Stream<List<MainStrucTableTap5>> mapEventToState(
      DataSequncePage5 event) async* {
    if (event == DataSequncePage5.select) {
      yield* selectData5_fn(state);
    } else if (event == DataSequncePage5.update) {
      yield* updateData5_fn(state);
    } else if (event == DataSequncePage5.delete) {
      yield* deleteData5_fn(state);
    } else if (event == DataSequncePage5.insert) {
      yield* InsertData5_fn(state);
    }
  }
}

Stream<List<MainStrucTableTap5>> selectData5_fn(
    List<MainStrucTableTap5> state) async* {
  print("SELECT FUNCTION BLOC 5");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Select"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = rListDataTableTap5;
  yield state;
}

Stream<List<MainStrucTableTap5>> updateData5_fn(
    List<MainStrucTableTap5> state) async* {
  print("UPDATE FUNCTION BLOC 5");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Update"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap5>> deleteData5_fn(
    List<MainStrucTableTap5> state) async* {
  print("DELETE FUNCTION BLOC 5");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Delete"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap5>> InsertData5_fn(
    List<MainStrucTableTap5> state) async* {
  print("INSERT FUNCTION BLOC 5");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Insert"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

//------------------------------------------------------------------------------ 6

class FetchDataTable6Bloc
    extends Bloc<DataSequncePage6, List<MainStrucTableTap6>> {
  FetchDataTable6Bloc() : super([]);

  @override
  Stream<List<MainStrucTableTap6>> mapEventToState(
      DataSequncePage6 event) async* {
    if (event == DataSequncePage6.select) {
      yield* selectData6_fn(state);
    } else if (event == DataSequncePage6.update) {
      yield* updateData6_fn(state);
    } else if (event == DataSequncePage6.delete) {
      yield* deleteData6_fn(state);
    } else if (event == DataSequncePage6.insert) {
      yield* InsertData6_fn(state);
    }
  }
}

Stream<List<MainStrucTableTap6>> selectData6_fn(
    List<MainStrucTableTap6> state) async* {
  print("SELECT FUNCTION BLOC 6");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Select"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = rListDataTableTap6;
  yield state;
}

Stream<List<MainStrucTableTap6>> updateData6_fn(
    List<MainStrucTableTap6> state) async* {
  print("UPDATE FUNCTION BLOC 6");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Update"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap6>> deleteData6_fn(
    List<MainStrucTableTap6> state) async* {
  print("DELETE FUNCTION BLOC 6");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Delete"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap6>> InsertData6_fn(
    List<MainStrucTableTap6> state) async* {
  print("INSERT FUNCTION BLOC 6");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Insert"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

//------------------------------------------------------------------------------ 7

class FetchDataTable7Bloc
    extends Bloc<DataSequncePage7, List<MainStrucTableTap7>> {
  FetchDataTable7Bloc() : super([]);

  @override
  Stream<List<MainStrucTableTap7>> mapEventToState(
      DataSequncePage7 event) async* {
    if (event == DataSequncePage7.select) {
      yield* selectData7_fn(state);
    } else if (event == DataSequncePage7.update) {
      yield* updateData7_fn(state);
    } else if (event == DataSequncePage7.delete) {
      yield* deleteData7_fn(state);
    } else if (event == DataSequncePage7.insert) {
      yield* InsertData7_fn(state);
    }
  }
}

Stream<List<MainStrucTableTap7>> selectData7_fn(
    List<MainStrucTableTap7> state) async* {
  print("SELECT FUNCTION BLOC 7");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Select"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = rListDataTableTap7;
  yield state;
}

Stream<List<MainStrucTableTap7>> updateData7_fn(
    List<MainStrucTableTap7> state) async* {
  print("UPDATE FUNCTION BLOC 7");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Update"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap7>> deleteData7_fn(
    List<MainStrucTableTap7> state) async* {
  print("DELETE FUNCTION BLOC 7");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Delete"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap7>> InsertData7_fn(
    List<MainStrucTableTap7> state) async* {
  print("INSERT FUNCTION BLOC 7");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Insert"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

//------------------------------------------------------------------------------ 8

class FetchDataTable8Bloc
    extends Bloc<DataSequncePage8, List<MainStrucTableTap8>> {
  FetchDataTable8Bloc() : super([]);

  @override
  Stream<List<MainStrucTableTap8>> mapEventToState(
      DataSequncePage8 event) async* {
    if (event == DataSequncePage8.select) {
      yield* selectData8_fn(state);
    } else if (event == DataSequncePage8.update) {
      yield* updateData8_fn(state);
    } else if (event == DataSequncePage8.delete) {
      yield* deleteData8_fn(state);
    } else if (event == DataSequncePage8.insert) {
      yield* InsertData8_fn(state);
    }
  }
}

Stream<List<MainStrucTableTap8>> selectData8_fn(
    List<MainStrucTableTap8> state) async* {
  print("SELECT FUNCTION BLOC 8");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Select"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = rListDataTableTap8;
  yield state;
}

Stream<List<MainStrucTableTap8>> updateData8_fn(
    List<MainStrucTableTap8> state) async* {
  print("UPDATE FUNCTION BLOC 8");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Update"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap8>> deleteData8_fn(
    List<MainStrucTableTap8> state) async* {
  print("DELETE FUNCTION BLOC 8");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Delete"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap8>> InsertData8_fn(
    List<MainStrucTableTap8> state) async* {
  print("INSERT FUNCTION BLOC 8");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Insert"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

//------------------------------------------------------------------------------ 9

class FetchDataTable9Bloc
    extends Bloc<DataSequncePage9, List<MainStrucTableTap9>> {
  FetchDataTable9Bloc() : super([]);

  @override
  Stream<List<MainStrucTableTap9>> mapEventToState(
      DataSequncePage9 event) async* {
    if (event == DataSequncePage9.select) {
      yield* selectData9_fn(state);
    } else if (event == DataSequncePage9.update) {
      yield* updateData9_fn(state);
    } else if (event == DataSequncePage9.delete) {
      yield* deleteData9_fn(state);
    } else if (event == DataSequncePage9.insert) {
      yield* InsertData9_fn(state);
    }
  }
}

Stream<List<MainStrucTableTap9>> selectData9_fn(
    List<MainStrucTableTap9> state) async* {
  print("SELECT FUNCTION BLOC 9");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Select"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = rListDataTableTap9;
  yield state;
}

Stream<List<MainStrucTableTap9>> updateData9_fn(
    List<MainStrucTableTap9> state) async* {
  print("UPDATE FUNCTION BLOC 9");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Update"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap9>> deleteData9_fn(
    List<MainStrucTableTap9> state) async* {
  print("DELETE FUNCTION BLOC 9");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Delete"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap9>> InsertData9_fn(
    List<MainStrucTableTap9> state) async* {
  print("INSERT FUNCTION BLOC 9");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Insert"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

//------------------------------------------------------------------------------ 10

class FetchDataTable10Bloc
    extends Bloc<DataSequncePage10, List<MainStrucTableTap10>> {
  FetchDataTable10Bloc() : super([]);

  @override
  Stream<List<MainStrucTableTap10>> mapEventToState(
      DataSequncePage10 event) async* {
    if (event == DataSequncePage10.select) {
      yield* selectData10_fn(state);
    } else if (event == DataSequncePage10.update) {
      yield* updateData10_fn(state);
    } else if (event == DataSequncePage10.delete) {
      yield* deleteData10_fn(state);
    } else if (event == DataSequncePage10.insert) {
      yield* InsertData10_fn(state);
    }
  }
}

Stream<List<MainStrucTableTap10>> selectData10_fn(
    List<MainStrucTableTap10> state) async* {
  print("SELECT FUNCTION BLOC 10");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Select"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = rListDataTableTap10;
  yield state;
}

Stream<List<MainStrucTableTap10>> updateData10_fn(
    List<MainStrucTableTap10> state) async* {
  print("UPDATE FUNCTION BLOC 10");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Update"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap10>> deleteData10_fn(
    List<MainStrucTableTap10> state) async* {
  print("DELETE FUNCTION BLOC 10");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Delete"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap10>> InsertData10_fn(
    List<MainStrucTableTap10> state) async* {
  print("INSERT FUNCTION BLOC 10");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Insert"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

//------------------------------------------------------------------------------ 11

class FetchDataTable11Bloc
    extends Bloc<DataSequncePage11, List<MainStrucTableTap11>> {
  FetchDataTable11Bloc() : super([]);

  @override
  Stream<List<MainStrucTableTap11>> mapEventToState(
      DataSequncePage11 event) async* {
    if (event == DataSequncePage11.select) {
      yield* selectData11_fn(state);
    } else if (event == DataSequncePage11.update) {
      yield* updateData11_fn(state);
    } else if (event == DataSequncePage11.delete) {
      yield* deleteData11_fn(state);
    } else if (event == DataSequncePage11.insert) {
      yield* InsertData11_fn(state);
    }
  }
}

Stream<List<MainStrucTableTap11>> selectData11_fn(
    List<MainStrucTableTap11> state) async* {
  print("SELECT FUNCTION BLOC 11");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Select"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = rListDataTableTap11;
  yield state;
}

Stream<List<MainStrucTableTap11>> updateData11_fn(
    List<MainStrucTableTap11> state) async* {
  print("UPDATE FUNCTION BLOC 11");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Update"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap11>> deleteData11_fn(
    List<MainStrucTableTap11> state) async* {
  print("DELETE FUNCTION BLOC 11");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Delete"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap11>> InsertData11_fn(
    List<MainStrucTableTap11> state) async* {
  print("INSERT FUNCTION BLOC 11");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Insert"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

//------------------------------------------------------------------------------ 12

class FetchDataTable12Bloc
    extends Bloc<DataSequncePage12, List<MainStrucTableTap12>> {
  FetchDataTable12Bloc() : super([]);

  @override
  Stream<List<MainStrucTableTap12>> mapEventToState(
      DataSequncePage12 event) async* {
    if (event == DataSequncePage12.select) {
      yield* selectData12_fn(state);
    } else if (event == DataSequncePage12.update) {
      yield* updateData12_fn(state);
    } else if (event == DataSequncePage12.delete) {
      yield* deleteData12_fn(state);
    } else if (event == DataSequncePage12.insert) {
      yield* InsertData12_fn(state);
    }
  }
}

Stream<List<MainStrucTableTap12>> selectData12_fn(
    List<MainStrucTableTap12> state) async* {
  print("SELECT FUNCTION BLOC 12");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Select"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = rListDataTableTap12;
  yield state;
}

Stream<List<MainStrucTableTap12>> updateData12_fn(
    List<MainStrucTableTap12> state) async* {
  print("UPDATE FUNCTION BLOC 12");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Update"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap12>> deleteData12_fn(
    List<MainStrucTableTap12> state) async* {
  print("DELETE FUNCTION BLOC 12");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Delete"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}

Stream<List<MainStrucTableTap12>> InsertData12_fn(
    List<MainStrucTableTap12> state) async* {
  print("INSERT FUNCTION BLOC 12");
  // final response = await http.post(
  //     Uri.parse("http://localhost:9000/table1Insert"),
  //     body: {"NewData": EditDataTable1});

  // // print(response);
  // var databuff = [];
  // if (response.statusCode == 200) {
  //   databuff = jsonDecode(response.body);
  // } else {
  //   print("where is my server");
  // }
  // state = databuff;
  state = [];
  yield state;
}
