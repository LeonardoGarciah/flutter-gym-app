import 'package:flutter/material.dart';
import 'package:flutter_gym_app/shared/enums/loading_states_enum.dart';

class GymListView extends StatelessWidget {
  final Widget? Function(BuildContext, int) builder;

  final ValueNotifier<List<dynamic>>? listToCount;
  final int? count;
  final int? extraCount;
  final List<ValueNotifier> listeners;

  final bool? onlyOnlineRequest;

  final EdgeInsets? padding;
  final String? emptyListMessage;
  final String? emptyListSubMessage;
  final String? offlineSubtitle;
  final ScrollController? scrollController;
  final ValueNotifier<LoadingStatesEnum>? state;

  const GymListView({
    super.key,
    this.listToCount,
    required this.builder,
    required this.listeners,
    this.padding,
    this.emptyListMessage,
    this.emptyListSubMessage,
    this.offlineSubtitle,
    this.count,
    this.extraCount,
    this.state,
    this.onlyOnlineRequest,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final padding = this.padding?.copyWith(
          top: this.padding!.top + MediaQuery.of(context).padding.top,
          bottom: this.padding!.bottom + MediaQuery.of(context).padding.bottom,
        );

    Widget renderListChildren() {
      if (state != null && state?.value == LoadingStatesEnum.loading) {
        return const Center(child: CircularProgressIndicator());
      }

      if ((listToCount?.value ?? []).isEmpty && (count == null || count == 0)) {
        return ListView.builder(
          controller: scrollController,
          itemCount: 1,
          padding: padding,
          itemBuilder: (context, index) {
            return Text('Ops! Nenhum item encontrado.');
          },
        );
      }

      return ListView.builder(
        itemCount: (count ?? listToCount!.value.length) + (extraCount ?? 0),
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        padding: padding,
        shrinkWrap: true,
        itemBuilder: builder,
      );
    }

    return AnimatedBuilder(
      animation: Listenable.merge([...listeners]),
      builder: (context, child) {
        return renderListChildren();
      },
    );
  }
}
