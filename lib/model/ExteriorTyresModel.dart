import 'package:flutter/cupertino.dart';

class ExteriorTyresModel{
  String Roof ;
  String BonnetorHood;
  String DickyDoororBootDoor;
  String QuarterPanel;
  String QuarterPanelLHS;
  String QuarterPanelRHS;
  String Fender;
  String FenderLHS;
  String FenderRHS;
  String Pillar;
  String Apron;
  String Firewall;
  String CowlTop;
  String UpperCrossMember;
  String FrontShow;
  String LowerCrossMember;
  String RadiatorSupport;
  String RunningBorder;
  String RunningBorderLHS;
  String RunningBorderRHS;
  String Door;
  String DoorLHSFront;
  String   DoorLHSRear;
  String DoorRHSFront;
  String  DoorRHSRear;
  String Bumper;
  String BumperFront;
  String BumperRear;
  String Windshield;
  String WindshieldFront;
  String WindshieldBack;
  String Light;
  String LHSFogLight;
  String RHSFogLight;
  String LHSHeadlight;
  String LHSTaillight;
  String RHSHeadlight;
  String RHStaillight;
  String ORVM;
  String ORVMLHS;
  String ORVMRHS;
  String AlloyWheels;
  String  Tyre;
  String LHSFrontTyre;
  String RHSFrontTyre;
  String  LHSRearTyre;
  String RHSRearTyre;
  String SpareTyre;
  int rating;
  dynamic custom;

  ExteriorTyresModel({this.Roof, this.BonnetorHood, this.DickyDoororBootDoor,
    this.QuarterPanel, this.QuarterPanelLHS, this.QuarterPanelRHS,
    this.Fender, this.FenderLHS, this.FenderRHS, this.Pillar, this.Apron,
    this.Firewall, this.CowlTop, this.UpperCrossMember, this.FrontShow,
    this.LowerCrossMember, this.RadiatorSupport, this.RunningBorder,
    this.RunningBorderLHS, this.RunningBorderRHS, this.Door,
    this.DoorLHSFront, this.DoorLHSRear, this.DoorRHSFront, this.DoorRHSRear,
    this.Bumper, this.BumperFront, this.BumperRear, this.Windshield,
    this.WindshieldFront, this.WindshieldBack, this.Light, this.LHSFogLight,
    this.RHSFogLight, this.LHSHeadlight, this.LHSTaillight, this.RHSHeadlight,
    this.RHStaillight, this.ORVM, this.ORVMLHS, this.ORVMRHS,
    this.AlloyWheels, this.Tyre, this.LHSFrontTyre, this.RHSFrontTyre,
    this.LHSRearTyre, this.RHSRearTyre, this.SpareTyre,this.rating, this.custom});

