import 'package:double_partners/config/theme/app_colors.dart';
import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:double_partners/core/domain/extension/user_extension.dart';
import 'package:double_partners/core/domain/models/user_model.dart';
import 'package:double_partners/core/ui/users/screens/user_creation_screen.dart';
import 'package:double_partners/core/ui/users/screens/user_detail_screen.dart';
import 'package:double_partners/l10n/app_localizations.dart';
import 'package:double_partners/share/providers/firestore_provider.dart';
import 'package:double_partners/share/widgets/custom_app_bar.dart';
import 'package:double_partners/share/widgets/custom_list_title.dart';
import 'package:double_partners/share/widgets/shimmers/sliver_grid_shimmer.dart';
import 'package:double_partners/share/widgets/slivers/custom_sliver_grid_fixed_cross_axis_count.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

class UsersScreen extends ConsumerStatefulWidget {
  static const String screenName = 'UsersScreen';
  static const String path = '/$screenName';
  const UsersScreen({super.key});

  @override
  ConsumerState createState() => _UsersScreenState();
}

class _UsersScreenState extends ConsumerState<UsersScreen> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    Future.microtask(() => ref.read(firestoreProvider.notifier).getUsers());
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(firestoreProvider).users;
    bool isLoading = ref.watch(firestoreProvider).isLoading;
    final bool isEmpty = users == null || users.isEmpty;
    return SafeArea(
      child: Scaffold(
        appBar: kIsWeb ? null : CustomAppBar(title: AppLocalizations.of(context).userList),
        body: Padding(
          padding: kPaddingSymmetric(horizontal: kSize16),
          child: Column(
            children: [
              if (kIsWeb) ...[
                SizedBox(height: kSize16),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).userList,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: kSize16),
              ],
              if (isEmpty && !isLoading) ...[Center(child: Text(AppLocalizations.of(context).emptyUserList))],
              if (isLoading) ...[
                Expanded(child: SliverGridShimmer()),
              ] else ...[
                Expanded(
                  child: CustomSliverGridFixedCrossAxisCount(
                    scrollController: scrollController,
                    itemCount: users?.length,
                    mainAxisExtent: kSize200,
                    itemBuilder: (context, index) {
                      UserModel? user = users?[index];
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          return Card(
                            elevation: kSize4,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kSize16)),
                            child: InkWell(
                              borderRadius: BorderRadius.all(Radius.circular(kSize16)),
                              onTap: () => context.pushNamed(
                                UserDetailScreen.screenName,
                                extra: user,
                              ),
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
                                        Spacer(),
                                        IconButton(
                                          onPressed: () {},
                                          icon:
                                              (user?.isFavorite ?? false)
                                                  ? Icon(Symbols.favorite, color: kRed, size: kSize20, fill: 1)
                                                  : Icon(Symbols.favorite, size: kSize20, color: kBlack),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      user?.fullName ?? '',
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
                                          child: CustomListTitle(icon: Symbols.calendar_today, title: user?.dateOfBirth ?? ''),
                                        ),
                                        Spacer(),
                                        SizedBox(
                                          width: constraints.maxWidth * 0.4,
                                          child: CustomListTitle(icon: Symbols.phone, title: user?.phoneNumber ?? ''),
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
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kBlue,
          tooltip: AppLocalizations.of(context).createUser,
          onPressed: () => context.pushNamed(UserCreationScreen.screenName),
          child: Icon(Symbols.person_add_rounded,color: kWhite,),
        ),
      ),
    );
  }
}
