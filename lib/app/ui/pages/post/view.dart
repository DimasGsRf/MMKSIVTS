import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/app_component.dart';
import 'package:mmksi_vts_mobile/app/ui/pages/post/controller.dart';
import 'package:mmksi_vts_mobile/app/ui/widgets/app_bar.dart';
import 'package:mmksi_vts_mobile/app/ui/widgets/loading.dart';

class PostsPage extends View {
  @override
  State<StatefulWidget> createState() => _PostsPageState(
        AppComponent.getInjector().get(),
      );
}

class _PostsPageState extends ViewState<PostsPage, PostsController> {
  _PostsPageState(PostsController controller) : super(controller);

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: CommonAppBar(
          title: 'Post',
          centerTitle: true,
        ),
        body: ControlledWidgetBuilder<PostsController>(
          builder: (context, controller) => controller.isLoading
              ? Center(child: CommonLoading())
              : ListView.builder(
                  itemCount: controller.posts.length,
                  itemBuilder: (context, index) {
                    var post = controller.posts[index];

                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },
                ),
        ),
      );
}
