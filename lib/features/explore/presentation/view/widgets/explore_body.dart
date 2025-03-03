import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';
import 'package:online_exam_app/domain/entities/subject_entity.dart';
import 'package:online_exam_app/features/explore/presentation/view/widgets/item_list.dart';

class ExploreBody extends StatelessWidget {
  const ExploreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: AppColors.white,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(bottom: 80,left: 8,right: 8),
              title: Text(
                LocaleKeys.Home_Survey.tr(),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.blue),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: SearchBar(
                  leading: Icon(Icons.search, color: AppColors.black[30]),
                  hintText: LocaleKeys.Home_Search.tr(),
                  shadowColor: WidgetStateColor.transparent,
                  hintStyle: WidgetStatePropertyAll(TextStyle(color: AppColors.black[30])),
                  backgroundColor: WidgetStatePropertyAll(AppColors.white),
                  side: WidgetStatePropertyAll(BorderSide(color: Color(0xff878787))),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverToBoxAdapter(
              child: Text(
                LocaleKeys.Home_BrowseBySubject.tr(),
                style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.black)
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ItemList(index: index),
                ),
                childCount: subjectList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
