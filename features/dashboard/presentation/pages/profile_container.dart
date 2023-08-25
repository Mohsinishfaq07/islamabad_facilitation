import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants/app_assets.dart';
import '../../manager/dashboard_provider.dart';

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashboardProvider>(
      create: (context) => DashboardProvider(),
      child: Consumer<DashboardProvider>(
        builder: (context, provider, _) {
          return Stack(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors
                          .white, // Replace with your desired border color
                      width: 2.0, // Replace with your desired border width
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.amberAccent,
                    radius: 60.r,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60.r),
                      child: provider.selectedImage == null
                          ? CachedNetworkImage(
                              imageUrl: "http://via.placeholder.com/200x150",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                      colorFilter: const ColorFilter.mode(
                                          Colors.blue, BlendMode.colorBurn)),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Image.asset(
                                  AppAssets.pngsGeneralComplain,
                                ),
                              ),
                            )
                          : Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60.r),
                                child: Image.file(
                                  provider.selectedImage!,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.height * 0.10,
                right: 0,
                child: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 15.r,
                    child: Icon(Icons.edit, size: 15.sp),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          color: Colors.white,
                          height: 70,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      provider.chooseImage("camera");
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Camera',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))),
                                TextButton(
                                  onPressed: () {
                                    provider.chooseImage("Gallery");
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Gallery',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
