import 'dart:async';
import 'dart:convert';

//----------------------------------------------------------------
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pick_edit_datatable/tabletap/tabletap1/datatap1/datatap1.dart';
import 'package:pick_edit_datatable/tabletap/tabletap1/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap10/datatap10/datatap10.dart';
import 'package:pick_edit_datatable/tabletap/tabletap10/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap11/datatap11/datatap11.dart';
import 'package:pick_edit_datatable/tabletap/tabletap11/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap12/datatap12/datatap12.dart';
import 'package:pick_edit_datatable/tabletap/tabletap12/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/datatap2/datatap2.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap3/datatap3/datatap3.dart';
import 'package:pick_edit_datatable/tabletap/tabletap3/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap4/datatap4/datatap4.dart';
import 'package:pick_edit_datatable/tabletap/tabletap4/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap5/datatap5/datatap5.dart';
import 'package:pick_edit_datatable/tabletap/tabletap5/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap6/datatap6/datatap6.dart';
import 'package:pick_edit_datatable/tabletap/tabletap6/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap7/datatap7/datatap7.dart';
import 'package:pick_edit_datatable/tabletap/tabletap7/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap8/datatap8/datatap8.dart';
import 'package:pick_edit_datatable/tabletap/tabletap8/modelintable.dart';
import 'package:pick_edit_datatable/tabletap/tabletap9/datatap9/datatap9.dart';
import 'package:pick_edit_datatable/tabletap/tabletap9/modelintable.dart';
import 'datasequnce_event.dart';
import 'datatest.dart';
//----------------------------------------------------------------

