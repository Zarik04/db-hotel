import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/api/auth.dart';
import 'package:flutter_hotel_reservation_system/models/guest.dart';
import 'package:flutter_hotel_reservation_system/screens/login_page.dart';
import 'package:flutter_hotel_reservation_system/widget_items/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime? _selectedDate;
  static const MaterialColor mainThemeColor = Colors.green;
  final _formKey = GlobalKey<FormState>();
  String message = '';
  MaterialColor messageColor = Colors.red;

  Guest guest = Guest(
    firstName: '',
    lastName: '',
    gender: '',
    email: '',
    passportNumber: '',
    birthDate: '',
    phone: '',
    password: '',
    address: '',
    city: '',
    state: '',
    country: '',
  );

  String _gender = '';

  String? _validateGender(String value) {
    if (value.isEmpty) {
      return 'Please select a gender';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Registration',
                      style: TextStyle(
                          color: mainThemeColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  CustomTextField(
                    hintText: 'First Name',
                    icon: Icons.person_2_rounded,
                    color: mainThemeColor,
                    validatorFunc: (val) {
                      val = val!.trim();
                      if (val == null || val.isEmpty) {
                        return 'Please enter the first name';
                      } else {
                        return null;
                      }
                    },
                    changedFunc: (String? val) {
                      setState(() {
                        guest.firstName = val!;
                      });
                    },
                    obscureText: false,
                  ),
                  CustomTextField(
                    hintText: 'Last Name',
                    icon: Icons.person_2_rounded,
                    color: mainThemeColor,
                    validatorFunc: (val) {
                      val = val!.trim();
                      if (val == null || val.isEmpty) {
                        return 'Please enter the last name';
                      } else {
                        return null;
                      }
                    },
                    changedFunc: (String? val) {
                      setState(() {
                        guest.lastName = val!;
                      });
                    },
                    obscureText: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        const Text(
                          'Gender:',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            // fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio<String>(
                              value: 'M',
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value!;
                                  guest.gender = value;
                                });
                              },
                              activeColor: mainThemeColor,
                            ),
                            const Text('Male'),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio<String>(
                              value: 'F',
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value!;
                                  guest.gender = value;
                                });
                              },
                              activeColor: mainThemeColor,
                            ),
                            const Text('Female'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomTextField(
                    hintText: 'Contact Number',
                    icon: Icons.phone,
                    color: mainThemeColor,
                    validatorFunc: (val) {
                      Pattern pattern = r'^\d{1,15}$';
                      RegExp regex = RegExp(pattern as String);
                      if (!regex.hasMatch(val!)) {
                        val = val.trim();
                        return 'Enter valid phone number';
                      } else {
                        return null;
                      }
                    },
                    changedFunc: (String? val) {
                      guest.phone = val!;
                    },
                    obscureText: false,
                  ),
                  CustomTextField(
                    hintText: 'Passport No',
                    icon: Icons.document_scanner_rounded,
                    color: mainThemeColor,
                    validatorFunc: (String? val) {
                      val = val!.trim();
                      if (val.isEmpty || val == null) {
                        return 'Please enter the passport no';
                      }
                      return null;
                    },
                    changedFunc: (String? val) {
                      setState(() {
                        guest.passportNumber = val!;
                      });
                    },
                    obscureText: false,
                  ),
                  CustomTextField(
                    hintText: 'Email Address',
                    icon: Icons.mail,
                    color: mainThemeColor,
                    validatorFunc: (String? val) {
                      Pattern pattern =
                          r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                      RegExp regex = RegExp(pattern as String);
                      if (!regex.hasMatch(val!)) {
                        return 'Enter valid email';
                      } else {
                        return null;
                      }
                    },
                    changedFunc: (String? val) {
                      guest.email = val!;
                    },
                    obscureText: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 25.0),
                    child: InkWell(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate ?? DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          if (DateTime.now().difference(picked).inDays / 365 <
                              18) {
                            // The user is not 18 years old yet
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'You must be at least 18 years old.')),
                            );
                          } else {
                            setState(() {
                              _selectedDate = picked;
                              guest.birthDate = "${picked.toLocal()}"
                                  .split(' ')[0]; // Only assign the date part
                            });
                          }
                        }
                      },
                      child: InputDecorator(
                        decoration: InputDecoration(
                          hintText: 'Date of Birth',
                          prefixIcon: const Icon(
                            Icons.calendar_today,
                            color: mainThemeColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: _selectedDate != null
                            ? Text(
                                "${_selectedDate!.toLocal()}".split(' ')[0],
                                style: const TextStyle(fontSize: 16),
                              )
                            : const Text(
                                'Select Birth Date',
                                style: TextStyle(fontSize: 16),
                              ),
                      ),
                    ),
                  ),
                  CustomTextField(
                    hintText: 'Password',
                    icon: Icons.lock,
                    color: mainThemeColor,
                    validatorFunc: (String? val) {
                      val = val!.trim();
                      if (val == null || val.isEmpty) {
                        return 'Please enter your password';
                      } else if (val.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                    changedFunc: (String? val) {
                      guest.password = val!;
                    },
                    obscureText: true,
                  ),
                  CustomTextField(
                    hintText: 'Address',
                    icon: Icons.add_location_rounded,
                    color: mainThemeColor,
                    validatorFunc: (val) {
                      val = val!.trim();
                      if (val == null || val.isEmpty) {
                        return 'Please enter the address';
                      } else {
                        return null;
                      }
                    },
                    changedFunc: (String? val) {
                      guest.address = val!;
                    },
                    obscureText: false,
                  ),
                  CustomTextField(
                    hintText: 'City',
                    icon: Icons.location_city_rounded,
                    color: mainThemeColor,
                    validatorFunc: (val) {
                      val = val!.trim();
                      if (val == null || val.isEmpty) {
                        return 'Please enter the city';
                      } else {
                        return null;
                      }
                    },
                    changedFunc: (String? val) {
                      guest.city = val!;
                    },
                    obscureText: false,
                  ),
                  CustomTextField(
                    hintText: 'State',
                    icon: Icons.location_city_outlined,
                    color: mainThemeColor,
                    validatorFunc: (val) {
                      val = val!.trim();
                      if (val == null || val.isEmpty) {
                        return 'Please enter the state';
                      } else {
                        return null;
                      }
                    },
                    changedFunc: (String? val) {
                      guest.state = val!;
                    },
                    obscureText: false,
                  ),
                  CustomTextField(
                    hintText: 'Country',
                    icon: Icons.flag_circle_rounded,
                    color: mainThemeColor,
                    validatorFunc: (val) {
                      val = val!.trim();
                      if (val == null || val.isEmpty) {
                        return 'Please enter the country';
                      } else {
                        return null;
                      }
                    },
                    changedFunc: (String? val) {
                      guest.country = val!;
                    },
                    obscureText: false,
                  ),
                  CustomTextField(
                    hintText: 'Zip Code',
                    icon: Icons.signpost_outlined,
                    color: mainThemeColor,
                    validatorFunc: null,
                    changedFunc: (String? val) {
                      guest.zipCode = val!;
                    },
                    obscureText: false,
                  ),
                  CustomTextField(
                    hintText: 'Nationality',
                    icon: Icons.perm_identity_rounded,
                    color: mainThemeColor,
                    validatorFunc: null,
                    changedFunc: (String? val) {
                      guest.nationality = val!;
                    },
                    obscureText: false,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: messageColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account ?',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                Colors.transparent), // To remove after effects
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: ElevatedButton(
                      onPressed: _selectedDate != null
                          ? () async {
                              if (_formKey.currentState!.validate()) {
                                String? validationMessage =
                                    _validateGender(_gender);
                                if (validationMessage != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(validationMessage)),
                                  );
                                } else {
                                  var response =
                                      await AuthService.signUpUser(user: guest);
                                  if (response != null) {
                                    setState(() {
                                      message = "Successfully registered !";
                                      messageColor = Colors.green;
                                    });
                                  } else {
                                    setState(() {
                                      message = "Something went wrong !";
                                      messageColor = Colors.red;
                                    });
                                  }

                                }
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: mainThemeColor, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 13.0, horizontal: 30.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: mainThemeColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
