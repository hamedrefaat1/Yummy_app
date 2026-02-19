import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:yummy/core/constants/app_colors.dart';
import 'package:yummy/features/auth/components/custom_profile_text_filed.dart';
import 'package:yummy/shared/custom_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    @override
  void initState() {
    nameController.text= "Hamed";
    emailController.text="hamedrefaat10@gmail.com";
    addressController.text="Cairo , egypt";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
  appBar: AppBar(
    backgroundColor: Colors.white,
    scrolledUnderElevation: 0,
    elevation: 0,
    leading: GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back , color: Colors.black,),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Icon(Icons.settings , color: Colors.black,),
      )
    ],
  ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                 // image: DecorationImage(image: Image.network("")),
                  color: Colors.grey ,
                  border: Border.all(color: Colors.black26 , width: 2),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Icon(Icons.person , size: 80,),
              ),
             Gap(40),
            CustomProfileTextFiled(labelText: "Name", controller: nameController,),
            Gap(20),
            CustomProfileTextFiled(labelText: "Email", controller: emailController,),
            Gap(20),
            CustomProfileTextFiled(labelText: "Address", controller: addressController,),
            Gap(40),

            Divider(
              
            ),

            Gap(20),
             ListTile(
             
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                tileColor: Color(0xffF3F4F6),
                leading: Image.asset("assets/Icons/image 13.png"),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomText(text: "Defualt" , size: 14,),
                ),
                title: CustomText(
                  text: "Debit card",
                  color: Color(0xff3C2F2F),
                  wight: FontWeight.w500,
                  size: 14,
                ),
                subtitle: CustomText(
                  text: "3566 **** **** 0505",
                  color: Color(0xff808080),
                  wight: FontWeight.w500,
                  size: 14,
                ),
              ),
              Gap(35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Container(
                  padding: EdgeInsets.symmetric(horizontal:25 , vertical: 15),
                  decoration: BoxDecoration(
                    color:  Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.primary , width: 2)
                  ),
                  child: Row(
                    children: [
                      CustomText(text: "Edit Profil" , size: 18, wight: FontWeight.w400,),
                      Gap(10),
                      Icon(Icons.edit  , size: 20,)
                    ],
                  ),
                 ),

                 Container(
                  padding: EdgeInsets.symmetric(horizontal:25 , vertical: 15),
                  decoration: BoxDecoration(
                    color:  AppColors.primary,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.primary , width: 2)
                  ),
                  child: Row(
                    children: [
                      CustomText(text: "Logout" , size: 18, wight: FontWeight.w400, color: Colors.white,),
                      Gap(10),
                      Icon(Icons.logout  , size: 20, color: Colors.white,)
                    ],
                  ),
                 ),

                ],
              )
          
            ],
          ),
        ),
      )
    );
  }
}