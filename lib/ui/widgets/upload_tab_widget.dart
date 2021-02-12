import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/provider/form_data_provider.dart';
import 'package:kartenz/ui/widgets/basic_details_form_widget.dart';
import 'package:kartenz/ui/widgets/documents_form_widget.dart';
import 'package:kartenz/ui/widgets/my_profile_tab.dart';
import 'package:provider/provider.dart';

class UploadTabWidget extends StatefulWidget {
  @override
  _UploadTabWidgetState createState() => _UploadTabWidgetState();
}

class _UploadTabWidgetState extends State<UploadTabWidget> {

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final FormData formData = Provider.of(context);
    return FAStepper(
      type: FAStepperType.vertical,
      titleHeight: 120,
      currentStep: formData.stepCount,
      onStepTapped: (val)=>changeStep(val, formData),
      titleIconArrange: FAStepperTitleIconArrange.row,
      steps:[
        FAStep(state: formData.activeStep>0?FAStepstate.complete:FAStepstate.editing, title: Text("Basic Details",style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),textAlign: TextAlign.center,), content: BasicDetailsForm(),isActive: formData.stepCount==0),
        FAStep(state: formData.activeStep>1?FAStepstate.complete:FAStepstate.editing, title: Text("Document Details",style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),), content: DocumentsFormWidet(),isActive: formData.stepCount==1 ),
        FAStep(state: formData.activeStep>2?FAStepstate.complete:FAStepstate.editing, title: Text("Engine + Transmission",style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),), content: MyProfileTab(), isActive: formData.stepCount==2,),
        FAStep(state: formData.activeStep>3?FAStepstate.complete:FAStepstate.editing, title: Text("Air Conditioning",style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),), content: MyProfileTab(), isActive: formData.stepCount==3,),
        FAStep(state: formData.activeStep>4?FAStepstate.complete:FAStepstate.editing, title: Text("Electricals + Interiors",style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),textAlign: TextAlign.center,), content: MyProfileTab(),isActive: formData.stepCount==4),
        FAStep(state: formData.activeStep>5?FAStepstate.complete:FAStepstate.editing, title: Text("Exterior + Tyres",style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),), content: MyProfileTab(),isActive: formData.stepCount==5 ),
        FAStep(state: formData.activeStep>6?FAStepstate.complete:FAStepstate.editing, title: Text("Steering Suspension + Brakes",style: AppFontStyle.headingTextStyle2(APP_BLACK_COLOR),), content: MyProfileTab(), isActive: formData.stepCount==6,),
      ],
      controlsBuilder: (BuildContext context,
          {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>

          Container(),
    );
  }
  void changeStep(int value, FormData formData ) {
    formData.stepCount = value;
  }
}
