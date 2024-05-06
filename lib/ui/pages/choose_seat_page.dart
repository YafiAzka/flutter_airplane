import 'package:flutter/material.dart';
import 'package:flutter_airplane/cubit/seat_cubit.dart';
import 'package:flutter_airplane/models/destination_model.dart';
import 'package:flutter_airplane/models/transaction_model.dart';
import 'package:flutter_airplane/shared/theme.dart';
import 'package:flutter_airplane/ui/pages/checkout_page.dart';
import 'package:flutter_airplane/ui/widgets/custom_button.dart';
import 'package:flutter_airplane/ui/widgets/seat_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destinations;

  const ChooseSeatPage(this.destinations, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            // NOTE : Available
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_available.png'),
                ),
              ),
            ),
            Text(
              'Available',
              style: blackTextStyle,
            ),
            SizedBox(width: 10),

            // NOTE : Selected
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_selected.png'),
                ),
              ),
            ),
            Text(
              'Selected',
              style: blackTextStyle,
            ),
            SizedBox(width: 10),

            // NOTE : Unavailable
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_unavailable.png'),
                ),
              ),
            ),
            Text(
              'Unavailable',
              style: blackTextStyle,
            ),
            SizedBox(width: 10),
          ],
        ),
      );
    }

    Widget seatSelect() {
      Widget seatAlfabet(String text) {
        return Container(
          width: 48,
          height: 48,
          child: Center(
            child: Text(
              text,
              style: greyTextStyle.copyWith(fontSize: 16),
            ),
          ),
        );
      }

      Widget seatRowNumber(String text) {
        return Container(
          width: 48,
          height: 48,
          child: Center(
            child: Text(
              text,
              style: greyTextStyle.copyWith(fontSize: 16),
            ),
          ),
        );
      }

      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: 30,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                // NOTE : Seat Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    seatAlfabet('A'),
                    seatAlfabet('B'),
                    seatAlfabet(''),
                    seatAlfabet('C'),
                    seatAlfabet('D'),
                  ],
                ),

                // NOTE : Seat 1
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A1', isAvailable: false),
                      SeatItem(id: 'B1', isAvailable: false),
                      seatRowNumber('1'),
                      SeatItem(id: 'C1'),
                      SeatItem(id: 'D1'),
                    ],
                  ),
                ),

                // NOTE : Seat 2
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A2'),
                      SeatItem(id: 'B2'),
                      seatRowNumber('2'),
                      SeatItem(id: 'C2'),
                      SeatItem(id: 'D2'),
                    ],
                  ),
                ),

                // NOTE : Seat 3
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A3'),
                      SeatItem(
                        id: 'B3',
                      ),
                      seatRowNumber('3'),
                      SeatItem(id: 'C3'),
                      SeatItem(id: 'D3'),
                    ],
                  ),
                ),

                // NOTE : Seat 4
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A4'),
                      SeatItem(id: 'B4'),
                      seatRowNumber('4'),
                      SeatItem(id: 'C4'),
                      SeatItem(id: 'D4'),
                    ],
                  ),
                ),

                // NOTE : Seat 5
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A5'),
                      SeatItem(id: 'B5'),
                      seatRowNumber('5'),
                      SeatItem(id: 'C5'),
                      SeatItem(id: 'D5'),
                    ],
                  ),
                ),

                // NOTE : Your Seat
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Seat',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        state.join(', '),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),

                // NOTE : Total
                Container(
                  margin: EdgeInsets.only(top: 16),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(
                          state.length * destinations.price,
                        ),
                        style: purpleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget buttonCheckout() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
            title: 'Continue To Checkout',
            margin: EdgeInsets.only(top: 30, bottom: 46),
            onPressed: () {
              int price = destinations.price * state.length;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    TransactionModel(
                      destinations: destinations,
                      amountOfTraveler: state.length,
                      selectedSeats: state.join(', '),
                      insurance: true,
                      refundable: false,
                      vat: 0.45,
                      price: price,
                      grandTotal: price + (price * 0.45).toInt(),
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          title(),
          seatStatus(),
          seatSelect(),
          buttonCheckout(),
        ],
      ),
    );
  }
}
