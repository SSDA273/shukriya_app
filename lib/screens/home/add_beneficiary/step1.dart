import 'package:flutter/material.dart';

class StepOneScreen extends StatefulWidget {
  const StepOneScreen({Key? key}) : super(key: key);

  @override
  State<StepOneScreen> createState() => _StepOneScreenState();
}

class _StepOneScreenState extends State<StepOneScreen> {
  int _activeStepIndex = 0;

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController pincode = TextEditingController();

  List<Step> stepList() => [
    Step(
      state: _activeStepIndex <= 0 ? StepState.indexed : StepState.complete,
      isActive: _activeStepIndex >= 0,
      title: const Text('Personal Info'),
      content: Container(
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: pass,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ],
        ),
      ),
    ),
    Step(
        state:
        _activeStepIndex <= 1 ? StepState.indexed : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: const Text('Bank Details'),
        content: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: address,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full House Address',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: pincode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pin Code',
                ),
              ),
            ],
          ),
        )),
    Step(
        state: _activeStepIndex <= 2 ? StepState.indexed : StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: const Text('Confirm'),
        content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name: ${name.text}'),
                Text('Email: ${email.text}'),
                const Text('Password: *****'),
                Text('Address : ${address.text}'),
                Text('PinCode : ${pincode.text}'),
              ],
            )))
  ];
  final List<String> titles = ["Personal Info", "Bank Details", "Confirmation"];
  int _curStep = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
// body: SafeArea(
//   child:   Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: StepProgressView(
//         width: MediaQuery.of(context).size.width,
//         curStep: _curStep,
//         color: Color(0xff50AC02),
//         titles: titles),
//   ),
// ),
// body: MyWidget(),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
physics: const ScrollPhysics(),
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            setState(() {
              _activeStepIndex += 1;
            });
          } else {
            print('Submited');
          }
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }

          setState(() {
            _activeStepIndex -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _activeStepIndex = index;
          });
        },
        controlsBuilder: (context, onStepContinue) {
          final isLastStep = _activeStepIndex == stepList().length - 1;
          return Container(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onStepContinue.onStepContinue,
                    child: (isLastStep)
                        ? const Text('Submit')
                        : const Text('Next'),
                  ),
                ),
                // const SizedBox(
                //   width: 10,
                // ),
                // if (_activeStepIndex > 0)
                //   Expanded(
                //     child: ElevatedButton(
                //       onPressed: onStepContinue.onStepCancel,
                //       child: const Text('Back'),
                //     ),
                //   )
              ],
            ),
          );
        },
      ),
    );
  }
}


class CustomStep {
  final String title;
  final Widget page;
  CustomStep(
      {required this.title, required this.page});
}


class MyWidget extends StatefulWidget {
  const MyWidget({ Key? key }) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ScrollController _scrollController = new ScrollController();
  static const double STEP_WIDTH = 90;
  PageController pageController = PageController();
  late List<CustomStep> stepsList;
  int currentPage=0;
  @override
  void initState() {
    super.initState();
    stepsList = [
      CustomStep(
        title: 'Personal Info',
        page: Placeholder(
          color: Colors.pink,
        ),
      ),
      CustomStep(
        title: 'Bank Details',
        page: Placeholder(
          color: Colors.deepPurple,
        ),
      ),
      CustomStep(
        title: 'Confirmation',
        page: Placeholder(
          color: Colors.deepPurple,
        ),
      ),
    ];
  }

  SizedBox buildStepDivider(int index) {
    return SizedBox(
      height: 90,
      child: Container(
        alignment: Alignment.topCenter,
        child: Transform.translate(
          offset: Offset(0, 16),
          child: Container(
            color: index < currentPage
                ? Theme.of(context).primaryColor
                : Colors.grey,
            width: 30,
            height: 3,
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }


  buildStep(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 90,
        width: STEP_WIDTH,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index <= currentPage
                    ? Theme.of(context).primaryColor
                    : Colors.grey[300],
              ),
              padding: EdgeInsets.all(10),
              child: Text((index + 1).toString()),
            ),
            Expanded(
                child: Text(
                  stepsList[index].title,
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }

  _buildStepper(int currentStep) {
    Future.delayed(
        Duration(milliseconds: 100),
            () => _scrollController.animateTo((STEP_WIDTH * currentStep).toDouble(),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut));
    return Center(
      child: SizedBox(
        height: 110,
        child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: stepsList.length,
            itemBuilder: (ctx, index) => index < stepsList.length - 1
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildStep(index),
                buildStepDivider(index)
              ],
            )
                :Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  buildStep(index)]) ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('hello'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildStepper(currentPage),
          Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemCount: stepsList.length,
                itemBuilder: (ctx, index) =>
                stepsList[index].page,
              )),
        ],
      ),
    );
  }

}


//sadasdsadj

class StepProgressView extends StatelessWidget {
  final double _width;

  final List<String> _titles;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = Colors.grey;
  final double lineWidth = 3.0;

  StepProgressView(
      {Key? key,
        required int curStep,
        required List<String> titles,
        required double width,
        required Color color})
      : _titles = titles,
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        assert(width > 0),
        super(key: key);

  Widget build(BuildContext context) {
    return Container(
        width: this._width,
        child: Column(
          children: <Widget>[
            Row(
              children: _iconViews(),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _titleViews(),
            ),
          ],
        ));
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, icon) {
      var circleColor = (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;
      var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;
      var iconColor = (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;

      list.add(
        Container(
          width: 20.0,
          height: 20.0,
          padding: EdgeInsets.all(0),
          decoration: new BoxDecoration(
            /* color: circleColor,*/
            borderRadius: new BorderRadius.all(new Radius.circular(22.0)),
            border: new Border.all(
              color: circleColor,
              width: 2.0,
            ),
          ),
          child: Icon(
            Icons.circle,
            color: iconColor,
            size: 12.0,
          ),
        ),
      );

      //line between icons
      if (i != _titles.length - 1) {
        list.add(Expanded(
            child: Container(
              height: lineWidth,
              color: lineColor,
            )));
      }
    });

    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, text) {
      list.add(Text(text, style: TextStyle(color: Colors.black)));
    });
    return list;
  }
}