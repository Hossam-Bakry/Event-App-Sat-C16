import 'package:event_app_c16_sat/core/services/snackbar_service.dart';
import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/core/utils/firestore_serivces.dart';
import 'package:event_app_c16_sat/core/widgets/custom_button_widget.dart';
import 'package:event_app_c16_sat/core/widgets/custom_text_form_filed.dart';
import 'package:event_app_c16_sat/gen/assets.gen.dart';
import 'package:event_app_c16_sat/models/category_data.dart';
import 'package:event_app_c16_sat/models/event_data.dart';
import 'package:event_app_c16_sat/modules/create_event/widgets/create_tab_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class CreateEventView extends StatefulWidget {
  const CreateEventView({super.key});

  @override
  State<CreateEventView> createState() => _CreateEventViewState();
}

class _CreateEventViewState extends State<CreateEventView> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? _selectedDate;
  int _selectedIndex = 0;

  final List<CategoryData> _categories = [
    CategoryData(
      id: "sport",
      name: "Sport",
      icn: Assets.icons.sportIcn.path,
      image: Assets.images.sportImg.path,
    ),
    CategoryData(
      id: "book_club",
      name: "Book Club",
      icn: Assets.icons.bookClubIcn.path,
      image: Assets.images.bookClubImg.path,
    ),
    CategoryData(
      id: "birthday",
      name: "BirthDay",
      icn: Assets.icons.birthdayIcn.path,
      image: Assets.images.birthdayImg.path,
    ),
    CategoryData(
      id: "eating",
      name: "Eating",
      icn: Assets.icons.sportIcn.path,
      image: Assets.images.eatingImg.path,
    ),
    CategoryData(
      id: "exhibition",
      name: "Exhibition",
      icn: Assets.icons.bookClubIcn.path,
      image: Assets.images.exhibitionImg.path,
    ),
    CategoryData(
      id: "gaming",
      name: "Gaming",
      icn: Assets.icons.birthdayIcn.path,
      image: Assets.images.gamingImg.path,
    ),
    CategoryData(
      id: "meeting",
      name: "Meeting",
      icn: Assets.icons.sportIcn.path,
      image: Assets.images.meetingImg.path,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Create Event")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomButtonWidget(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (_selectedDate == null) {
                /// Toast to inform user to select date
                SnackBarService.showErrorMessage("Please select event time");
                return;
              }
              var data = EventData(
                title: _titleController.text,
                description: _descriptionController.text,
                categoryID: _categories[_selectedIndex].id,
                imageUrl: _categories[_selectedIndex].image,
                selectedDate: _selectedDate,
              );

              /// Add event to database
              /// Firebase Firestore

              EasyLoading.show();
              FirestoreServices.addNewEvent(data).then((value) {
                /// function has been done
                EasyLoading.dismiss();
                Navigator.pop(context);
                SnackBarService.showSuccessMessage("Event added successfully");
              });
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add Event",
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 205,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: AssetImage(_categories[_selectedIndex].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              DefaultTabController(
                length: _categories.length,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  labelPadding: EdgeInsets.symmetric(horizontal: 4),
                  indicator: BoxDecoration(),
                  dividerColor: Colors.transparent,
                  dividerHeight: 0,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  tabs:
                      _categories.map((element) {
                        return CreateTabBarItem(
                          categoryData: element,
                          isSelected:
                              _selectedIndex == _categories.indexOf(element),
                        );
                      }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Title",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextFormFiled(
                  controller: _titleController,
                  hintText: "Event Title",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "please enter event title";
                    }
                    return null;
                  },
                  prefixIcon: Icon(
                    Icons.edit_note_rounded,
                    size: 30,
                    color: ColorPallete.textFormFiledBorderColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Description",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextFormFiled(
                  controller: _descriptionController,
                  hintText: "Event Description",
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "please enter event description";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.calendar_month_outlined, size: 30),
                    Text(
                      "Event Date",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Bounceable(
                      onTap: () {
                        selectEventDate();
                      },
                      child: Text(
                        _selectedDate != null
                            ? DateFormat('EEE, MMM d').format(_selectedDate!)
                            : "Choose Date",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: ColorPallete.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Location",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomButtonWidget(
                  onPressed: () {},
                  backgroundColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: ColorPallete.primaryColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Icon(
                            Icons.my_location,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          "Choose Event Location",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: ColorPallete.primaryColor,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectEventDate() async {
    var currentDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    setState(() {
      if (currentDate != null) {
        _selectedDate = currentDate;
      }
    });
  }
}
