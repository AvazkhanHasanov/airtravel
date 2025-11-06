import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/status.dart';
import 'package:air_travel/feature/package_detail/managers/detail_bloc.dart';
import 'package:air_travel/feature/package_detail/managers/detail_state.dart';
import 'package:air_travel/feature/package_detail/widgets/title_feature.dart';
import 'package:air_travel/feature/package_detail/widgets/detail_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageDetail extends StatefulWidget {
  const PackageDetail({super.key});

  @override
  State<PackageDetail> createState() => _PackageDetailState();
}

class _PackageDetailState extends State<PackageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => DetailBloc(packageRepo: context.read())..add(GetDetailPackage(id: 1)),
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state.detailStatus == Status.loading) {
              return Center(child: CircularProgressIndicator.adaptive());
            }
            if (state.detail == null) {
              return Center(child: CircularProgressIndicator.adaptive());
            }

            return Column(
              children: [
                DetailPicture(pictures: state.detail!.pictures),
                12.height,
                TitleFeature(
                  title: state.detail!.title,
                  feature: state.detail!.coreFeatures,
                ).paddingSymmetric(horizontal: 14),
                Row(
                  children: [
                    // List.generate(state.detail!.destinations.length, generator)
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
