import 'package:double_partners/config/theme/app_colors.dart';
import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:double_partners/core/domain/models/address_model.dart';
import 'package:double_partners/core/domain/models/user_model.dart';
import 'package:double_partners/core/ui/address/screens/address_creation_screen.dart';
import 'package:double_partners/l10n/app_localizations.dart';
import 'package:double_partners/share/helpers/validations/validations_helper.dart';
import 'package:double_partners/share/providers/firestore_provider.dart';
import 'package:double_partners/share/widgets/custom_app_bar.dart';
import 'package:double_partners/share/widgets/custom_list_title.dart';
import 'package:double_partners/share/widgets/custom_text_form_field.dart';
import 'package:double_partners/share/widgets/slivers/custom_sliver_grid.dart';
import 'package:double_partners/share/widgets/slivers/custom_sliver_grid_fixed_cross_axis_count.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

class UserCreationScreen extends ConsumerStatefulWidget {
  static const String screenName = 'UserCreationScreen';
  static const String path = '/$screenName';
  const UserCreationScreen({super.key});

  @override
  ConsumerState createState() => _UserCreationScreenState();
}

class _UserCreationScreenState extends ConsumerState<UserCreationScreen> {
  late final GlobalKey<FormState> _formKey;
  late ScrollController scrollController;
  late TextEditingController namesController;
  late TextEditingController surnamesController;
  late TextEditingController dateOfBirthController;
  late TextEditingController phoneController;
  bool isFormValid = false;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    scrollController = ScrollController();
    namesController = TextEditingController();
    surnamesController = TextEditingController();
    dateOfBirthController = TextEditingController();
    phoneController = TextEditingController();
    Future.microtask(()=> ref.read(firestoreProvider.notifier).clearAddresses());
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    namesController.dispose();
    surnamesController.dispose();
    dateOfBirthController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() => isFormValid = isValid);
  }

  void _handleCreateUser() async {
    UserModel user = UserModel(
      names: namesController.text,
      surnames: surnamesController.text,
      dateOfBirth: dateOfBirthController.text,
      phoneNumber: phoneController.text,
    );
    List<AddressModel>? addresses = ref.watch(firestoreProvider).addresses;
    ref.read(firestoreProvider.notifier).createUser(user, addresses);
  }

  @override
  Widget build(BuildContext context) {
    List<AddressModel>? addresses = ref.watch(firestoreProvider).addresses;
    return SafeArea(
      child: Scaffold(
        appBar: kIsWeb ? null : CustomAppBar(title: AppLocalizations.of(context).userCreation),
        body: Padding(
          padding: kPaddingSymmetric(horizontal: kSize16),
          child: Column(
            children: [
              if (kIsWeb) ...[
                SizedBox(height: kSize16),
                Text(
                  AppLocalizations.of(context).userCreation,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
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
                          controller: namesController,
                          label: AppLocalizations.of(context).names,
                          validateInput: (value) => Validations.requiredField(context: context, value: value),
                        ),
                        CustomTextFormField(
                          controller: surnamesController,
                          label: AppLocalizations.of(context).surnames,
                          validateInput: (value) => Validations.requiredField(context: context, value: value),
                        ),
                        CustomTextFormField(
                          controller: dateOfBirthController,
                          label: AppLocalizations.of(context).dateOfBirth,
                          textInputType: TextInputType.datetime,
                          validateInput: (value) => Validations.requiredField(context: context, value: value),
                        ),
                        CustomTextFormField(
                          controller: phoneController,
                          label: AppLocalizations.of(context).phoneNumber,
                          textInputType: TextInputType.phone,
                          validateInput: (value) => Validations.phone(context: context, value: value),
                        ),
                      ],
                    ),
                    SizedBox(height: kSize16),
                    ElevatedButton(
                      onPressed: () => context.pushNamed(AddressCreationScreen.screenName),
                      child: Text(AppLocalizations.of(context).addAddress),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSize16),
              Expanded(
                child: CustomSliverGridFixedCrossAxisCount(
                  scrollController: scrollController,
                  itemCount: addresses?.length ?? 0,
                  mainAxisExtent: kSize200,
                  itemBuilder: (context, index) {
                    AddressModel? address = addresses?[index];
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return Card(
                          elevation: kSize4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kSize16)),
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(kSize16)),
                            onTap: () {},
                            child: Padding(
                              padding: kPaddingSymmetric(horizontal: kSize16, vertical: kSize8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Symbols.person, size: kSize20, color: Theme.of(context).primaryColor),
                                      SizedBox(width: kSize16),
                                      Text(
                                        AppLocalizations.of(context).personalInfo,
                                        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    address?.address ?? '',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: kSize4),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * 0.4,
                                        child: CustomListTitle(icon: Symbols.flag_rounded, title: address?.country ?? ''),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.4,
                                        child: CustomListTitle(icon: Symbols.location_city_rounded, title: address?.city ?? ''),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * 0.4,
                                        child: CustomListTitle(icon: Symbols.apartment_rounded, title: address?.state ?? ''),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.4,
                                        child: CustomListTitle(icon: Symbols.code_rounded, title: address?.zipCode ?? ''),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: AppLocalizations.of(context).createUser,
          onPressed: isFormValid ? _handleCreateUser : null,
          backgroundColor: isFormValid ? kBlue : kGrey,
          child: Icon(Symbols.check, color: kWhite),
        ),
      ),
    );
  }
}
