import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';

import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';

import 'package:pick_edit_datatable/widget/ComBtnImage.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComYNPopup.dart';

import 'datatap5/datatap5.dart';
import 'modelintable.dart';

int ListTable5Status = 0;

class DataListTable5 extends StatefulWidget {
  const DataListTable5({Key? key, required this.datainput}) : super(key: key);
  final List<MainStrucTableTap5> datainput;
  @override
  _DataListTable5State createState() => _DataListTable5State();
}

class _DataListTable5State extends State<DataListTable5> {
  int nCurrentSortIndex = 0; //index from Header DataColumn
  bool isSortAscending = true;

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap5> Listdata_Clone = widget.datainput;

    double nDataColumnWidth = 100;
    double nDataColumnWidthIcon = 100;
    double nDataWidthIcon = 50;
    double nMarginToMakeIconSmaller = 8;

    void tapSort(int nIndex, int columnIndex, bool ascending) {
      if (ascending) {
        print(nIndex);
        switch (nIndex) {
          case 1:
            Listdata_Clone.sort(
                (item1, item2) => item1.field01.compareTo(item2.field01));
            break;
          case 2:
            Listdata_Clone.sort(
                (item1, item2) => item1.field02.compareTo(item2.field02));
            break;
          case 3:
            Listdata_Clone.sort(
                (item1, item2) => item1.field03.compareTo(item2.field03));
            break;
          // case 4:
          //   Listdata_Clone.sort(
          //       (item1, item2) => item1.field04.compareTo(item2.field04));
          //   break;
          // case 5:
          //   Listdata_Clone.sort(
          //       (item1, item2) => item1.field05.compareTo(item2.field05));
          //   break;
        }
      } else {
        switch (nIndex) {
          case 1:
            Listdata_Clone.sort(
                (item1, item2) => item2.field01.compareTo(item1.field01));
            break;
          case 2:
            Listdata_Clone.sort(
                (item1, item2) => item2.field02.compareTo(item1.field02));
            break;
          case 3:
            Listdata_Clone.sort(
                (item1, item2) => item2.field03.compareTo(item1.field03));
            break;
          // case 4:
          //   Listdata_Clone.sort(
          //       (item1, item2) => item2.field04.compareTo(item1.field04));
          //   break;
          // case 5:
          //   Listdata_Clone.sort(
          //       (item1, item2) => item2.field05.compareTo(item1.field05));
          //   break;
        }
      }
      //BlocPatientList.sort();
      setState(() {
        nCurrentSortIndex = columnIndex;
        isSortAscending = ascending;
      });
    }

    //------------------------------------------------------------------------------------------------

    void _tapView(MainStrucTableTap5 s) {
      //click all
      // print("123");
      ListTable5Status = 1;
      EditDataTable5 = s;
      EditDataTable5buffer = s;

      context.read<FetchDataTable5Bloc>().add(DataSequncePage5.select);
      _ConsoleBox(s, context, zeroDropDownData);
    }

    void _CallYNPopup(
        String sTxtHead,
        String sTxtBody,
        String sTxtBtnYes,
        String sTxtBtnNo,
        Function funcYes,
        Function funcNo,
        String sFuncData,
        bool isSwitchYNBtnPos) {
      showDialog<String>(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => ComYNPopup(
          sTxtHead: sTxtHead,
          sTxtBody: sTxtBody,
          sTxtBtnYes: sTxtBtnYes,
          sTxtBtnNo: sTxtBtnNo,
          funcYes: funcYes,
          funcNo: funcNo,
          sFuncData: sFuncData,
          isSwitchYNBtnPos: isSwitchYNBtnPos,
        ),
      );
    }

    void _CloseYNPopup() {
      Navigator.pop(context, '');
    }

