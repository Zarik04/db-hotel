import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/api/providers/user_provider.dart';
import 'package:flutter_hotel_reservation_system/api/reservation.dart';
import 'package:flutter_hotel_reservation_system/models/guest.dart';
import 'package:flutter_hotel_reservation_system/models/room.dart';
import 'package:provider/provider.dart';

import 'booking_detail.dart';

class PaymentScreen extends StatefulWidget {
  Rooms? room;
  final String roomType;
  final List<String> roomImages;
  final double roomPrice;

  PaymentScreen(
      {super.key,
      this.room,
      required this.roomType,
      required this.roomImages,
      required this.roomPrice});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Room Type: ${widget.roomType}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 100.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.roomImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 150.0,
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.roomImages[index]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Payment Amount',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Amount',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _handlePayment(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Proceed to Payment',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handlePayment(BuildContext context) async {
    double amount = double.tryParse(_amountController.text) ?? 0.0;

    if (amount == widget.roomPrice) {
      var rng = Random();
      int randomNumber = rng.nextInt(900000) + 100000;  // Generates a random integer between 100000 and 999999
      String invoiceNumber = 'INV$randomNumber';
      Map<String, dynamic> paymentData = {
        "amount": amount,
        "payment_method": "cash",
        "invoice_number": invoiceNumber,
        "status": false,
        "payment_date": "2024-01-25",
        "description": "Just test payment"
      };
      var response = await ReservationAPI.makePayment(paymentData);
      print(response);
      DateTime now = DateTime.now();
      final Guest guest = Provider.of<UserProvider>(context, listen: false).user;
      Map<String, dynamic> reservationData = {
        "guest_id": guest.uid,
        "chain_id": widget.room?.chainId,
        "hotel_id": widget.room?.hotelId,
        "room_no": widget.room?.roomNo,
        "check_in_date": "${now.year}-${now.month}-${now.day}",
        "payment_id": response['payment_id']
      };
      var res = await ReservationAPI.makeReservation(reservationData);
      print(res);
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment Result'),
          content: Text(amount == widget.roomPrice
              ? 'Payment Successful\nAmount: \$${amount.toStringAsFixed(2)}'
              : 'Invalid Amount. Please enter a valid amount.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (amount == widget.roomPrice) {
                  _showBookingDetails(context, amount);
                }
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showBookingDetails(BuildContext context, double amountPaid) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingDetailsScreen(
          roomType: widget.roomType,
          roomImages: widget.roomImages,
          amountPaid: amountPaid,
        ),
      ),
    );
  }
}
