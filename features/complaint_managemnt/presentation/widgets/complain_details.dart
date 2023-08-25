import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom/continue_button.dart';
enum SingingCharacter { action, inProgress, close }

class ComplainDetails extends StatefulWidget {
   ComplainDetails({
    required this.description,
     required this.luggageWeight,
    required this.dateOfTraveling,
     required this.flightNumber,
     required this.flightType,
    Key? key}) : super(key: key);
  String dateOfTraveling;
  String flightNumber;
  String flightType;
  String description;
  String luggageWeight;

  @override
  State<ComplainDetails> createState() => _ComplainDetailsState();

}


class _ComplainDetailsState extends State<ComplainDetails> {

  SingingCharacter? _character = SingingCharacter.action;
  SingingCharacter? selectedGender;


  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Date of traveling ",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),

            Padding(
              padding: EdgeInsets.only(top: 5.h,bottom: 20.h),
              child: Text(widget.dateOfTraveling,
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                  )),
            ),

            const Text(
              "Flight number ",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
             SizedBox(height: 5.h,),
             Text(widget.flightNumber,
              style: TextStyle(
                color: Theme.of(context).hintColor)),
            Padding(
                padding:
                EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Flight type ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 5.h,),
                    Text(widget.flightType,
                        style: TextStyle(
                          color:
                          Theme.of(context).hintColor,
                        )),
                  ],
                )),
            const Text(
              "Luggage Weight  ",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 5.h,),
             Text(widget.luggageWeight ),
            Padding(
                padding:
                EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description",
                      style: TextStyle(
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 5.h,),
                    Text(widget.description,
                        style: TextStyle(
                          color:
                          Theme.of(context).hintColor,
                        )),
                  ],
                )),
            const Text("Status",
              style: TextStyle(
                  fontWeight: FontWeight.w400)),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [
                  SizedBox(
                    width: 22.w,
                    child: Radio(
                      value: SingingCharacter.action,
                      groupValue: _character,
                      activeColor: Colors.lightGreen,
                      onChanged: (value) {
                        setState(() {
                          _character =
                          value as SingingCharacter;
                        });
                      },
                    ),
                  ),
                   Text("Action",
                    style: TextStyle(
                      color:
                      Theme.of(context).hintColor,),),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    width: 22.w,
                    child: Radio(
                        value: SingingCharacter.inProgress,
                        groupValue: _character,
                        activeColor: Colors.lightGreen,
                        onChanged: (value) {
                          setState(() {
                            _character =
                            value as SingingCharacter;
                          }); //selected value
                        }),
                  ),
                   Text("In progress",
                    style: TextStyle(
                      color:
                      Theme.of(context).hintColor,),),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    width: 22,
                    child: Radio(
                        value: SingingCharacter.close,
                        activeColor: Colors.lightGreen,
                        groupValue: _character,
                        onChanged: (value) {
                          setState(() {
                            _character =
                            value as SingingCharacter;
                          }); //selected value
                        }),
                  ),
                   Text("close",
                     style: TextStyle(
                       color:
                       Theme.of(context).hintColor,)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: ContinueButton(
                text: "okay",
                onPressed: () {},
                backgroundColor:
                Theme.of(context).primaryColorDark,
              ),
            )
          ],
        ),
      ),
    );
  }
}