    // void GoToTele(String s) {
    //   CloseYNPopup();
    //   BlocProvider.of<BlocChangePage>(context).changePage(enumPageList.Tele);
    // }
    void _Edit(MainStrucTableTap5 s) {
      _CloseYNPopup();
      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _Delete(String s) {
      _CloseYNPopup();
      context.read<FetchDataTable5Bloc>().add(DataSequncePage5.delete);
    }

    void _tapEdit(MainStrucTableTap5 s) {
      // _CallYNPopup('Edit ${s}', 'Do you want to Edit ${s} now?', 'Yes', 'No',
      //     _Edit, _CloseYNPopup, s, false);
      EditDataTable5 = s;
      EditDataTable5buffer = s;
      undercontroltap5 = true;
      context.read<FetchDataTable5Bloc>().add(DataSequncePage5.select);
      // BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _tapDelete(MainStrucTableTap5 s) {
      DeleteDataTable5buffer.number = s.number;
      DeleteDataTable5buffer.field01 = s.field01;
      DeleteDataTable5buffer.field02 = s.field02;
      DeleteDataTable5buffer.field03 = s.field03;
      _CallYNPopup(
          'Delete ${s.number}',
          'Are you sure you want to delete ${s.number}?',
          'Delete',
          'Cancel',
          _Delete,
          _CloseYNPopup,
          s.number,
          true);
    }

    //all cells data for this page.
    List<DataRow> RowDataInput = _getDataRowList(
      Listdata_Clone,
      nDataColumnWidth,
      nDataColumnWidthIcon,
      nDataWidthIcon,
      nMarginToMakeIconSmaller,
      _tapView,
      _tapEdit,
      _tapDelete,
      TableTap5nPage, //data
    );

    //fixed error when sort the hide column on mobile
    // nCurrentSortIndex = 0;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 30,
                // color: Colors.red,
                child: ComBtnBlackBorder(
                    sLabel: "New",
                    func: () {
                      ListTable5Status = 0;
                      MainStrucTableTap5 Zerodata = MainStrucTableTap5(
                        number: "",
                        field01: "",
                        field02: "",
                        field03: "",
                        field04: "",
                        field05: "",
                        field06: "",
                        field07: "",
                        field08: "",
                        field09: "",
                        field10: "",
                      );
                      // CustFull = '';
                      // FrequencyRequest = '';
                      // Incharge = '';
                      // SubLeader = '';
                      // GL = '';
                      // JP = '';
                      // DMG = '';
                      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                      _ConsoleBox(Zerodata, context, zeroDropDownData);
                    },
                    nWidth: 134),
              ),
              // SizedBox(
              //   width: 100,
              // ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              sortColumnIndex: nCurrentSortIndex,
              sortAscending: isSortAscending,
              showCheckboxColumn:
                  false, //Hide checkbox that come from tap row 'onselectchanged'
              columnSpacing: 10,
              dataRowHeight: 56,
              // Header Column -----------------------------------------------------------
              columns: [
                _getDataColumn(
                    1, "NO", 'Sort Field 1', nDataColumnWidth, tapSort),
                _getDataColumn(
                    2, "Group ID", 'Sort Field 2', nDataColumnWidth, tapSort),
                _getDataColumn(
                    3, "Group Name", 'Sort Field 3', nDataColumnWidth, tapSort),
                // _getDataColumn(
                //     4, "Field 4", 'Sort Field 4', nDataColumnWidth, tapSort),
                // _getDataColumn(
                //     5, "Field 5", 'Sort Field 5', nDataColumnWidth, tapSort),
                _getBlankDataColumn(nDataColumnWidthIcon),
              ],
              // Cell Row  -----------------------------------------------------------
              rows: [
                for (DataRow dataRow in RowDataInput) dataRow,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Header Column --------------------------------------------------------------

DataColumn _getDataColumn(int nIndex, String sLabel, String sTooltip,
    double nDataColumnWidth, Function func) {
  return DataColumn(
    label: Container(
      width: nDataColumnWidth,
      child: Text(sLabel),
      //color: Colors.red,
    ),
    numeric: false,
    tooltip: sTooltip,
    onSort: (int columnIndex, bool ascending) {
      func(nIndex, columnIndex, ascending);
    },
  );
}

// blank for call icon
DataColumn _getBlankDataColumn(double nDataColumnWidthIcon) {
  return DataColumn(
    label: Expanded(
      child: Container(
          // color: Colors.red,
          ),
    ),
  );
}

// Cell Row -------------------------------------------------------------------
List<DataRow> _getDataRowList(
  List<MainStrucTableTap5> Listdata_Clone,
  double nDataColumnWidth,
  double nDataColumnWidthIcon,
  double nDataWidthIcon,
  double nMarginToMakeIconSmaller,
  // enumScreenResponsiveList screenResponsive,
  Function funcView,
  Function funcEdit,
  Function funcDelete,
  int currentPage,
) {
  int nStartCell = (currentPage - 1) * nTableCellPerEachPageTable5;

  List<DataRow> dataRowList = [];
  for (int n = nStartCell;
      n < (nStartCell + nTableCellPerEachPageTable5);
      n++) {
    if (n < Listdata_Clone.length) {
      dataRowList.add(_getDataRow(
        Listdata_Clone[n].number,
        Listdata_Clone[n].field01,
        Listdata_Clone[n].field02,
        Listdata_Clone[n].field03,
        // Listdata_Clone[n].field04,
        // Listdata_Clone[n].field05,
        nDataColumnWidth,
        nDataColumnWidthIcon,
        nDataWidthIcon,
        nMarginToMakeIconSmaller,
        // screenResponsive,
        funcView,
        funcEdit,
        funcDelete,
        Listdata_Clone[n],
      ));
    }
  }
  return dataRowList;
}

DataRow _getDataRow(
    String number,
    String field01,
    String field02,
    String field03,
    // String field04,
    // String field05,
    double nDataColumnWidth,
    double nDataColumnWidthIcon,
    double nDataWidthIcon,
    double nMarginToMakeIconSmaller,
    // enumScreenResponsiveList screenResponsive,
    Function funcView,
    Function funcEdit,
    Function funcDelete,
    MainStrucTableTap5 getData) {
  //cells num must be match header column num

  return DataRow(
      cells: [
        _getDataCell_Label(number, nDataColumnWidth),
        _getDataCell_Label(field01, nDataColumnWidth),
        _getDataCell_Label(field02, nDataColumnWidth),
        // _getDataCell_Label(field03, nDataColumnWidth),
        // _getDataCell_Label(field04, nDataColumnWidth),
        // _getDataCell_Label(field05, nDataColumnWidth),
        _getDataCell_Icon(number, funcEdit, funcDelete, nDataColumnWidthIcon,
            nDataWidthIcon, nMarginToMakeIconSmaller, getData),
      ],
      onSelectChanged: (value) {
        // funcView(number);
        // print(value);
        // print(number);
        funcView(getData);
      });
}

DataCell _getDataCell_ImgName(
    String sName, double nDataColumnWidth, int nGender) {
  return DataCell(InkWell(
      child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              // ComProfileImg(
              //   profileImg: enumProfileImgList.Patient_Default,
              //   nGender: nGender,
              //   nWidthHeight: 40,
              // ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Text(sName,
                      overflow: TextOverflow.fade, softWrap: false)),
            ],
          ))));
}

