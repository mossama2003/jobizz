import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../shared/models/custom_dropdown_model.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';
import 'custom_icon.dart';

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    this.hintText,
    this.labelText,
    this.iconStart,
    this.selectedValue,
    this.enabled = true,
    required this.items,
    this.iconColor = false,
    required this.onChanged,
    this.isRequired = false,
  });

  final bool enabled;
  final bool iconColor;
  final bool isRequired;
  final String? hintText;
  final String? labelText;
  final String? iconStart;
  final List<CustomDropdownModel> items;
  final CustomDropdownModel? selectedValue;
  final ValueChanged<CustomDropdownModel?> onChanged;

  @override
  Widget build(BuildContext context) {
    CustomDropdownModel? actualSelectedValue = selectedValue;
    if (selectedValue != null && !items.contains(selectedValue)) {
      actualSelectedValue = null;
    }
    return DropdownButtonFormField<CustomDropdownModel>(
      isExpanded: true,
      value: actualSelectedValue,
      onChanged: enabled ? onChanged : null,
      decoration: InputDecoration(
        enabled: enabled,
        prefixIcon: iconStart != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomIcon(
                    icon: iconStart!,
                    withColor: iconColor,
                    color: iconColor ? null : AppColors.darkGray,
                  ),
                ],
              )
            : null,
        hintText: hintText ?? "Select an Option",
        labelText: labelText ?? hintText ?? "Select an Option",
        border: const OutlineInputBorder(),
      ),
      items: items.map((CustomDropdownModel item) {
        return DropdownMenuItem<CustomDropdownModel>(
          value: item,
          child: Text(
            item.title,
            style: TextStyle(fontSize: AppSize.font(14)),
          ),
        );
      }).toList(),
      validator: (v) =>
          isRequired && v == null ? 'validators.required'.tr() : null,
    );
  }
}
