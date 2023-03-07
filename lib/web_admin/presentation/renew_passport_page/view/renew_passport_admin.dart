import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/const/app_string.dart';
import 'package:myapp/web_admin/data/data_resource/api_resource.dart';
import 'package:myapp/web_admin/data/models/form_new_passport_model.dart';
import 'package:myapp/web_admin/entity/form_entity.dart';
import 'package:myapp/web_admin/presentation/new_passport_page/controller/new_passport_controller.dart';
import 'package:myapp/web_admin/presentation/renew_passport_page/controller/renew_passport_contoller.dart';
import 'package:myapp/web_admin/presentation/form/form.dart';
import 'package:myapp/web_admin/presentation/widgets/cusotm_container_card_form.dart';
import 'package:myapp/web_admin/presentation/widgets/custom_text_form.dart';

import '../../../../const/app_colors.dart';

class ReNewPassportAdmin extends StatelessWidget {
  ReNewPassportAdmin({super.key});
  ReNewPassportController controller = Get.put(ReNewPassportController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundAppBar,
          elevation: 0,
          title: Text(
            "Renew Passport",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            CustomTextForm(
                onChanged: (number) {
                  controller.searchByName(number);
                },
                hintText: "Search for user",
                prefixIcon: const Icon(Icons.search)),
            SizedBox(
              width: Get.width * 0.05,
            )
          ],
        ),
        body: GetBuilder<ReNewPassportController>(builder: (controller) {
          return GridView.builder(
              itemCount: controller.getReFormNewPassportModel.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (contex, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomContainerCardForm(
                    onTap: () {
                      Get.to(() => FormPassport(
                          formEntity:
                          controller.getReFormNewPassportModel[index],
                          typeStatus: AppString.renewPassport));
                    },
                    onHover: (value) =>
                        controller.setOnHoverContainer(index, value),
                    isHoverContainer: controller.getIsOnHoverContainer[index],
                    index: index,
                    formEntity: controller.getReFormNewPassportModel[index],
                  ),
                );
              });
        }));
  }
}