// each cell inside 1 row
DataCell _getDataCell_Label(String sLabel, double nDataColumnWidth) {
  return DataCell(InkWell(
      child: Container(
    // color: Colors.red,
    width: nDataColumnWidth,
    child: Text(sLabel, overflow: TextOverflow.fade, softWrap: false),
  )));
}

DataCell _getDataCell_Icon(
    String sId,
    Function funcEdit,
    Function funcDelete,
    double nDataColumnWidthIcon,
    double nDataWidthIcon,
    double nMarginToMakeIconSmaller,
    MainStrucTableTap5 GetData) {
  void _tapEdit() {
    funcEdit(GetData);
  }

  void _tapDelete() {
    funcDelete(GetData);
  }

  return DataCell(
    Container(
      width: nDataColumnWidthIcon,
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Container(
          //   width: nDataWidthIcon,
          //   height: 100,
          //   // color: Colors.blue,
          //   child: ComBtnImage(
          //     sImgPath: Icons.edit,
          //     func: _tapEdit,
          //     nMarginToMakeIconSmaller: nMarginToMakeIconSmaller,
          //   ),
          // ),
          Container(
            width: nDataWidthIcon,
            height: 100,
            child: ComBtnImage(
              sImgPath: Icons.delete,
              func: _tapDelete,
              nMarginToMakeIconSmaller: nMarginToMakeIconSmaller,
            ),
          ),
        ],
      ),
    ),
  );
}

