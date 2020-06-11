import 'package:flutter/material.dart';

const ksendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kmessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type Your Message Here...',
  border: InputBorder.none,
);

const kmessageContainerDecoratoion = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.redAccent, width: 2.0),
  ),
);

const kTextFiledFieldDecoration = InputDecoration(
//  hintStyle: TextStyle(color: Colors.grey),
  hintText: 'Enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.redAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final kTextFormDecoration = BoxDecoration(
  border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid),
);

const kfeedTextContainerDecoration = InputDecoration(
//  hintStyle: TextStyle(color: Colors.grey),
  hintText: 'Enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.redAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

ShapeBorder kBackButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

Widget kBackBtn = Icon(
  Icons.arrow_back_ios,
  // color: Colors.black54,
);


const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0xFF111328);
const kBottomContainerColour = Color(0xFFEB1555);
const kTextFiledColor = Color(0xFF8D8E98);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.grey,
);

const kTitleHeadingTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.redAccent,

);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kTeacherHeadingStyle = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const kTeachersBranchStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w500,
  color: Colors.grey,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);

const Kbranch = '''
[
    
        "Wadgaon Sheri","Hadapsar", "Fursungi", "Rahatni", "Kesnand"
    
]
    ''';

const KstudentStd = '''
[
    
        "Play Group","Nursery", "L.K.G", "U.K.G"
    
]
    ''';




const teachersPostData = '''
[
    
        "In Training","Temporary", "Assistant Teacher","Junior Teacher", "Senior Teacher","Head Teacher", "Co-ordinator",
        "Admin","Manager"
    
]
    ''';


// Constant
String kuid = 'uid';
String kstudentsId = 'studentsId';
String ksDocName = 'docName';
String kcurrentDataId = 'currentDataId';
String kpnrNumber = 'pnrNumber';
String kformNumber = 'formNumber';
String kAcademicYear = 'academicYear';
String kfeeReciptNumber = 'feeReciptNumber';
String kisActive = 'isActive';
String kbranch = 'branch';
String ksfirstName = 'firstName';
String ksmiddleName = 'middleName';
String kslastName = 'lastName';
String kmothersName = 'mothersName';
String kgender = 'gender';
String kdateOfBirth = 'dateOfBirth';
String kcurrentStandard = 'currentStandard';
String kaddress = 'address';
String kfathersFullName = 'fathersFullName';
String kfathersEducation = 'fathersEducation';
String kfathersOfficeAddress = 'fathersOfficeAddress';
String kfathersPhoneNumber = 'fatherPhoneNumber';
String kmothersFullName = 'mothersFullName';
String kmothersEducation = 'motherEducation';
String kmothersOfficeAddress = 'mothersOfficeAddress';
String kmothersPhoneNumber = 'mothersPhoneNumber';
String kguardiansName = 'guardiansName';
String kguardiansAddress = 'guardiansAddress';
String kguardiansPhoneNumber = 'guardiansPhoneNumber';
String ktotalFees = 'totalFees';
String kfeesPaid = 'feesPaid';
String kfeesRemaining = 'feesRemaining';
String kinstallmentPaid = 'installmentPaid';
String kinstallmentRemaining = 'installmentRemaining';
String kimmergencyContact = 'imergencyContact';
String kimpNote = 'impNote';
String kstudentsPhotoUrl = 'sPhotoUrl';
String kstudentsMothersPhotoUrl = 'sMothersPhotoUrl';
String kstudentsFathersPhotoUrl = 'sFathersPhotoUrl';
String kbirthCertiUrl = 'sbirthCertiURl';
String kaddressProfUrl = 'sAddressUrl';
String kstudentsDocument1Url = 'sOtherDocUrl';
String kyears = 'years';
String kdateOfJoiningSchool = 'dateOfJoiningSchool';
String kStudentPushID = 'pushids';

String kteachersBranch = 'branch';
String kteachersFirstName = 'teachersFirstName';
String kteachersMiddleName = "teachersMiddleName";
String kteachersLastName = "teachersLastName";
String kteacherGender = "gender";
String kteachersFormNumber = 'formNumber';
String kteachersPhoneNumber = 'phoneNumber';
String kteachersAddress = 'address';
String kteachersSalary = 'salary';
String kteachersBirthDate = 'dateOfBirth';
String kteachersDateOfJoining = "dateOfJoining";
String kteachersPhotoUrl = "PhotoUrl";
String kteachersMarkSheetUrl = "markSheetUrl";
String kteachersIdURl = "idUrl";
String kteachersOtherDocs = "otherDocs";
String kteachersEducation = 'education';
String kteachersExperience = 'experience';
String kteachersPost = 'post';
String kteachersPushId = 'pushID';
String kteachersmaratialStatus = 'maratialStatus';
String kteacherDocName = 'docName';


int kPlayGroupFees = 11000;
int kNurseryFees = 14500;
int kLKGfees = 16000;
int kUKG = 17000;

int kplayGroupInstallment1 = 6000;
int kplayGroupInstallment2 = 2500;
int kPlayGroupInstallment3 = 2500;

int kNurseryInstallment1 = 7000;
int kNurseryInstallment2 = 3500;
int kNurseryInstallment3 = 3500;

int kLKGInstallment1 = 7000;
int kLKGInstallment2 = 3500;
int kLKGInstallment3 = 3500;

int kUKGInstallment1 = 7000;
int kUKGInstallment2 = 3500;
int kUKGInstallment3 = 4500;

String kwadgaonSheri = 'Wadgaon Sheri';
String khadapsar = 'Hadapsar';
String kfursungi = 'Fursungi';
String kKesnand = 'Kesnand';
String kRahatni = 'Rahatni';

