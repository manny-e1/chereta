import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_cart/bloc/bid/bid_bloc.dart';
import 'package:shopping_cart/models/bid.model.dart';

class CustomBottomSheet extends StatefulWidget {
  final String itemID;

  const CustomBottomSheet({Key? key, required this.itemID}) : super(key: key);

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, dynamic> item = {};
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green[300]!),
                gapPadding: 5,
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green[300]!),
                gapPadding: 5,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green[300]!),
                gapPadding: 5,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                gapPadding: 5,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "John Doe",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter a name";
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      item["name"] = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Amount",
                    hintText: "100",
                    suffix: Text(
                      "ETH",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter a value";
                    }

                    if (double.tryParse(value ?? "") == null) {
                      return "Please enter a valid number";
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      item["amount"] = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final ImagePicker _picker = ImagePicker();
                      var file =
                          await _picker.pickImage(source: ImageSource.gallery);
                      print(file);
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size.fromHeight(60),
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.green,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      final ImagePicker _picker = ImagePicker();
                      setState(() async {
                        var file = await _picker.pickImage(
                            source: ImageSource.gallery);
                        item["avatar"] = file?.path;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.upload,
                          size: 24,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Upload image",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "Bid",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () async {
                    final form = formKey.currentState;
                    form?.save();
                    final newBid = Bid(bidder: {
                      "name": item["name"],
                      "avatar": item["avatar"],
                    }, amount: int.parse(item["amount"]));

                    BlocProvider.of<BidBloc>(context)
                        .add(PlaceBid(bid: newBid, itemID: this.widget.itemID));
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
