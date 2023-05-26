import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({
    super.key,
  });

  final list = ['가', '나', '다'];

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showGeneralDialog(
          barrierLabel: 'barrier label',
          barrierDismissible: true,
          context: context,
          pageBuilder: (_, __, ___) {
            return SafeArea(
              child: Dialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                backgroundColor: Colors.white,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Swiper(
                    pagination: const SwiperPagination(
                        alignment: Alignment.bottomCenter),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(list[index]),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('건너띄기'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
      child: const Center(
        child: Text(
          'Custom Dialog',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
    );
  }
}
