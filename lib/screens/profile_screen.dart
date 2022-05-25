import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final _passwordForm = GlobalKey<FormState>();
  var _validPassword = false;
  var _isSubmitPwdClicked = false;

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();


  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  var dummyCardDetails = [
    {
      'cardNo': '**** **** **** 8099',
      'expDate': '05/2028',
      'type': 'VISA',
      'isSelected': true
    },
    {
      'cardNo': '**** **** **** 7765',
      'expDate': '09/2028',
      'type': 'MASTER',
      'isSelected': false
    },
    // {
    //   'cardNo': '**** **** **** 7765',
    //   'expDate': '09/2028',
    //   'type': 'MASTER',
    //   'isSelected': false
    // },    {
    //   'cardNo': '**** **** **** 7765',
    //   'expDate': '09/2028',
    //   'type': 'MASTER',
    //   'isSelected': true
    // }
  ];

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          // Back button click action
                        },
                        color: Colors.white,
                        iconSize: 35,
                      ),
                      Image.asset(
                        'images/logo.png',
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                // color: Colors.green,
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      // color: Colors.red,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(110.0),
                        child: Image.asset(
                          'images/profile_image.jpg',
                          fit: BoxFit.cover,
                          height: 110,
                          width: 110,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 5, right: 5),
                      // color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'First & Last name',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Email Address',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Phone Number',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.blue,
                        alignment: Alignment.topRight,
                        // color: Colors.blue,
                        child: IconButton(
                          icon: Image.asset(
                            'images/edit_document.png',
                            color: Colors.white,
                            height: 30,
                            width: 30,
                          ),
                          onPressed: () {
                            //                  Edit button click action
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                margin: const EdgeInsets.only(bottom: 5),
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  child: const Text(
                    'My Info',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    //My Info button click action to be added.
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      primary: Colors.white,
                      onPrimary: Colors.black),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                child: _myInfoArea(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myInfoArea() {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        padding: const EdgeInsets.only(bottom: 30),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _addressSection(),
            _paymentSection(),
            _passwordSection(),
            _bottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _addressSection() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      // height: 160,
      margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Text(
                'Your Address',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2),
              ),
              const SizedBox(
                width: 50,
              ),
              IconButton(
                icon: Image.asset(
                  'images/edit_document.png',
                  color: Colors.black,
                  height: 25,
                  width: 25,
                ),
                onPressed: () {
                  //                  Edit button click action
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Shipping Address',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 12),
                    alignment: Alignment.topLeft,
                    width: 150,
                    child: const Text(
                      '1500 E Riverside DR Austin, Texas 78724 USA',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Billing Address',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 12),
                    alignment: Alignment.topLeft,
                    width: 150,
                    child: const Text(
                      'PO Box 7401 Austin,Texas 78724 USA',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _paymentSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      // height: 230,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: const <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(
                'Payment details',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              SizedBox(
                width: 30,
              ),
              Text(
                'Card Number',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                'Expiry Date',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            // height: 150,
            // child: LimitedBox(
            // maxHeight: 200,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dummyCardDetails.length,
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2),
                        width: 35,
                        height: 20,
                        decoration: BoxDecoration(border: Border.all(width: 2)),
                        child: FittedBox(
                          child: Text(
                            dummyCardDetails[index]['type'] as String,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        dummyCardDetails[index]['cardNo'] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        dummyCardDetails[index]['expDate'] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      (dummyCardDetails[index]['isSelected'] as bool)
                          ? const Icon(
                              Icons.done,
                              size: 22,
                            )
                          : const SizedBox(
                              width: 22,
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Image.asset(
                          'images/edit_document.png',
                          height: 22,
                          width: 22,
                        ),
                        onPressed: () {
                          //                 card edit button function click
                        },
                      )
                    ],
                  ),
                  const DottedLine()
                ],
              ),
            ),
            // ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  width: 30,
                ),
                const Icon(Icons.add),
                GestureDetector(
                  child: const Text(
                    'Add New Payment Method',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _submitPasswordClicked() {
    final isValid = _passwordForm.currentState?.validate();
    if (!isValid!) {
      setState(() {
        _isSubmitPwdClicked = true;
        _validPassword = false;
      });
      return;
    }
    else{
      setState(() {
        _isSubmitPwdClicked = true;
        _validPassword = true;
        _oldPasswordController.clear();
        _newPasswordController.clear();
        _confirmPasswordController.clear();
      });
    }
  }

  Widget _passwordSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: const <Widget>[
              Text(
                'Reset Password',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: const <Widget>[
              Text(
                'User id',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2),
              ),
              Text(
                ' : ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' primary email@gmail.com',
                style: TextStyle(fontSize: 15, decorationThickness: 2),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            child: Form(
              key: _passwordForm,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _oldPasswordController,
                    decoration: const InputDecoration(
                      errorMaxLines: 2,
                        hintText: 'old password',
                        hintStyle: TextStyle(color: Colors.black54)),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Please enter a password';
                      }
                      if (value.length <6 || value.length > 20){
                        return 'Password length should be between 6-20 characters';
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: _newPasswordController,
                    decoration: const InputDecoration(
                        errorMaxLines: 2,
                        hintText: 'new password',
                        hintStyle: TextStyle(color: Colors.black54)),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Please enter a password';
                      }
                      if (value.length <6 || value.length > 20){
                        return 'Password length should be between 6-20 characters';
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                        errorMaxLines: 2,
                        hintText: 'confirm password',
                        hintStyle: TextStyle(color: Colors.black54)),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Please enter a password';
                      }
                      if (value.length <6 || value.length > 20){
                        return 'Password length should be between 6-20 characters';
                      }
                      if (value != _newPasswordController.text){
                        return 'Confirm password doesn\'t match with New password. Try again!';
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      shadowColor: Colors.black,
                    ),
                    onPressed: (_oldPasswordController.text.isNotEmpty ||
                        _newPasswordController.text.isNotEmpty ||
                        _confirmPasswordController.text.isNotEmpty) ? _submitPasswordClicked : (){},
                  ),
                   Visibility(
                    visible: _isSubmitPwdClicked,
                    child: _validPassword ? const Text(
                      'Your password has been reset successfully!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 16),
                    ) : const Text(
                      'Password reset failed. Please try again!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextButton(
            child: const Text(
              'Adding Secondary Email',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5),
            ),
            onPressed: () {
              //          add secondary email button click
            },
          ),
          TextButton(
            child: const Text(
              'Billing History',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5),
            ),
            onPressed: () {
              //          billing history button click
            },
          ),
          TextButton(
            child: const Text(
              'Manage Internet Connectivity',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5),
            ),
            onPressed: () {
              //          manage internet history button click
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(46, 56, 66, 0.7),
      body: _buildBody(context),
    );
  }
}