String server = "http://172.20.30.46:9200/";
// String server = "http://127.0.0.1:9200/";

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
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "user_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap1> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap1(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['Username'].toString(),
      field02: data_input[i]['Password'].toString(),
      field03: data_input[i]['Name'].toString(),
      field04: data_input[i]['Section'].toString(),
      field05: data_input[i]['RoleId'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap1>> updateData_fn(
    List<MainStrucTableTap1> state) async* {
  print("UPDATE FUNCTION BLOC");

  var input_init = {
    "Id": EditDataTable1buffer.number,
    "Username": EditDataTable1buffer.field01,
    "Password": EditDataTable1buffer.field02,
    "Name": EditDataTable1buffer.field03,
    "Section": EditDataTable1buffer.field04,
    "RoleId": EditDataTable1buffer.field05
  };

  final response_init =
      await http.post(Uri.parse(server + "user_update"), body: input_init);
  //-------------------------------------------------------------------------
  print("SELECT FUNCTION BLOC");
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "user_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap1> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap1(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['Username'].toString(),
      field02: data_input[i]['Password'].toString(),
      field03: data_input[i]['Name'].toString(),
      field04: data_input[i]['Section'].toString(),
      field05: data_input[i]['RoleId'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap1>> deleteData_fn(
    List<MainStrucTableTap1> state) async* {
  print("DELETE FUNCTION BLOC");
  var input_init = {
    "Id": DeleteDataTable1buffer.number,
    "Username": DeleteDataTable1buffer.field01,
    "Password": DeleteDataTable1buffer.field02,
    "Name": DeleteDataTable1buffer.field03,
    "Section": DeleteDataTable1buffer.field04,
    "RoleId": DeleteDataTable1buffer.field05
  };

  final response_init =
      await http.post(Uri.parse(server + "user_delete"), body: input_init);
  //-------------------------------------------------------------------------
  String input = "hi data";
  print("SELECT FUNCTION BLOC");
  final response =
      await http.post(Uri.parse(server + "user_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap1> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap1(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['Username'].toString(),
      field02: data_input[i]['Password'].toString(),
      field03: data_input[i]['Name'].toString(),
      field04: data_input[i]['Section'].toString(),
      field05: data_input[i]['RoleId'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap1>> InsertData_fn(
    List<MainStrucTableTap1> state) async* {
  print("INSERT FUNCTION BLOC");
  var input_init = {
    "Id": "insert",
    "Username": EditDataTable1buffer.field01,
    "Password": EditDataTable1buffer.field02,
    "Name": EditDataTable1buffer.field03,
    "Section": EditDataTable1buffer.field04,
    "RoleId": EditDataTable1buffer.field05
  };

  final response_init =
      await http.post(Uri.parse(server + "user_insert"), body: input_init);
  //-------------------------------------------------------------------------
  String input = "hi data";
  print("SELECT FUNCTION BLOC");
  final response =
      await http.post(Uri.parse(server + "user_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap1> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap1(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['Username'].toString(),
      field02: data_input[i]['Password'].toString(),
      field03: data_input[i]['Name'].toString(),
      field04: data_input[i]['Section'].toString(),
      field05: data_input[i]['RoleId'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;

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
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Customer_Data_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['CODE'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap2>> updateData2_fn(
    List<MainStrucTableTap2> state) async* {
  print("UPDATE FUNCTION BLOC 2");

  var input_init = {
    "Id": EditDataTable2buffer.number,
    "CustId": EditDataTable2buffer.field01,
    "CustFull": EditDataTable2buffer.field02,
    "CustShort": EditDataTable2buffer.field03,
    "Branch": EditDataTable2buffer.field04,
    "CODE": EditDataTable2buffer.field05
  };

  final response_init = await http
      .post(Uri.parse(server + "Custommer_data_update"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Customer_Data_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['CODE'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap2>> deleteData2_fn(
    List<MainStrucTableTap2> state) async* {
  print("DELETE FUNCTION BLOC 2");
  var input_init = {
    "Id": DeleteDataTable2buffer.number,
    "CustId": DeleteDataTable2buffer.field01,
    "CustFull": DeleteDataTable2buffer.field02,
    "CustShort": DeleteDataTable2buffer.field03,
    "Branch": DeleteDataTable2buffer.field04,
    "CODE": DeleteDataTable2buffer.field05
  };

  final response_init = await http
      .post(Uri.parse(server + "Custommer_data_delete"), body: input_init);
  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Customer_Data_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['CODE'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap2>> InsertData2_fn(
    List<MainStrucTableTap2> state) async* {
  print("INSERT FUNCTION BLOC 2");
  var input_init = {
    "Id": "insert",
    "CustId": EditDataTable2buffer.field01,
    "CustFull": EditDataTable2buffer.field02,
    "CustShort": EditDataTable2buffer.field03,
    "Branch": EditDataTable2buffer.field04,
    "CODE": EditDataTable2buffer.field05
  };

  final response_init = await http
      .post(Uri.parse(server + "Customer_Data_insert"), body: input_init);
  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Customer_Data_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['CODE'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;
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
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Frequency_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap3> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap3(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['FrequencyId'].toString(),
      field02: data_input[i]['Frequency'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap3>> updateData3_fn(
    List<MainStrucTableTap3> state) async* {
  print("UPDATE FUNCTION BLOC 3");
  var input_init = {
    "Id": EditDataTable3buffer.number,
    "FrequencyId": EditDataTable3buffer.field01,
    "Frequency": EditDataTable3buffer.field02,
  };

  final response_init =
      await http.post(Uri.parse(server + "Frequency_update"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Frequency_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap3> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap3(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['FrequencyId'].toString(),
      field02: data_input[i]['Frequency'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap3>> deleteData3_fn(
    List<MainStrucTableTap3> state) async* {
  print("DELETE FUNCTION BLOC 3");
  var input_init = {
    "Id": DeleteDataTable3buffer.number,
    "FrequencyId": DeleteDataTable3buffer.field01,
    "Frequency": DeleteDataTable3buffer.field02,
  };

  final response_init =
      await http.post(Uri.parse(server + "Frequency_delete"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Frequency_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap3> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap3(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['FrequencyId'].toString(),
      field02: data_input[i]['Frequency'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap3>> InsertData3_fn(
    List<MainStrucTableTap3> state) async* {
  print("INSERT FUNCTION BLOC 3");
  var input_init = {
    "Id": "insert",
    "FrequencyId": EditDataTable3buffer.field01,
    "Frequency": EditDataTable3buffer.field02,
  };

  final response_init =
      await http.post(Uri.parse(server + "Frequency_insert"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Frequency_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap3> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap3(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['FrequencyId'].toString(),
      field02: data_input[i]['Frequency'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
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
  String input = "hi data";
  final response = await http.post(Uri.parse(server + "Routine_Customer_query"),
      body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap4> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap4(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['Code'].toString(),
      field06: data_input[i]['FrequencyRequest'].toString(),
      field07: data_input[i]['Incharge'].toString(),
      field08: data_input[i]['SubLeader'].toString(),
      field09: data_input[i]['GL'].toString(),
      field10: data_input[i]['JP'].toString(),
      field11: data_input[i]['DMG'].toString(),
      field12: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap4>> updateData4_fn(
    List<MainStrucTableTap4> state) async* {
  print("UPDATE FUNCTION BLOC 4");
  var input_init = {
    "Id": EditDataTable4buffer.number,
    "CustId": EditDataTable4buffer.field01,
    "CustFull": EditDataTable4buffer.field02,
    "CustShort": EditDataTable4buffer.field03,
    "Branch": EditDataTable4buffer.field04,
    "Code": EditDataTable4buffer.field05,
    "FrequencyRequest": EditDataTable4buffer.field06,
    "Incharge": EditDataTable4buffer.field07,
    "SubLeader": EditDataTable4buffer.field08,
    "GL": EditDataTable4buffer.field09,
    "JP": EditDataTable4buffer.field10,
    "DMG": EditDataTable4buffer.field11,
  };

  final response_init = await http
      .post(Uri.parse(server + "Routine_Customer_update"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response = await http.post(Uri.parse(server + "Routine_Customer_query"),
      body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap4> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap4(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['Code'].toString(),
      field06: data_input[i]['FrequencyRequest'].toString(),
      field07: data_input[i]['Incharge'].toString(),
      field08: data_input[i]['SubLeader'].toString(),
      field09: data_input[i]['GL'].toString(),
      field10: data_input[i]['JP'].toString(),
      field11: data_input[i]['DMG'].toString(),
      field12: "",
    ));
  }
  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap4>> deleteData4_fn(
    List<MainStrucTableTap4> state) async* {
  print("DELETE FUNCTION BLOC 4");
  var input_init = {
    "Id": DeleteDataTable4buffer.number,
    "CustId": DeleteDataTable4buffer.field01,
    "CustFull": DeleteDataTable4buffer.field02,
    "CustShort": DeleteDataTable4buffer.field03,
    "Branch": DeleteDataTable4buffer.field04,
    "Code": DeleteDataTable4buffer.field05,
    "FrequencyRequest": DeleteDataTable4buffer.field06,
    "Incharge": DeleteDataTable4buffer.field07,
    "SubLeader": DeleteDataTable4buffer.field08,
    "GL": DeleteDataTable4buffer.field09,
    "JP": DeleteDataTable4buffer.field10,
    "DMG": DeleteDataTable4buffer.field11,
  };

  final response_init = await http
      .post(Uri.parse(server + "Routine_Customer_delete"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response = await http.post(Uri.parse(server + "Routine_Customer_query"),
      body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap4> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap4(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['Code'].toString(),
      field06: data_input[i]['FrequencyRequest'].toString(),
      field07: data_input[i]['Incharge'].toString(),
      field08: data_input[i]['SubLeader'].toString(),
      field09: data_input[i]['GL'].toString(),
      field10: data_input[i]['JP'].toString(),
      field11: data_input[i]['DMG'].toString(),
      field12: "",
    ));
  }
  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap4>> InsertData4_fn(
    List<MainStrucTableTap4> state) async* {
  print("INSERT FUNCTION BLOC 4");

  var input_init = {
    "Id": "insert",
    "CustId": EditDataTable4buffer.field01,
    "CustFull": EditDataTable4buffer.field02,
    "CustShort": EditDataTable4buffer.field03,
    "Branch": EditDataTable4buffer.field04,
    "Code": EditDataTable4buffer.field05,
    "FrequencyRequest": EditDataTable4buffer.field06,
    "Incharge": EditDataTable4buffer.field07,
    "SubLeader": EditDataTable4buffer.field08,
    "GL": EditDataTable4buffer.field09,
    "JP": EditDataTable4buffer.field10,
    "DMG": EditDataTable4buffer.field11,
  };

  final response_init = await http
      .post(Uri.parse(server + "Routine_Customer_insert"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response = await http.post(Uri.parse(server + "Routine_Customer_query"),
      body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap4> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap4(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['CustId'].toString(),
      field02: data_input[i]['CustFull'].toString(),
      field03: data_input[i]['CustShort'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['Code'].toString(),
      field06: data_input[i]['FrequencyRequest'].toString(),
      field07: data_input[i]['Incharge'].toString(),
      field08: data_input[i]['SubLeader'].toString(),
      field09: data_input[i]['GL'].toString(),
      field10: data_input[i]['JP'].toString(),
      field11: data_input[i]['DMG'].toString(),
      field12: "",
    ));
  }
  state = stateoutput;

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
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "GroupName_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap5> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap5(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap5>> updateData5_fn(
    List<MainStrucTableTap5> state) async* {
  print("UPDATE FUNCTION BLOC 5");
  var input_init = {
    "Id": EditDataTable5buffer.number,
    "GroupId": EditDataTable5buffer.field01,
    "GroupName": EditDataTable5buffer.field02,
  };

  final response_init =
      await http.post(Uri.parse(server + "GroupName_update"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "GroupName_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap5> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap5(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap5>> deleteData5_fn(
    List<MainStrucTableTap5> state) async* {
  print("DELETE FUNCTION BLOC 5");
  var input_init = {
    "Id": DeleteDataTable5buffer.number,
    "GroupId": DeleteDataTable5buffer.field01,
    "GroupName": DeleteDataTable5buffer.field02,
  };

  final response_init =
      await http.post(Uri.parse(server + "GroupName_delete"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "GroupName_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap5> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap5(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap5>> InsertData5_fn(
    List<MainStrucTableTap5> state) async* {
  print("INSERT FUNCTION BLOC 5");
  var input_init = {
    "Id": "insert",
    "GroupId": EditDataTable5buffer.field01,
    "GroupName": EditDataTable5buffer.field02,
  };

  final response_init =
      await http.post(Uri.parse(server + "GroupName_insert"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "GroupName_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap5> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap5(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;
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

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "SampleType_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap6> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap6(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['SampleTypeId'].toString(),
      field04: data_input[i]['SampleTypeName'].toString(),
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap6>> updateData6_fn(
    List<MainStrucTableTap6> state) async* {
  print("UPDATE FUNCTION BLOC 6");
  var input_init = {
    "Id": EditDataTable6buffer.number,
    "GroupId": EditDataTable6buffer.field01,
    "GroupName": EditDataTable6buffer.field02,
    "SampleTypeId": EditDataTable6buffer.field03,
    "SampleTypeName": EditDataTable6buffer.field04,
  };

  final response_init = await http.post(Uri.parse(server + "SampleType_update"),
      body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "SampleType_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap6> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap6(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['SampleTypeId'].toString(),
      field04: data_input[i]['SampleTypeName'].toString(),
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap6>> deleteData6_fn(
    List<MainStrucTableTap6> state) async* {
  print("DELETE FUNCTION BLOC 6");
  var input_init = {
    "Id": DeleteDataTable6buffer.number,
    "GroupId": DeleteDataTable6buffer.field01,
    "GroupName": DeleteDataTable6buffer.field02,
    "SampleTypeId": DeleteDataTable6buffer.field03,
    "SampleTypeName": DeleteDataTable6buffer.field04,
  };

  final response_init = await http.post(Uri.parse(server + "SampleType_delete"),
      body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "SampleType_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap6> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap6(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['SampleTypeId'].toString(),
      field04: data_input[i]['SampleTypeName'].toString(),
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap6>> InsertData6_fn(
    List<MainStrucTableTap6> state) async* {
  print("INSERT FUNCTION BLOC 6");
  var input_init = {
    "Id": "insert",
    "GroupId": EditDataTable6buffer.field01,
    "GroupName": EditDataTable6buffer.field02,
    "SampleTypeId": EditDataTable6buffer.field03,
    "SampleTypeName": EditDataTable6buffer.field04,
  };

  final response_init = await http.post(Uri.parse(server + "SampleType_insert"),
      body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "SampleType_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap6> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap6(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['SampleTypeId'].toString(),
      field04: data_input[i]['SampleTypeName'].toString(),
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
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
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "SampleName_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap7> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap7(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['SampleTypeId'].toString(),
      field04: data_input[i]['SampleTypeName'].toString(),
      field05: data_input[i]['SampleId'].toString(),
      field06: data_input[i]['SampleName'].toString(),
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap7>> updateData7_fn(
    List<MainStrucTableTap7> state) async* {
  print("UPDATE FUNCTION BLOC 7");
  var input_init = {
    "Id": EditDataTable7buffer.number,
    "GroupId": EditDataTable7buffer.field01,
    "GroupName": EditDataTable7buffer.field02,
    "SampleTypeId": EditDataTable7buffer.field03,
    "SampleTypeName": EditDataTable7buffer.field04,
    "SampleId": EditDataTable7buffer.field05,
    "SampleName": EditDataTable7buffer.field06,
  };

  final response_init = await http.post(Uri.parse(server + "SampleName_update"),
      body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "SampleName_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap7> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap7(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['SampleTypeId'].toString(),
      field04: data_input[i]['SampleTypeName'].toString(),
      field05: data_input[i]['SampleId'].toString(),
      field06: data_input[i]['SampleName'].toString(),
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap7>> deleteData7_fn(
    List<MainStrucTableTap7> state) async* {
  print("DELETE FUNCTION BLOC 7");
  var input_init = {
    "Id": DeleteDataTable7buffer.number,
    "GroupId": DeleteDataTable7buffer.field01,
    "GroupName": DeleteDataTable7buffer.field02,
    "SampleTypeId": DeleteDataTable7buffer.field03,
    "SampleTypeName": DeleteDataTable7buffer.field04,
    "SampleId": DeleteDataTable7buffer.field05,
    "SampleName": DeleteDataTable7buffer.field06,
  };

  final response_init = await http.post(Uri.parse(server + "SampleName_delete"),
      body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "SampleName_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap7> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap7(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['SampleTypeId'].toString(),
      field04: data_input[i]['SampleTypeName'].toString(),
      field05: data_input[i]['SampleId'].toString(),
      field06: data_input[i]['SampleName'].toString(),
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap7>> InsertData7_fn(
    List<MainStrucTableTap7> state) async* {
  print("INSERT FUNCTION BLOC 7");
  var input_init = {
    "Id": "insert",
    "GroupId": EditDataTable7buffer.field01,
    "GroupName": EditDataTable7buffer.field02,
    "SampleTypeId": EditDataTable7buffer.field03,
    "SampleTypeName": EditDataTable7buffer.field04,
    "SampleId": EditDataTable7buffer.field05,
    "SampleName": EditDataTable7buffer.field06,
  };

  final response_init = await http.post(Uri.parse(server + "SampleName_insert"),
      body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "SampleName_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap7> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap7(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['SampleTypeId'].toString(),
      field04: data_input[i]['SampleTypeName'].toString(),
      field05: data_input[i]['SampleId'].toString(),
      field06: data_input[i]['SampleName'].toString(),
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
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
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Tank_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap8> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap8(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['TankId'].toString(),
      field02: data_input[i]['TankName'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap8>> updateData8_fn(
    List<MainStrucTableTap8> state) async* {
  print("UPDATE FUNCTION BLOC 8");
  var input_init = {
    "Id": EditDataTable8buffer.number,
    "TankId": EditDataTable8buffer.field01,
    "TankName": EditDataTable8buffer.field02,
  };

  final response_init =
      await http.post(Uri.parse(server + "Tank_update"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Tank_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap8> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap8(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['TankId'].toString(),
      field02: data_input[i]['TankName'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap8>> deleteData8_fn(
    List<MainStrucTableTap8> state) async* {
  print("DELETE FUNCTION BLOC 8");
  var input_init = {
    "Id": DeleteDataTable8buffer.number,
    "TankId": DeleteDataTable8buffer.field01,
    "TankName": DeleteDataTable8buffer.field02,
  };

  final response_init =
      await http.post(Uri.parse(server + "Tank_delete"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Tank_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap8> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap8(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['TankId'].toString(),
      field02: data_input[i]['TankName'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap8>> InsertData8_fn(
    List<MainStrucTableTap8> state) async* {
  print("INSERT FUNCTION BLOC 8");
  var input_init = {
    "Id": "insert",
    "TankId": EditDataTable8buffer.field01,
    "TankName": EditDataTable8buffer.field02,
  };

  final response_init =
      await http.post(Uri.parse(server + "Tank_insert"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Tank_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap8> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap8(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['TankId'].toString(),
      field02: data_input[i]['TankName'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
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
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Instrument_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap9> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap9(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['InstrumentId'].toString(),
      field02: data_input[i]['InstrumentName'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap9>> updateData9_fn(
    List<MainStrucTableTap9> state) async* {
  print("UPDATE FUNCTION BLOC 9");
  var input_init = {
    "Id": EditDataTable9buffer.number,
    "InstrumentId": EditDataTable9buffer.field01,
    "InstrumentName": EditDataTable9buffer.field02,
  };

  final response_init = await http.post(Uri.parse(server + "Instrument_update"),
      body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Instrument_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap9> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap9(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['InstrumentId'].toString(),
      field02: data_input[i]['InstrumentName'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap9>> deleteData9_fn(
    List<MainStrucTableTap9> state) async* {
  print("DELETE FUNCTION BLOC 9");
  var input_init = {
    "Id": DeleteDataTable9buffer.number,
    "InstrumentId": DeleteDataTable9buffer.field01,
    "InstrumentName": DeleteDataTable9buffer.field02,
  };

  final response_init = await http.post(Uri.parse(server + "Instrument_delete"),
      body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Instrument_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap9> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap9(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['InstrumentId'].toString(),
      field02: data_input[i]['InstrumentName'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap9>> InsertData9_fn(
    List<MainStrucTableTap9> state) async* {
  print("INSERT FUNCTION BLOC 9");
  var input_init = {
    "Id": "insert",
    "InstrumentId": EditDataTable9buffer.field01,
    "InstrumentName": EditDataTable9buffer.field02,
  };

  final response_init = await http.post(Uri.parse(server + "Instrument_insert"),
      body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Instrument_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap9> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap9(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['InstrumentId'].toString(),
      field02: data_input[i]['InstrumentName'].toString(),
      field03: "",
      field04: "",
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
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
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Unit_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap10> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap10(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['UnitId'].toString(),
      field04: data_input[i]['UnitName'].toString(),
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap10>> updateData10_fn(
    List<MainStrucTableTap10> state) async* {
  print("UPDATE FUNCTION BLOC 10");
  var input_init = {
    "Id": EditDataTable10buffer.number,
    "GroupId": EditDataTable10buffer.field01,
    "GroupName": EditDataTable10buffer.field02,
    "UnitId": EditDataTable10buffer.field03,
    "UnitName": EditDataTable10buffer.field04,
  };

  final response_init =
      await http.post(Uri.parse(server + "Unit_update"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Unit_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap10> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap10(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['UnitId'].toString(),
      field04: data_input[i]['UnitName'].toString(),
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap10>> deleteData10_fn(
    List<MainStrucTableTap10> state) async* {
  print("DELETE FUNCTION BLOC 10");
  var input_init = {
    "Id": DeleteDataTable10buffer.number,
    "GroupId": DeleteDataTable10buffer.field01,
    "GroupName": DeleteDataTable10buffer.field02,
    "UnitId": DeleteDataTable10buffer.field03,
    "UnitName": DeleteDataTable10buffer.field04,
  };

  final response_init =
      await http.post(Uri.parse(server + "Unit_delete"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Unit_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap10> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap10(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['UnitId'].toString(),
      field04: data_input[i]['UnitName'].toString(),
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap10>> InsertData10_fn(
    List<MainStrucTableTap10> state) async* {
  print("INSERT FUNCTION BLOC 10");
  var input_init = {
    "Id": "insert",
    "GroupId": EditDataTable10buffer.field01,
    "GroupName": EditDataTable10buffer.field02,
    "UnitId": EditDataTable10buffer.field03,
    "UnitName": EditDataTable10buffer.field04,
  };

  final response_init =
      await http.post(Uri.parse(server + "Unit_insert"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "Unit_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap10> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap10(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['UnitId'].toString(),
      field04: data_input[i]['UnitName'].toString(),
      field05: "",
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
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
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "item_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap11> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap11(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['InstrumentId'].toString(),
      field02: data_input[i]['InstrumentName'].toString(),
      field03: data_input[i]['ItemId'].toString(),
      field04: data_input[i]['ItemName'].toString(),
      field05: data_input[i]['Cost'].toString(),
      field06: data_input[i]['Price'].toString(),
      field07: data_input[i]['Unit1'].toString(),
      field08: data_input[i]['Unit2'].toString(),
      field09: data_input[i]['Unit3'].toString(),
      field10: data_input[i]['Unit4'].toString(),
      field11: data_input[i]['Unit5'].toString(),
      field12: data_input[i]['Unit6'].toString(),
      field13: data_input[i]['Unit7'].toString(),
      field14: data_input[i]['Unit8'].toString(),
      field15: data_input[i]['Unit9'].toString(),
      field16: data_input[i]['Unit10'].toString(),
      field17: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap11>> updateData11_fn(
    List<MainStrucTableTap11> state) async* {
  print("UPDATE FUNCTION BLOC 11");
  var input_init = {
    "Id": EditDataTable11buffer.number,
    "InstrumentId": EditDataTable11buffer.field01,
    "InstrumentName": EditDataTable11buffer.field02,
    "ItemId": EditDataTable11buffer.field03,
    "ItemName": EditDataTable11buffer.field04,
    "Cost": EditDataTable11buffer.field05,
    "Price": EditDataTable11buffer.field06,
    "Unit1": EditDataTable11buffer.field07,
    "Unit2": EditDataTable11buffer.field08,
    "Unit3": EditDataTable11buffer.field09,
    "Unit4": EditDataTable11buffer.field10,
    "Unit5": EditDataTable11buffer.field11,
    "Unit6": EditDataTable11buffer.field12,
    "Unit7": EditDataTable11buffer.field13,
    "Unit8": EditDataTable11buffer.field14,
    "Unit9": EditDataTable11buffer.field15,
    "Unit10": EditDataTable11buffer.field16,
  };

  final response_init =
      await http.post(Uri.parse(server + "item_update"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "item_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap11> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap11(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['InstrumentId'].toString(),
      field02: data_input[i]['InstrumentName'].toString(),
      field03: data_input[i]['ItemId'].toString(),
      field04: data_input[i]['ItemName'].toString(),
      field05: data_input[i]['Cost'].toString(),
      field06: data_input[i]['Price'].toString(),
      field07: data_input[i]['Unit1'].toString(),
      field08: data_input[i]['Unit2'].toString(),
      field09: data_input[i]['Unit3'].toString(),
      field10: data_input[i]['Unit4'].toString(),
      field11: data_input[i]['Unit5'].toString(),
      field12: data_input[i]['Unit6'].toString(),
      field13: data_input[i]['Unit7'].toString(),
      field14: data_input[i]['Unit8'].toString(),
      field15: data_input[i]['Unit9'].toString(),
      field16: data_input[i]['Unit10'].toString(),
      field17: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap11>> deleteData11_fn(
    List<MainStrucTableTap11> state) async* {
  print("DELETE FUNCTION BLOC 11");
  var input_init = {
    "Id": DeleteDataTable11buffer.number,
    "InstrumentId": DeleteDataTable11buffer.field01,
    "InstrumentName": DeleteDataTable11buffer.field02,
    "ItemId": DeleteDataTable11buffer.field03,
    "ItemName": DeleteDataTable11buffer.field04,
    "Cost": DeleteDataTable11buffer.field05,
    "Price": DeleteDataTable11buffer.field06,
    "Unit1": DeleteDataTable11buffer.field07,
    "Unit2": DeleteDataTable11buffer.field08,
    "Unit3": DeleteDataTable11buffer.field09,
    "Unit4": DeleteDataTable11buffer.field10,
    "Unit5": DeleteDataTable11buffer.field11,
    "Unit6": DeleteDataTable11buffer.field12,
    "Unit7": DeleteDataTable11buffer.field13,
    "Unit8": DeleteDataTable11buffer.field14,
    "Unit9": DeleteDataTable11buffer.field15,
    "Unit10": DeleteDataTable11buffer.field16,
  };

  final response_init =
      await http.post(Uri.parse(server + "item_delete"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "item_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap11> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap11(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['InstrumentId'].toString(),
      field02: data_input[i]['InstrumentName'].toString(),
      field03: data_input[i]['ItemId'].toString(),
      field04: data_input[i]['ItemName'].toString(),
      field05: data_input[i]['Cost'].toString(),
      field06: data_input[i]['Price'].toString(),
      field07: data_input[i]['Unit1'].toString(),
      field08: data_input[i]['Unit2'].toString(),
      field09: data_input[i]['Unit3'].toString(),
      field10: data_input[i]['Unit4'].toString(),
      field11: data_input[i]['Unit5'].toString(),
      field12: data_input[i]['Unit6'].toString(),
      field13: data_input[i]['Unit7'].toString(),
      field14: data_input[i]['Unit8'].toString(),
      field15: data_input[i]['Unit9'].toString(),
      field16: data_input[i]['Unit10'].toString(),
      field17: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap11>> InsertData11_fn(
    List<MainStrucTableTap11> state) async* {
  print("INSERT FUNCTION BLOC 11");
  var input_init = {
    "Id": EditDataTable11buffer.number,
    "InstrumentId": EditDataTable11buffer.field01,
    "InstrumentName": EditDataTable11buffer.field02,
    "ItemId": EditDataTable11buffer.field03,
    "ItemName": EditDataTable11buffer.field04,
    "Cost": EditDataTable11buffer.field05,
    "Price": EditDataTable11buffer.field06,
    "Unit1": EditDataTable11buffer.field07,
    "Unit2": EditDataTable11buffer.field08,
    "Unit3": EditDataTable11buffer.field09,
    "Unit4": EditDataTable11buffer.field10,
    "Unit5": EditDataTable11buffer.field11,
    "Unit6": EditDataTable11buffer.field12,
    "Unit7": EditDataTable11buffer.field13,
    "Unit8": EditDataTable11buffer.field14,
    "Unit9": EditDataTable11buffer.field15,
    "Unit10": EditDataTable11buffer.field16,
  };

  final response_init =
      await http.post(Uri.parse(server + "item_insert"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "item_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap11> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap11(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['InstrumentId'].toString(),
      field02: data_input[i]['InstrumentName'].toString(),
      field03: data_input[i]['ItemId'].toString(),
      field04: data_input[i]['ItemName'].toString(),
      field05: data_input[i]['Cost'].toString(),
      field06: data_input[i]['Price'].toString(),
      field07: data_input[i]['Unit1'].toString(),
      field08: data_input[i]['Unit2'].toString(),
      field09: data_input[i]['Unit3'].toString(),
      field10: data_input[i]['Unit4'].toString(),
      field11: data_input[i]['Unit5'].toString(),
      field12: data_input[i]['Unit6'].toString(),
      field13: data_input[i]['Unit7'].toString(),
      field14: data_input[i]['Unit8'].toString(),
      field15: data_input[i]['Unit9'].toString(),
      field16: data_input[i]['Unit10'].toString(),
      field17: "",
    ));
  }
  state = stateoutput;
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
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "ItemGroup_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap12> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap12(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['SampleTypeId'].toString(),
      field04: data_input[i]['SampleTypeName'].toString(),
      field05: data_input[i]['InstrumentId'].toString(),
      field06: data_input[i]['InsrumentName'].toString(),
      field07: data_input[i]['ItemId'].toString(),
      field08: data_input[i]['ItemName'].toString(),
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap12>> updateData12_fn(
    List<MainStrucTableTap12> state) async* {
  print("UPDATE FUNCTION BLOC 12");
  var input_init = {
    "Id": EditDataTable12buffer.number,
    "GroupId": EditDataTable12buffer.field01,
    "GroupName": EditDataTable12buffer.field02,
    "SampleTypeId": EditDataTable12buffer.field03,
    "SampleTypeName": EditDataTable12buffer.field04,
    "InstrumentId": EditDataTable12buffer.field05,
    "InsrumentName": EditDataTable12buffer.field06,
    "ItemId": EditDataTable12buffer.field07,
    "ItemName": EditDataTable12buffer.field08,
  };

  final response_init =
      await http.post(Uri.parse(server + "ItemGroup_update"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "ItemGroup_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap12> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap12(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['SampleTypeId'].toString(),
      field04: data_input[i]['SampleTypeName'].toString(),
      field05: data_input[i]['InstrumentId'].toString(),
      field06: data_input[i]['InsrumentName'].toString(),
      field07: data_input[i]['ItemId'].toString(),
      field08: data_input[i]['ItemName'].toString(),
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap12>> deleteData12_fn(
    List<MainStrucTableTap12> state) async* {
  print("DELETE FUNCTION BLOC 12");
  var input_init = {
    "Id": DeleteDataTable12buffer.number,
    "GroupId": DeleteDataTable12buffer.field01,
    "GroupName": DeleteDataTable12buffer.field02,
    "SampleTypeId": DeleteDataTable12buffer.field03,
    "SampleTypeName": DeleteDataTable12buffer.field04,
    "InstrumentId": DeleteDataTable12buffer.field05,
    "InsrumentName": DeleteDataTable12buffer.field06,
    "ItemId": DeleteDataTable12buffer.field07,
    "ItemName": DeleteDataTable12buffer.field08,
  };

  final response_init =
      await http.post(Uri.parse(server + "ItemGroup_delete"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "ItemGroup_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap12> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap12(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['SampleTypeId'].toString(),
      field04: data_input[i]['SampleTypeName'].toString(),
      field05: data_input[i]['InstrumentId'].toString(),
      field06: data_input[i]['InsrumentName'].toString(),
      field07: data_input[i]['ItemId'].toString(),
      field08: data_input[i]['ItemName'].toString(),
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap12>> InsertData12_fn(
    List<MainStrucTableTap12> state) async* {
  print("INSERT FUNCTION BLOC 12");
  var input_init = {
    "Id": "insert",
    "GroupId": EditDataTable12buffer.field01,
    "GroupName": EditDataTable12buffer.field02,
    "SampleTypeId": EditDataTable12buffer.field03,
    "SampleTypeName": EditDataTable12buffer.field04,
    "InstrumentId": EditDataTable12buffer.field05,
    "InsrumentName": EditDataTable12buffer.field06,
    "ItemId": EditDataTable12buffer.field07,
    "ItemName": EditDataTable12buffer.field08,
  };

  final response_init =
      await http.post(Uri.parse(server + "ItemGroup_insert"), body: input_init);

  //------------------------------------------------------------------------------
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "ItemGroup_query"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap12> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap12(
      number: data_input[i]['Id'].toString(),
      field01: data_input[i]['GroupId'].toString(),
      field02: data_input[i]['GroupName'].toString(),
      field03: data_input[i]['SampleTypeId'].toString(),
      field04: data_input[i]['SampleTypeName'].toString(),
      field05: data_input[i]['InstrumentId'].toString(),
      field06: data_input[i]['InsrumentName'].toString(),
      field07: data_input[i]['ItemId'].toString(),
      field08: data_input[i]['ItemName'].toString(),
      field09: "",
      field10: "",
    ));
  }
  state = stateoutput;
  yield state;
}
