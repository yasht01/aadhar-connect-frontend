import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:sih_frontend/presentation/routes/app_routes.gr.dart';

class AddressSheet extends StatefulWidget {
  String? address;
  AddressSheet({Key? key, this.address}) : super(key: key);

  @override
  _AddressSheetState createState() => _AddressSheetState();
}

class _AddressSheetState extends State<AddressSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.25,
        maxWidth: MediaQuery.of(context).size.width,
        minHeight: MediaQuery.of(context).size.height * 0.10,
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            scrollPadding:
                EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 2),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                gapPadding: 5,
              ),
            ),
            initialValue: widget.address,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            // TODO: Change Route for Resident and Operator (Using operator for testing)
            context.router.push(OperatorHomeRoute());
          },
          child: const Text(
            'Submit',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.teal),
          ),
        )
      ]),
    );
    ;
  }
}