void _ConsoleBox(MainStrucTableTap5 input, BuildContext contextinput,
    DropDownData dropdowndata) {
  showDialog(
    context: contextinput,
    barrierDismissible: true,
    builder: (BuildContext context) {
      DropDownData _datadropdown = dropdowndata;
      return Dialog(
        child: Container(
          decoration: BoxDecoration(
            color: CustomTheme.colorGreyBg,
            borderRadius: BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                  color: CustomTheme.colorShadowBgStrong,
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  spreadRadius: 0)
            ],
          ),
          width: 1000,
          height: 420,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CustomTheme.colorGreyBg,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                        color: CustomTheme.colorShadowBgStrong,
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                ),
                width: 500,
                height: 335,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 460,
                        height: 50,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      height: 15,
                      child: Align(
                          alignment: Alignment.centerLeft, child: Text("NO")),
                    ),
                    Container(
                      width: 400,
                      height: 40,
                      // color: Colors.red,
                      child: ComInputText(
                        isContr: undercontroltap5,
                        fnContr: (input) {
                          undercontroltap5 = input;
                        },
                        sValue: EditDataTable5.number,
                        returnfunc: () {},
                        isEnabled: false,
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      height: 15,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("GroupId")),
                    ),
                    Container(
                      width: 400,
                      height: 40,
                      // color: Colors.red,
                      child: ComInputText(
                          isContr: undercontroltap5,
                          fnContr: (input) {
                            undercontroltap5 = input;
                          },
                          sValue: EditDataTable5.field01,
                          returnfunc: (String s) {
                            EditDataTable5buffer.field01 = s;
                          }),
                    ),
                    SizedBox(
                      width: 400,
                      height: 15,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("GroupName")),
                    ),
                    Container(
                      width: 400,
                      height: 40,
                      // color: Colors.red,
                      child: ComInputText(
                        isContr: undercontroltap5,
                        fnContr: (input) {
                          undercontroltap5 = input;
                        },
                        sValue: EditDataTable5.field02,
                        returnfunc: (String s) {
                          EditDataTable5buffer.field02 = s;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      height: 15,
                      // child: Align(
                      //     alignment: Alignment.centerLeft, child: Text("test")),
                    ),
                    Container(
                      width: 400,
                      height: 40,
                      // color: Colors.red,
                      // child: ComInputText(
                      //   isContr: undercontroltap5,
                      //   fnContr: (input) {
                      //     undercontroltap5 = input;
                      //   },
                      //   sValue: EditDataTable5.field03,
                      //   returnfunc: (String s) {
                      //     EditDataTable5buffer.field03 = s;
                      //   },
                      // ),
                    ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // Container(
                    //   width: 400,
                    //   height: 40,
                    //   // color: Colors.red,
                    //   child: ComInputText(
                    //     isContr: undercontroltap5,
                    //     fnContr: (input) {
                    //       undercontroltap5 = input;
                    //     },
                    //     sValue: EditDataTable5.field04,
                    //     returnfunc: (String s) {
                    //       EditDataTable5buffer.field04 = s;
                    //     },
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 460,
                        height: 40,
                        // color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ComBtnBlack(
                                sLabel: "Save",
                                func: () {
                                  // EditDataTable5buffer = EditDataTable5;
                                  contextinput.read<FetchDataTable5Bloc>().add(
                                      DataSequncePage5
                                          .update); //<------------------
                                },
                                nWidth: 134),
                            SizedBox(
                              width: 10,
                            ),
                            ComBtnBlackBorder(
                                sLabel: "Cancle",
                                cBg: Colors.red,
                                func: () {
                                  undercontroltap5 = true;
                                  EditDataTable5 = MainStrucTableTap5(
                                      number: "",
                                      field01: "",
                                      field02: "",
                                      field03: "",
                                      field04: "",
                                      field05: "",
                                      field06: "",
                                      field07: "",
                                      field08: "",
                                      field09: "",
                                      field10: "");
                                  BlocProvider.of<BlocPageRebuild>(contextinput)
                                      .rebuildPage();
                                },
                                nWidth: 134),
                            SizedBox(
                              width: 10,
                            ),
                            ComBtnBlackBorder(
                                sLabel: "New",
                                func: () {
                                  contextinput
                                      .read<FetchDataTable5Bloc>()
                                      .add(DataSequncePage5.insert);
                                },
                                nWidth: 134),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

class TxtStylePOP extends TextStyle {
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily = 'Mitr';
  final FontStyle fontStyle = FontStyle.normal;

  const TxtStylePOP(
      {this.fontSize = 12,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal})
      : super();
}

void _onLoading(BuildContext contextin, void newValue) {
  showDialog(
    context: contextin,
    barrierDismissible: false,
    builder: (BuildContext context) {
      newValue;
      return Container(
        // color: Colors.red,

        child: Dialog(
          child: Container(
              height: 75,
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 30),
                  new CircularProgressIndicator(),
                  SizedBox(width: 20),
                  new Text("Loading"),
                ],
              )),
        ),
      );
    },
  );

  Timer(Duration(seconds: 1), () {
    BlocProvider.of<BlocPageRebuild>(contextin).rebuildPage();
    Navigator.pop(contextin);
  });
}
