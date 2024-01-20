import 'package:digital_consulting_platform/models/expert.dart';
import 'package:digital_consulting_platform/models/expertmainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class First extends StatelessWidget {
 final Expert ex;
  First(this.ex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 83, 15, 211),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        // drawer: const Drawer(
        //  shape: Border(),
        // ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 83, 15, 211),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Container(
                    margin: const EdgeInsets.only(left: 30, bottom: 30),
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 28),
                            child: Image.asset("assets/images/kou.jpg" ,width: 150, height: 150)),
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                const EdgeInsets.only(top: 13, left: 16),
                                child: Text(
                                  ex.name,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                margin:
                                const EdgeInsets.only(top: 10, left: 10),
                                child:  Text(
                                  ex.experinces,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              // Container(
                              //   margin: EdgeInsets.only(top: 20, left: 10),
                              //   child: Text(
                              //     "Rating: 4.5",
                              //     style: TextStyle(
                              //         fontSize: 15,
                              //         color: Colors.yellowAccent,
                              //         fontWeight: FontWeight.w700),
                              //   ),
                              // ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Text(
                  "january 2023",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 0, 3, 2),
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    demoDates("San", "21", false),
                    demoDates("mon", "21", false),
                    demoDates("Tue", "22", false),
                    demoDates("Wed", "23", false),
                    demoDates("Thr", "24", false),
                    demoDates("Fri", "21", false),
                    demoDates("Sat", "21", false),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Text(
                  "Morning",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 0, 3, 2),
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 20,
                  left: 13,
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.6,
                  children: [
                    doctorTimings("8:30 AM", true),
                    doctorTimings("9:30 AM", false),
                    doctorTimings("10:30 AM", false),
                    doctorTimings("11:30 AM", false),
                    doctorTimings("12:30 AM", false),
                    doctorTimings("1:30 AM", false),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Text(
                  "Evening",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 0, 3, 2),
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 20,
                  left: 13,
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.6,
                  children: [
                    doctorTimings("8:30 AM", true),
                    doctorTimings("9:30 AM", false),
                    doctorTimings("10:30 AM", false),
                    doctorTimings("11:30 AM", false),
                    doctorTimings("12:30 AM", false),
                    doctorTimings("1:30 AM", false),
                  ],
                ),
              ),
           GestureDetector(  child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color.fromARGB(246, 111, 27, 228),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Make an Appointment",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
           onTap:(){  Get.snackbar('make an appointment', 'appointment booked successfully');

           }
           )
            ],
          ),
        ));
  }

  doctorTimings(String time, bool isSelected) {
    return isSelected
        ? Container(
      margin: EdgeInsets.only(
        top: 20,
        right: 17,
        left: 5,
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 104, 17, 255),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Icon(
              Icons.access_time,
              color: Colors.white,
              size: 10,
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 2),
              child: Text(
                time,
                style: TextStyle(color: Colors.white, fontSize: 17),
              )),
        ],
      ),
    )
        : Container(
      margin: EdgeInsets.only(top: 20, right: 20),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 127, 95, 193),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Icon(
              Icons.access_time,
              color: Color.fromARGB(255, 9, 9, 9),
              size: 10,
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 2),
              child: Text(
                time,
                style: TextStyle(color: Colors.white, fontSize: 17),
              )),
        ],
      ),
    );
  }

  demoDates(String day, String date, bool isSelected) {
    return isSelected
        ? Container(
      width: 70,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 104, 17, 255),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              day,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 18),
            padding: EdgeInsets.all(7),
            child: Text(
              date,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    )
        : Container(
      width: 70,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 127, 95, 193),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              day,
              style: TextStyle(
                  color: Color.fromARGB(255, 221, 210, 210),
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 18),
            padding: EdgeInsets.all(7),
            child: Text(
              date,
              style: TextStyle(
                  color: Color.fromARGB(255, 241, 235, 246),
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}