import 'package:double_partners/config/theme/app_colors.dart';
import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:double_partners/core/domain/extension/user_extension.dart';
import 'package:double_partners/core/domain/models/address_model.dart';
import 'package:double_partners/core/domain/models/user_model.dart';
import 'package:double_partners/l10n/app_localizations.dart';
import 'package:double_partners/share/providers/firestore_provider.dart';
import 'package:double_partners/share/widgets/custom_app_bar.dart';
import 'package:double_partners/share/widgets/custom_list_title.dart';
import 'package:double_partners/share/widgets/custom_text_form_field.dart';
import 'package:double_partners/share/widgets/slivers/custom_sliver_grid.dart';
import 'package:double_partners/share/widgets/slivers/custom_sliver_grid_fixed_cross_axis_count.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class UserDetailScreen extends ConsumerStatefulWidget {
  static const String screenName = 'UserDetailScreen';
  static const String path = '/$screenName';

  final UserModel? user;

  const UserDetailScreen({required this.user, super.key});

  @override
  ConsumerState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends ConsumerState<UserDetailScreen> {
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
    namesController = TextEditingController(text: widget.user?.names ?? '');
    surnamesController = TextEditingController( text: widget.user?.surnames ?? '');
    dateOfBirthController = TextEditingController( text: widget.user?.dateOfBirth ?? '');
    phoneController = TextEditingController( text: widget.user?.phoneNumber ?? '');
    Future.microtask((){
      ref.read(firestoreProvider.notifier).clearAddresses();
      ref.read(firestoreProvider.notifier).getAddresses(widget.user?.fullName ?? '');
    });
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

  @override
  Widget build(BuildContext context) {
    List<AddressModel>? addresses = ref
        .watch(firestoreProvider)
        .addresses;
    return SafeArea(
      child: Scaffold(
        appBar: kIsWeb ? null : CustomAppBar(title: AppLocalizations
            .of(context)
            .userDetails),
        body: Padding(
          padding: kPaddingSymmetric(horizontal: kSize16),
          child: Column(
            children: [
              if (kIsWeb) ...[
                SizedBox(height: kSize16),
                Text(
                  AppLocalizations
                      .of(context)
                      .userDetails,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
              Form(
                key: _formKey,
                onChanged: () => _validateForm(),
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
                          hint : widget.user?.names ?? '',
                          readOnly: true,
                          enable: false,
                          label: AppLocalizations
                              .of(context)
                              .names,
                        ),
                        CustomTextFormField(
                          controller: surnamesController,
                          hint:  widget.user?.surnames ?? '',
                          readOnly: true,
                          enable: false,
                          label: AppLocalizations
                              .of(context)
                              .surnames,
                        ),
                        CustomTextFormField(
                          controller: dateOfBirthController,
                          hint: widget.user?.dateOfBirth ?? '',
                          readOnly: true,
                          enable: false,
                          label: AppLocalizations
                              .of(context)
                              .dateOfBirth,
                          textInputType: TextInputType.datetime,
                        ),
                        CustomTextFormField(
                          controller: phoneController,
                          hint: widget.user?.phoneNumber ?? '',
                          readOnly: true,
                          enable: false,
                          label: AppLocalizations
                              .of(context)
                              .phoneNumber,
                          textInputType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSize16),
              Text(
                AppLocalizations
                    .of(context)
                    .addresses,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
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
                            onTap: null,
                            child: Padding(
                              padding: kPaddingSymmetric(horizontal: kSize16, vertical: kSize8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Symbols.person, size: kSize20, color: Theme
                                          .of(context)
                                          .primaryColor),
                                      SizedBox(width: kSize16),
                                      Text(
                                        AppLocalizations
                                            .of(context)
                                            .personalInfo,
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    address?.address ?? '',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: kSize4),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * 0.4,
                                        child: CustomListTitle(
                                            icon: Symbols.flag_rounded, title: address?.country ?? ''),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.4,
                                        child: CustomListTitle(
                                            icon: Symbols.location_city_rounded, title: address?.city ?? ''),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * 0.4,
                                        child: CustomListTitle(
                                            icon: Symbols.apartment_rounded, title: address?.state ?? ''),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.4,
                                        child: CustomListTitle(
                                            icon: Symbols.code_rounded, title: address?.zipCode ?? ''),
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
      ),
    );
  }
}