import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap4/tablebodytap4.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComPageNumBtnGroup.dart';

import 'datatap4/datatap4.dart';
import 'modelintable.dart';

class TableTap4Struc extends StatelessWidget {
  const TableTap4Struc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TableStrucBuffer();
  }
}

class _TableStrucBuffer extends StatelessWidget {
  const _TableStrucBuffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FetchDataTable4Bloc(),
      child: BlocBuilder<FetchDataTable4Bloc, List<MainStrucTableTap4>>(
        builder: (_, State) {
          return _TableStrucMain4(
            datainput: State,
          );
        },
      ),
    );
  }
}

class _TableStrucMain4 extends StatefulWidget {
  const _TableStrucMain4({Key? key, this.datainput}) : super(key: key);

  final List<MainStrucTableTap4>? datainput;

  @override
  __TableStrucMain4State createState() => __TableStrucMain4State();
}

class __TableStrucMain4State extends State<_TableStrucMain4> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataTable4Bloc>().add(DataSequncePage4.select);
  }

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap4> _datainput = widget.datainput ?? [];
    void tapChangeTablePage(int n) {
      setState(() {
        // print(n);
        TableTap4nPage = n;
      });
    }

    return SingleChildScrollView(
        child: Wrap(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 20, end: 20),
          child: Container(
            // color: Colors.red,
            width: 1200,
            child: Column(
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
                  child: DataListTable4(
                    datainput: _datainput,
                  ),
                ),
                _BottomPageNum(
                  func: tapChangeTablePage,
                  datainput: _datainput,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 20, end: 20),
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
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 20, end: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 460,
                              height: 30,
                              // color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap4,
                              fnContr: (input) {
                                undercontroltap4 = input;
                              },
                              sValue: EditDataTable4.number,
                              returnfunc: () {},
                              isEnabled: false,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                                isContr: undercontroltap4,
                                fnContr: (input) {
                                  undercontroltap4 = input;
                                },
                                sValue: EditDataTable4.field01,
                                returnfunc: (String s) {
                                  EditDataTable4buffer.field01 = s;
                                }),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap4,
                              fnContr: (input) {
                                undercontroltap4 = input;
                              },
                              sValue: EditDataTable4.field02,
                              returnfunc: (String s) {
                                EditDataTable4buffer.field02 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap4,
                              fnContr: (input) {
                                undercontroltap4 = input;
                              },
                              sValue: EditDataTable4.field03,
                              returnfunc: (String s) {
                                EditDataTable4buffer.field03 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap4,
                              fnContr: (input) {
                                undercontroltap4 = input;
                              },
                              sValue: EditDataTable4.field04,
                              returnfunc: (String s) {
                                EditDataTable4buffer.field04 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap4,
                              fnContr: (input) {
                                undercontroltap4 = input;
                              },
                              sValue: EditDataTable4.field05,
                              returnfunc: (String s) {
                                EditDataTable4buffer.field05 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap4,
                              fnContr: (input) {
                                undercontroltap4 = input;
                              },
                              sValue: EditDataTable4.field06,
                              returnfunc: (String s) {
                                EditDataTable4buffer.field06 = s;
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 460,
                              height: 30,
                              // color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap4,
                              fnContr: (input) {
                                undercontroltap4 = input;
                              },
                              sValue: EditDataTable4.field07,
                              returnfunc: (String s) {
                                EditDataTable4buffer.field07 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap4,
                              fnContr: (input) {
                                undercontroltap4 = input;
                              },
                              sValue: EditDataTable4.field08,
                              returnfunc: (String s) {
                                EditDataTable4buffer.field08 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap4,
                              fnContr: (input) {
                                undercontroltap4 = input;
                              },
                              sValue: EditDataTable4.field09,
                              returnfunc: (String s) {
                                EditDataTable4buffer.field09 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap4,
                              fnContr: (input) {
                                undercontroltap4 = input;
                              },
                              sValue: EditDataTable4.field10,
                              returnfunc: (String s) {
                                EditDataTable4buffer.field10 = s;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                            child: ComInputText(
                              isContr: undercontroltap4,
                              fnContr: (input) {
                                undercontroltap4 = input;
                              },
                              sValue: EditDataTable4.field11,
                              returnfunc: (String s) {
                                EditDataTable4buffer.field11 = s;
                              },
                            ),
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 400,
                            height: 40,
                            // color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
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
                                EditDataTable4buffer = EditDataTable4;
                                context.read<FetchDataTable4Bloc>().add(
                                    DataSequncePage4
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
                                undercontroltap4 = true;
                                EditDataTable4 = MainStrucTableTap4(
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
                                  field11: "",
                                  field12: "",
                                );
                                BlocProvider.of<BlocPageRebuild>(context)
                                    .rebuildPage();
                              },
                              nWidth: 134),
                          SizedBox(
                            width: 10,
                          ),
                          ComBtnBlackBorder(
                              sLabel: "New",
                              func: () {
                                context
                                    .read<FetchDataTable4Bloc>()
                                    .add(DataSequncePage4.insert);
                              },
                              nWidth: 134),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}

class _BottomPageNum extends StatelessWidget {
  _BottomPageNum({Key? key, required this.func, this.datainput})
      : super(key: key);
  final Function func;
  List<MainStrucTableTap4>? datainput;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    List<MainStrucTableTap4> _datainput = datainput ?? [];

    //print("build BottomPageNum " + BlocPatientList.state.patientTableData.length.toString());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Pages",
          style: TxtStyle(fontSize: 12),
        ),
        ComPageNumBtnGroup(
          nItemNum: _datainput.length,
          nPageSelects: TableTap4nPage,
          func: func,
          nNumToShowArrowAtPage: nNumToShowArrowAtPageTable4,
          nTableCellPerEachPage: nTableCellPerEachPageTable4,
        )
      ],
    );
  }
}
