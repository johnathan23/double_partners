import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:double_partners/core/domain/models/address_model.dart';
import 'package:double_partners/l10n/app_localizations.dart';
import 'package:double_partners/share/helpers/validations/validations_helper.dart';
import 'package:double_partners/share/providers/firestore_provider.dart';
import 'package:double_partners/share/widgets/custom_app_bar.dart';
import 'package:double_partners/share/widgets/custom_text_form_field.dart';
import 'package:double_partners/share/widgets/slivers/custom_sliver_grid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddressCreationScreen extends ConsumerStatefulWidget {
  static const String screenName = 'AddressCreationScreen';
  static const String path = '/$screenName';

  const AddressCreationScreen({super.key});

  @override
  ConsumerState createState() => _AddressCreationScreenState();
}

class _AddressCreationScreenState extends ConsumerState<AddressCreationScreen> {
  late final GlobalKey<FormState> _formKey;
  late ScrollController scrollController;
  late TextEditingController addressController;
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController stateController;
  late TextEditingController zipCodeController;
  bool isFormValid = false;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    scrollController = ScrollController();
    addressController = TextEditingController();
    countryController = TextEditingController();
    cityController = TextEditingController();
    stateController = TextEditingController();
    zipCodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    addressController.dispose();
    countryController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() => isFormValid = isValid);
  }

  void _handleCreateUser() async {
    AddressModel addresses = AddressModel(
      address: addressController.text.trim(),
      country: countryController.text.trim(),
      city: cityController.text.trim(),
      state: stateController.text.trim(),
      zipCode: zipCodeController.text.trim(), userId: '',
    );
    ref.read(firestoreProvider.notifier).addAddress(addresses);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: kIsWeb ? null : CustomAppBar(title: AppLocalizations.of(context).addAddress),
        body: Padding(
          padding: kPaddingSymmetric(horizontal: kSize16),
          child: Column(
            children: [
              if (kIsWeb) ...[
                SizedBox(height: kSize16),
                Text(
                  AppLocalizations.of(context).addAddress,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
              SizedBox(height: kSize16),
              Form(
                key: _formKey,
                onChanged:() => _validateForm(),
                child: Column(
                  children: [
                    CustomSliverGrid(
                      childAspectRatio: 6.1,
                      mainAxisSpacing: kSize10,
                      crossAxisSpacing: kSize10,
                      scrollController: scrollController,
                      scrollPhysics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        CustomTextFormField(
                          controller: addressController,
                          label: AppLocalizations.of(context).address,
                          validateInput: (value) => Validations.requiredField(context: context, value: value),
                        ),
                        CustomTextFormField(
                          controller: countryController,
                          label: AppLocalizations.of(context).country,
                          validateInput: (value) => Validations.requiredField(context: context, value: value),
                        ),
                        CustomTextFormField(
                          controller: cityController,
                          label: AppLocalizations.of(context).city,
                          validateInput: (value) => Validations.requiredField(context: context, value: value),
                        ),
                        CustomTextFormField(
                          controller: stateController,
                          label: AppLocalizations.of(context).stateProvince,
                          validateInput: (value) => Validations.requiredField(context: context, value: value),
                        ),
                        CustomTextFormField(
                          controller: zipCodeController,
                          label: AppLocalizations.of(context).postalCode,
                          validateInput: (value) => Validations.postalCode(context: context, value: value),
                        ),
                      ],
                    ),
                    SizedBox(height: kSize16),
                    ElevatedButton(
                      onPressed: isFormValid ? _handleCreateUser : null,
                      child: Text(AppLocalizations.of(context).addAddress),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