  factory ExteriorTyresModel.fromJSON(Map<dynamic,dynamic> json){
    try{
      return ExteriorTyresModel(AlloyWheels: json['AlloyWheels']!=null?json['AlloyWheels']:"No Data",Apron: json['Apron']!=null?json['Apron']:"No Data",BonnetorHood: json['BonnetorHood']!=null?json['BonnetorHood']:"No Data",
          Bumper: json['Bumper']!=null?json['Bumper']:"No Data",BumperFront: json['BumperFront']!=null?json['BumperFront']:"No Data",BumperRear: json['BumperRear']!=null?json['BumperRear']:"No Data",CowlTop: json['CowlTop']!=null?json['CowlTop']:"No Data",
          custom: json['custom'],DickyDoororBootDoor: json['DickyDoororBootDoor']!=null?json['DickyDoororBootDoor']:"No Data",Door: json['Door']!=null?json['Door']:"No Data",DoorLHSFront: json['DoorLHSFront']!=null?json['DoorLHSFront']:"No Data",
          DoorLHSRear: json['DoorLHSRear']!=null?json['DoorLHSRear']:"No Data",DoorRHSFront: json['DoorRHSFront']!=null?json['DoorRHSFront']:"No Data",DoorRHSRear: json['DoorRHSRear']!=null?json['DoorRHSRear']:"No Data",Fender: json['Fender']!=null?json['Fender']:"No Data",
          FenderLHS: json['FenderLHS']!=null?json['FenderLHS']:"No Data",FenderRHS: json['FenderRHS']!=null?json['FenderRHS']:"No Data",Firewall: json['Firewall']!=null?json['Firewall']:"No Data",FrontShow: json['FrontShow']!=null?json['FrontShow']:"No Data",
          LHSFogLight: json['LHSFogLight']!=null?json['LHSFogLight']:"No Data",LHSFrontTyre: json['LHSFrontTyre']!=null?json['LHSFrontTyre']:"No Data",LHSHeadlight: json['LHSHeadlight']!=null?json['LHSHeadlight']:"No Data",
          LHSRearTyre: json['LHSRearTyre']!=null?json['LHSRearTyre']:"No Data",LHSTaillight: json['LHSTaillight']!=null?json['LHSTaillight']:"No Data",Light: json['Light']!=null?json['Light']:"No Data",LowerCrossMember: json['LowerCrossMember']!=null?json['LowerCrossMember']:"No Datat",
          ORVM: json['ORVM']!=null?json['ORVM']:"No Data",ORVMLHS: json['ORVMLHS']!=null?json['ORVMLHS']:"NO Data",ORVMRHS: json['ORVMRHS']!=null?json['ORVMRHS']:"No Data",Pillar: json['Pillar']!=null?json['Pillar']:"No Data",QuarterPanel: json['QuarterPanel']!=null?json['QuarterPanel']:"No Data",
          QuarterPanelLHS: json['QuarterPanelLHS']!=null?json['QuarterPanelLHS']:"No Data",QuarterPanelRHS: json['QuarterPanelRHS']!=null?json['QuarterPanelRHS']:"No Data",RadiatorSupport: json['RadiatorSupport']!=null?json['RadiatorSupport']:"No Data",
          RHSFogLight: json['RHSFogLight']!=null?json['RHSFogLight']:"No Data",RHSFrontTyre: json['RHSFrontTyre']!=null?json['RHSFrontTyre']:"No Data",RHSHeadlight: json['RHSHeadlight']!=null?json['RHSHeadlight']:"No Data",RHSRearTyre: json['RHSRearTyre']!=null?json['RHSRearTyre']:"No Data",
          RHStaillight: json['RHStaillight']!=null?json['RHStaillight']:"No Data",Roof: json['Roof']!=null?json['Roof']:"No Data",RunningBorder: json['RunningBorder']!=null?json['RunningBorder']:"No Data",RunningBorderLHS: json['RunningBorderLHS']!=null?json['RunningBorderLHS']:"No Data",
          RunningBorderRHS: json['RunningBorderRHS']!=null?json['RunningBorderRHS']:"No Data",SpareTyre: json['SpareTyre']!=null?json['SpareTyre']:"No Data",Tyre: json['Tyre']!=null?json['Tyre']:"No Data",UpperCrossMember: json['UpperCrossMember']!=null?json['UpperCrossMember']:"No Data",
          Windshield: json['Windshield']!=null?json['Windshield']:"No Data",WindshieldBack: json['WindshieldBack']!=null?json['WindshieldBack']:"No Data",WindshieldFront: json['WindshieldFront']!=null?json['WindshieldFront']:"No Data"
      );
    }catch (ex){
      print("Exception ex: "+ ex.toString());
      return null;
    }
  }
  Map toJson()=>{
    "Roof":Roof,"BonnetorHood":BonnetorHood,"DickyDoororBootDoor":DickyDoororBootDoor,"QuarterPanel":QuarterPanel,"QuarterPanelLHS":QuarterPanelLHS,"QuarterPanelRHS":QuarterPanelRHS,
    "Fender":Fender,"FenderLHS":FenderLHS,"FenderRHS":FenderRHS,"Pillar":Pillar,"Apron":Apron,"Firewall":Firewall,"CowlTop":CowlTop,"UpperCrossMember":UpperCrossMember,"FrontShow":FrontShow,
    "LowerCrossMember":LowerCrossMember,"RadiatorSupport":RadiatorSupport,"RunningBorder":RunningBorder,"RunningBorderLHS":RunningBorderLHS,"RunningBorderRHS":RunningBorderRHS,"Door":Door,
    "DoorLHSFront":DoorLHSFront,"DoorLHSRear":DoorLHSRear,"DoorRHSFront":DoorRHSFront,"DoorRHSRear":DoorRHSRear,"BumperFront":BumperFront,"BumperRear":BumperRear,"WindshieldFront":WindshieldFront,
    "WindshieldBack":WindshieldBack,"LHSFogLight":LHSFogLight,"RHSFogLight":RHSFogLight,"LHSHeadlight":LHSHeadlight,"LHSTaillight":LHSTaillight,"RHSHeadlight":RHSHeadlight,"RHStaillight":RHStaillight,
    "ORVM":ORVM,"ORVMLHS":ORVMLHS,"ORVMRHS":ORVMRHS,"AlloyWheels":AlloyWheels,"Tyre":Tyre,"LHSFrontTyre":LHSFrontTyre,"RHSFrontTyre":RHSFrontTyre,"LHSRearTyre":LHSRearTyre,"RHSRearTyre":RHSRearTyre,
    "SpareTyre":SpareTyre,"rating":rating
  };

}