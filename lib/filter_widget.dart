// import 'package:salesjinni/cards_screen_model.dart';
// import 'package:salesjinni/main_screen.dart';
import 'package:bigbuzz/models/filter_params_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../cards_screen_model.dart';
// import 'cards_screen_model.dart';
// import 'filter_widget.dart';

enum DateType { from, to }

class FilterWidget extends StatefulWidget {
  final Future<dynamic> Function(Map?) filterData;
  const FilterWidget(
      {required this.filterData, Key? key, required this.filterParams})
      : super(key: key);

  final FilterParams? filterParams;

  @override
  FilterWidgetState createState() => FilterWidgetState();
}

class FilterWidgetState extends State<FilterWidget> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedFromDate = DateTime.now();
  late FilterParams filterParams;
  Map filterData = {};

  @override
  void initState() {
    super.initState();
    filterParams = widget.filterParams!;
    _getStatuses();
  }

  _getStatuses() async {
    //   _dataRepository.serverStatusApi({}).then((value) async {
    //     var data = List.from([]);
    //
    //     if (value['meta']['code'] == 200) {
    //       // int clientId = await getSavedData().then((value) => value['userId']);
    //       await setjwtData(value['token']);
    //       for (var v in value['data']) {
    //         data.add(v['status_label']);
    //       }
    //     }
    //     logPrint.v("status : $data");
    //     filterParams = widget.filterParams!.copyWith(status: data);
    //     setState(() {});
    //     return data;
    //   });
  }

  Future<void> _selectDate(BuildContext context, DateType type) async {
    const MaterialColor buttonTextColor = MaterialColor(
      0xFF5252FF,
      <int, Color>{
        50: Color(0xFF5252FF),
        100: Color(0xFF5252FF),
        200: Color(0xFF5252FF),
        300: Color(0xFF5252FF),
        400: Color(0xFF5252FF),
        500: Color(0xFF5252FF),
        600: Color(0xFF5252FF),
        700: Color(0xFF5252FF),
        800: Color(0xFF5252FF),
        900: Color(0xFF5252FF),
      },
    );
    String date =
        type == DateType.from ? filterParams.fromDate! : filterParams.toDate!;
    if (date.isEmpty) {
      date = DateTime.now().toString();
    }
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(date),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor:
                // const Color(0xFF113393),
                const Color.fromARGB(255, 106, 74, 182),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: buttonTextColor)
                .copyWith(
                    primary: const Color.fromRGBO(106, 74, 182, 1.0),
                    secondary: const Color.fromRGBO(106, 74, 182, 1.0)),

            // primaryColorLight:  Color.fromARGB(212, 255, 28, 11),//selection color
            // dialogBackgroundColor: Colors.red,//Background color
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        if (type == DateType.from) {
          selectedFromDate = picked;
          filterParams = filterParams.copyWith(
              fromDate: DateFormat('yyyy-MM-dd').format(picked));
        } else {
          selectedDate = picked;
          filterParams = filterParams.copyWith(
              toDate: DateFormat('yyyy-MM-dd').format(picked));
        }
      });
    }
  }

  _onStatusChanged(bool? newValue, String? selectedStatus) => setState(() {
        if (newValue!) {
          filterParams = filterParams.copyWith(selectedStatus: selectedStatus);
        } else {
          filterParams = filterParams.copyWith(selectedStatus: '');
        }
      });

  _onUserChanged(bool? newValue, String? selectedUser) => setState(() {
        if (newValue!) {
          filterParams = filterParams.copyWith(selectedUser: selectedUser);
        } else {
          filterParams = filterParams.copyWith(selectedUser: '');
        }
      });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(232, 236, 244, 1),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 0, 37, 65),
          ),

          backgroundColor: Colors.white,

          ///Clear All button
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    filterParams = filterParams.copyWith(selectedStatus: '');

                    filterParams.fromDate =
                        DateFormat('yyyy-MM-dd').format(DateTime.now());
                    print('dewmnwejk : ${filterParams.fromDate}');
                    setFilterData(filterParams.fromDate ?? "",
                        filterParams.selectedStatus ?? "");
                    // date: DateFormat('dd/MM/yy').format(DateTime.now()));
                  });
                  Navigator.pop(context, filterParams);
                },
                child: const Text(
                  "Clear All",
                  style: TextStyle(
                      color: Color.fromARGB(255, 106, 74, 182), fontSize: 16),
                )),
          ],
          title:
              // Text("Filter by (${filterParams.filterCount})"),
              const Text(
            "Filter by",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 37, 65),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
            ),
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                        color: Color.fromRGBO(106, 74, 182, 1.0),
                        fontWeight: FontWeight.w700),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(132, 48),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 0,
                          // style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(14)),
                    backgroundColor: const Color.fromARGB(255, 106, 74, 182),
                  ),
                  onPressed: () async {
                    print(filterParams.fromDate);
                    print(filterParams.selectedStatus);

                    showDialog(
                        context: context,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()));
                    await Future.delayed(const Duration(seconds: 2));
                    await Future.delayed(const Duration(seconds: 0),
                        () => Navigator.pop(context));
                    await Future.delayed(const Duration(seconds: 0),
                        () => Navigator.of(context).pop());
                    setFilterData(filterParams.fromDate ?? "",
                        filterParams.selectedStatus ?? "");
                  },
                  child: const Text(
                    "Apply",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  )),
            ],
          ),
        ),
        body: Row(
          children: [
            Container(
              width: width * .3,
              color: Colors.white,
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          filterParams = filterParams.copyWith(
                              selectedFilter: SelectedFilter.date);
                        });
                      },
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          color:
                              filterParams.selectedFilter == SelectedFilter.date
                                  ? const Color.fromARGB(255, 106, 74, 182)
                                  : null,
                          child: Text(
                            "Start Date",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: filterParams.selectedFilter ==
                                        SelectedFilter.date
                                    ? Colors.white
                                    : null),
                          ))),
                  InkWell(
                      onTap: () {
                        setState(() {
                          filterParams = filterParams.copyWith(
                              selectedFilter: SelectedFilter.location);
                        });
                      },
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          color: filterParams.selectedFilter ==
                                  SelectedFilter.location
                              ? const Color.fromARGB(255, 106, 74, 182)
                              : null,
                          child: Text(
                            "Location",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: filterParams.selectedFilter ==
                                        SelectedFilter.location
                                    ? Colors.white
                                    : null),
                          ))),
                  // InkWell(
                  //     onTap: () {
                  //       setState(() {
                  //         filterParams = filterParams.copyWith(
                  //             selectedFilter: SelectedFilter.user);
                  //       });
                  //     },
                  //     child: Container(
                  //         width: double.infinity,
                  //         padding: const EdgeInsets.all(16),
                  //         color: filterParams.selectedFilter ==
                  //             SelectedFilter.user
                  //             ? Colors.redAccent
                  //             : null,
                  //         child: Text(
                  //           "User",ƒ
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.w700,
                  //               color: filterParams.selectedFilter ==
                  //                   SelectedFilter.user
                  //                   ? Colors.white
                  //                   : null),
                  //         ))),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(200, 255, 255, 255),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey,
                  //     blurRadius: 14.0,
                  //   ),
                  // ]
                ),
                child: Column(
                  children: [
                    if (filterParams.selectedFilter == SelectedFilter.date)
                      Padding(
                        padding: const EdgeInsets.all(21),
                        child: Column(
                          children: [
                            InkWell(
                                onTap: () =>
                                    _selectDate(context, DateType.from),
                                child: Container(
                                    width: width * 0.5,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey[200]!,
                                        )),
                                    child: Row(
                                      children: [
                                        Text(
                                          "To           ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[500]),
                                        ),
                                        Text(
                                          filterParams.fromDate == ''
                                              ? ''
                                              : DateFormat("dd/MM/yyyy").format(
                                                  DateTime.parse(
                                                      filterParams.fromDate!)),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        // Icon(
                                        //   Icons.date_range,
                                        //   color: Colors.redAccent[400]!,
                                        // ),
                                      ],
                                    ))),
                            const SizedBox(
                              height: 32,
                            ),
                            // InkWell(
                            //     onTap: () => _selectDate(context, DateType.to),
                            //     child: Container(
                            //         width: width * 0.5,
                            //         padding: const EdgeInsets.all(16),
                            //         decoration: BoxDecoration(
                            //             color: Colors.white,
                            //             borderRadius: const BorderRadius.all(
                            //                 Radius.circular(10,)),
                            //             border: Border.all(
                            //               color: Colors.grey[200]!,
                            //             )),
                            //         // child: Row(
                            //         //   children: [
                            //         //     Text("From       ",
                            //         //       style: TextStyle(color: Colors.grey[500]),
                            //         //     ),
                            //         //     Text(filterParams.toDate == ''
                            //         //         ? ''
                            //         //         : DateFormat("dd/MM/yyyy",
                            //         //       // TextStyle(fontWeight: FontWeight.w500)
                            //         //     ).format(
                            //         //         DateTime.parse(
                            //         //             filterParams.toDate!)),
                            //         //       style: const TextStyle(fontWeight: FontWeight.bold),
                            //         //     ),
                            //         //     const Spacer(),
                            //         //     // Icon(
                            //         //     //   Icons.date_range,
                            //         //     //   color: Colors.redAccent[400]!,
                            //         //     // ),
                            //         //   ],)
                            //     )),
                          ],
                        ),
                      ),
                    if (filterParams.selectedFilter == SelectedFilter.location)
                      Expanded(
                          child: ListView.builder(
                              itemCount: filterParams.statusList!.length,
                              itemBuilder: (context, index) {
                                var status = filterParams.statusList![index];
                                return Row(
                                  children: [
                                    Checkbox(
                                        activeColor: const Color.fromARGB(
                                            255, 106, 74, 182),
                                        value: status ==
                                            filterParams.selectedStatus,
                                        onChanged: (val) {
                                          _onStatusChanged(val, status);
                                        }),
                                    Text(status)
                                  ],
                                );
                              }))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void setFilterData(String selectedDate, String selectedLocation) {
    print('set filter data 2 : $selectedDate $selectedLocation');
    var todayDate = DateFormat("dd/MM/yyyy").format(DateTime.now());

    filterData.addAll({'date': selectedDate});

    if (selectedDate == todayDate) {
      filterData.addAll({
        ['date']: ""
      });
    }

    if (selectedLocation != "") {
      filterData.addAll({'location': selectedLocation});
    }

    widget.filterData(filterData);
    // call the function
  }
}
