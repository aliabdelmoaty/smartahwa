import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../models/drink_model.dart';
import '../models/order_model.dart';
import '../view_models/cubit/management_cubit.dart';
import 'widgets/drink_selection.dart';
import 'widgets/submit_button.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _customerNameController = TextEditingController();
  final _specialInstructionsController = TextEditingController();
  Drink? _selectedDrink;

  @override
  void dispose() {
    _customerNameController.dispose();
    _specialInstructionsController.dispose();
    super.dispose();
  }

  void _submitOrder() {
    if (_formKey.currentState!.validate() && _selectedDrink != null) {
      final order = OrderModel(
        id: const Uuid().v4(),
        customerName: _customerNameController.text.trim(),
        drink: _selectedDrink!,
        specialInstructions: _specialInstructionsController.text.trim(),
        status: OrderStatus.pending,
      );

      context.read<ManagementCubit>().setOrder(order);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Order added successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate back
      Navigator.of(context).pop();
    } else if (_selectedDrink == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a drink'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Order'),
        centerTitle: true,
        backgroundColor: Colors.brown.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Customer Name Field
              TextFormField(
                controller: _customerNameController,
                decoration: const InputDecoration(
                  labelText: 'Customer Name',
                  hintText: 'Enter customer name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter customer name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Drink Selection
              DrinkSelection(
                selectedDrink: _selectedDrink,
                onDrinkChanged: (Drink? drink) {
                  setState(() {
                    _selectedDrink = drink;
                  });
                },
              ),
              const SizedBox(height: 30),
              // Special Instructions Field
              TextFormField(
                controller: _specialInstructionsController,
                decoration: const InputDecoration(
                  labelText: 'Special Instructions',
                  hintText: 'e.g., "extra mint, ya rais", "no sugar", etc.',
                  prefixIcon: Icon(Icons.note),
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  // Special instructions are optional
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Submit Button
              SubmitButton(onPressed: _submitOrder),
            ],
          ),
        ),
      ),
    );
  }
}
