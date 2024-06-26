import 'package:flutter/material.dart';
import 'package:flutter_airplane/cubit/transaction_cubit.dart';
import 'package:flutter_airplane/shared/theme.dart';
import 'package:flutter_airplane/ui/widgets/transaction_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.length == 0) {
            return Center(
              child: Text('Tidak Ada Transaksi'),
            );
          } else {
            return ListView.builder(
                itemCount: state.transactions.length,
                padding: EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: 100,
                ),
                itemBuilder: (context, index) {
                  return TransactionCard(
                    state.transactions[index],
                  );
                });
          }
        }

        return Center();
      },
    );
  }
}
