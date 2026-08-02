import 'package:dokan_khata_bd/app/router/app_routes.dart';
import 'package:dokan_khata_bd/core/services/local_storage_service.dart';
import 'package:dokan_khata_bd/core/utils/shop_validators.dart';
import 'package:dokan_khata_bd/features/shop/data/models/shop_model.dart';
import 'package:dokan_khata_bd/features/shop/data/services/shop_service.dart';
import 'package:dokan_khata_bd/shared/widgets/app_button.dart';
import 'package:dokan_khata_bd/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShopSetupPage extends StatefulWidget {
  const ShopSetupPage({super.key});

  @override
  State<ShopSetupPage> createState() => _ShopSetupPageState();
}

class _ShopSetupPageState extends State<ShopSetupPage> {
  final _formKey = GlobalKey<FormState>();

  final _shopNameController = TextEditingController();
  final _ownerNameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();

  String _businessType = "Grocery Shop";
  String _currency = "BDT";

  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadMobileNumber();
  }

  Future<void> _loadMobileNumber() async {
    final mobile = await LocalStorageService.getMobileNumber();

    _mobileController.text = mobile ?? "";

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _shopNameController.dispose();
    _ownerNameController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      final shop = ShopModel(
        shopName: _shopNameController.text.trim(),
        ownerName: _ownerNameController.text.trim(),
        mobileNumber: _mobileController.text.trim(),
        address: _addressController.text.trim(),
        businessType: _businessType,
        currency: _currency,
      );

      await ShopService.saveShop(shop);
      await LocalStorageService.setShopSetupCompleted(true);

      if (!mounted) return;

      context.go(AppRoutes.home);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to save shop: $e"),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Setup"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 20),

                const Icon(
                  Icons.store,
                  size: 70,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Setup Your Shop",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Let's personalize your grocery shop.",
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 35),

                AppTextField(
                  controller: _shopNameController,
                  labelText: "Shop Name",
                  hintText: "Rahman Store",
                  validator: ShopValidators.validateRequired,
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: _ownerNameController,
                  labelText: "Owner Name",
                  hintText: "Md. Rahman",
                  validator: ShopValidators.validateRequired,
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: _mobileController,
                  labelText: "Mobile Number",
                  hintText: "",
                  readOnly: true,
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: _addressController,
                  labelText: "Shop Address",
                  hintText: "Village / Road / Area",
                  maxLines: 3,
                  validator: ShopValidators.validateRequired,
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  value: _businessType,
                  decoration: const InputDecoration(
                    labelText: "Business Type",
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: "Grocery Shop",
                      child: Text("Grocery Shop"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _businessType = value!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  value: _currency,
                  decoration: const InputDecoration(
                    labelText: "Currency",
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: "BDT",
                      child: Text("BDT (৳)"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _currency = value!;
                    });
                  },
                ),

                const SizedBox(height: 35),

                AppButton(
                  text: "Continue",
                  isLoading: _isSaving,
                  onPressed: _isSaving ? null : _continue,
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}