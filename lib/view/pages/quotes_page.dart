import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/quote.dart';
import '../../utils/constants.dart';
import '../../view_model/quotes_view_model.dart';

class QuotesPage extends StatefulWidget {
  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildConsumer(),
    );
  }

  Consumer<QuoteViewModel> _buildConsumer() {
    return Consumer<QuoteViewModel>(
      builder: (context, model, child) {
        if (model.quoteState == QuoteState.INITIAL) {
          return _buildInitial();
        } else if (model.quoteState == QuoteState.LOADING) {
          return _buildLoading();
        } else {
          return _buildSuccess(model.quotesList);
        }
      },
    );
  }

  Center _buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Constants.JapaneseLaurel),
      ),
    );
  }

  Center _buildInitial() {
    return Center(
      child: Text('Initial'),
    );
  }

  Padding _buildSuccess(List<Quote> _quotesList) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemCount: _quotesList.length,
        itemBuilder: (context, index) {
          Quote _quote = _quotesList[index];
          return _buildQuoteCard(_quote);
        },
      ),
    );
  }

  Container _buildQuoteCard(Quote _quote) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
      height: 100,
      child: Column(
        children: [
          _buildQuoteText(
            _quote.quote,
          ),
          _buildAuthor(_quote.author),
        ],
      ),
    );
  }

  Expanded _buildQuoteText(String text) {
    return Expanded(
        flex: 2,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ));
  }

  Expanded _buildAuthor(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text("- " + text),
        ),
      ),
    );
  }
}
