import 'package:flutter/material.dart';
import 'package:flutter_airplane/models/transaction_model.dart';
import 'package:flutter_airplane/shared/theme.dart';
import 'package:flutter_airplane/ui/widgets/booking_detail_item.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transactions;

  const TransactionCard(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE : Destination
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(transactions.destinations.imageUrl),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions.destinations.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      transactions.destinations.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 20,
                height: 20,
                margin: EdgeInsets.only(right: 1),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon_star.png'),
                  ),
                ),
              ),
              Text(
                transactions.destinations.rating.toString(),
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ],
          ),

          // NOTE : Booking Details Text
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),

          // NOTE : Booking Details Text
          BookingDetailItem(
            title: 'Traveler',
            valueText: '${transactions.amountOfTraveler} Person',
            valueColor: blackColor,
          ),
          BookingDetailItem(
            title: 'Seat',
            valueText: transactions.selectedSeats,
            valueColor: blackColor,
          ),
          BookingDetailItem(
            title: 'Insurance',
            valueText: transactions.insurance ? 'YES' : 'NO',
            valueColor: transactions.insurance ? greenColor : redColor,
          ),
          BookingDetailItem(
            title: 'Refundable',
            valueText: transactions.refundable ? 'YES' : 'NO',
            valueColor: transactions.refundable ? greenColor : redColor,
          ),
          BookingDetailItem(
            title: 'VAT',
            valueText: '${(transactions.vat * 100).toStringAsFixed(0)}%',
            valueColor: blackColor,
          ),
          BookingDetailItem(
            title: 'Price',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(
              transactions.price,
            ),
            valueColor: blackColor,
          ),
          BookingDetailItem(
            title: 'Grand Total',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(
              transactions.grandTotal,
            ),
            valueColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
