import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:flutter/material.dart';
import 'adaptative_text_field.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key, required this.onSubmit}) : super(key: key);

  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransactionForm> createState() {
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TransactionForm oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  _submitForm() {
    print("${_titleController.text} | ${_valueController.text}");

    final title = _titleController.text;
    final value = double.parse(_valueController.text);

    if (title.isEmpty || value <= 0 || selectedDate == null) return;

    widget.onSubmit(title, value, selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              AdaptativeTextField(
                  label: "Titulo",
                  onSubmitted: (_) => _submitForm,
                  controller: _titleController),
              AdaptativeTextField(
                  label: "Valor(R\$)",
                  onSubmitted: (_) => _submitForm,
                  controller: _valueController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true)),
              AdaptativeDatePicker(
                  selectedDate: selectedDate,
                  onDateChange: (newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                      label: "Nova Transação", onPressed: _submitForm)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
