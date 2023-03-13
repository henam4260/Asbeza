import 'package:flutter/material.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:flutter/services.dart';
class Profilepage extends StatefulWidget {
   const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  @override
  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }

  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    try {
      _mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get phone number due to '${e.message}'");
    }
    if (!mounted) return;

    setState(() {});
  }

  Widget fillCards() {
    List<Widget> widgets = _simCard
        .map((SimCard sim) => Text(
            'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
        .toList();
    return Column(children: widgets);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        
        iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 0, 0, 0), //change your color here
  ),
        title: const Text('Asbeza', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255)
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(170, 40, 0, 0),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
              ),
              child: const Icon(Icons.person, size: 80, color: Color.fromARGB(255, 0, 0, 0),),),
            
          ),
          const Padding(
            padding:  EdgeInsets.fromLTRB(20,80,0,0),
            child: Text('Name: Mr. XXXXX',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0)),),
          ),
         
           const Padding(
            padding:  EdgeInsets.fromLTRB(20,50,0,0),
            child: Text('Email: X1XX352@gmail.com',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0)),),
          ),
          
            Padding(
            padding:  const EdgeInsets.fromLTRB(20,50,0,0),
            child: Text("Phone No_:  +$_mobileNumber",style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0)),)
          ),
          

        ],
      ),
        
    );
  }
}