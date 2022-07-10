import 'package:clinic_app/Screens/appointment_screen.dart';
import 'package:clinic_app/Screens/bmi_screen.dart';
import 'package:clinic_app/Screens/dietlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

class Main_Screen_User extends StatefulWidget {

  @override
  State<Main_Screen_User> createState() => _Main_Screen_UserState();
}

class _Main_Screen_UserState extends State<Main_Screen_User> {
  int steps = 0;
  double age = 0;
  double weight = 0;
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        toolbarHeight: 40.00,
      ),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    child: Text(weight.toString()),
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                  SizedBox(),
                  CircleAvatar(
                    child: Text("Stats Circle"),
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                  SizedBox(),
                  CircleAvatar(
                    child: Text(bmi.toString()),
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                  SizedBox(),
                  CircleAvatar(
                    child: Text(steps.toString()),
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                ],
              ),
              SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Card(
                        child: InkWell(
                          child: SizedBox(
                            width: 84,
                            height: 42,
                            child: Center(child: Text('Elevated Card')),
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Appointment_Screen()),);
                          },
                        ),
                      ),
                      Card(
                        child: InkWell(
                          child: SizedBox(
                            width: 84,
                            height: 42,
                            child: Center(child: Text('Elevated Card')),
                          ),
                          onTap: () async {
                            steps = (await getHealthStats())!;
                          },
                        ),
                      ),
                      Card(
                        child: SizedBox(
                          width: 84,
                          height: 42,
                          child: Center(child: Text('Elevated Card')),
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://previews.123rf.com/images/irwanjos/irwanjos1406/irwanjos140600033/29315482-nettes-eichhörnchen-cartoon.jpg"
                    ),

                    radius: 80,

                  ),
                  Column(
                  children: [
                    Card(
                      child: SizedBox(
                        width: 84,
                        height: 42,
                        child: Center(child: Text('Elevated Card')),
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        width: 84,
                        height: 42,
                        child: Center(child: Text('Elevated Card')),
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        width: 84,
                        height: 42,
                        child: Center(child: Text('Elevated Card')),
                      ),
                    ),
                  ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DietList_Screen()),);
                      },
                      child: SizedBox(
                        width: 133,
                        height: 138,
                        child: Text('Pressable Card'),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 138,
                  ),
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Bmi_Screen()),);
                      },
                      child: SizedBox(
                        width: 133,
                        height: 138,
                        child: Text('Pressable Card'),
                      ),
                    ),
                  ),
                ],
              )
            ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
}

Future<int?> getHealthStats() async {
  // create a HealthFactory for use in the app
  HealthFactory health = HealthFactory();

  // define the types to get
  var types = [
    HealthDataType.STEPS,
    HealthDataType.WEIGHT,
    HealthDataType.HEIGHT,
    HealthDataType.BLOOD_GLUCOSE,
  ];

  // requesting access to the data types before reading them
  bool requested = await health.requestAuthorization(types);

  var now = DateTime.now();

  // fetch health data from the last 24 hours
  List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
      now.subtract(Duration(days: 1)), now, types);

  // request permissions to write steps and blood glucose
  types = [HealthDataType.STEPS, HealthDataType.BLOOD_GLUCOSE];
  var permissions = [
    HealthDataAccess.READ_WRITE,
    HealthDataAccess.READ_WRITE
  ];
  await health.requestAuthorization(types, permissions: permissions);

  // write steps and blood glucose
  bool success = await health.writeHealthData(10, HealthDataType.STEPS, now, now);
  success = await health.writeHealthData(3.1, HealthDataType.BLOOD_GLUCOSE, now, now);

  // get the number of steps for today
  var midnight = DateTime(now.year, now.month, now.day);
  int? steps = await health.getTotalStepsInInterval(midnight, now);
  print(steps);
  return steps;
}