import 'package:flutter/material.dart';
import 'package:networkingplayground/bloc/user_bloc.dart';
import 'package:networkingplayground/model/user.dart';
import 'package:networkingplayground/model/user_response.dart';
import 'package:networkingplayground/utils/strings_ext.dart';

/// @author: Aman Bindlish on 20/5/20
/// @github: https://github.com/amanbindlish
///
class UserWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserWidgetState();
  }
}

class _UserWidgetState extends State<UserWidget> {
  @override
  void initState() {
    super.initState();
    userBloc.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserResponse>(
      stream: userBloc.subject.stream,
      builder: (context, AsyncSnapshot<UserResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          // success
          return _buildUserWidget(snapshot.data);
        } else if (snapshot.hasError) {
          // error
          return _buildErrorWidget(snapshot.error);
        } else {
          // loading state
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Loading data from API...",
            style: Theme.of(context).textTheme.subtitle2),
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error",
            style: Theme.of(context).textTheme.subtitle2),
      ],
    ));
  }

  Widget _buildUserWidget(UserResponse data) {
    User user = data.results[0];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(user.picture.large),
          ),
          Text(
            "${user.name.first.capitalizeFirstLetter()} ${user.name.last.capitalizeFirstLetter()}",
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            user.email,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    userBloc.dispose();
    super.dispose();
  }
}
