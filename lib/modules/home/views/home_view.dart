import '../../../constants/app_imports.dart';
import '../controllers/home_controller.dart';
import '../widgets/document_box.dart';
import '../widgets/file_uploader_box.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final homeCon = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 16.h,
            bottom: 80.h
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: 'logo',
                  child: CustomAppBar(title: 'Home',)),
              SizedBox(height: 10.h,),
              ReuseText(title: 'Hello, User 👋', weight: FontWeight.w500,size: 19.sp,),
              ReuseText(title: 'Upload your documents to build\nyour Chat model', size: 12.sp, color: AppColors.textSecondary,),
              SizedBox(height: 20.h,),
              FileUploaderBox(),
              SizedBox(height: 20.h,),
              ReuseText(title: 'Your Documents', weight: FontWeight.w500,size: 13.sp,),
              SizedBox(height: 10.h,),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index){

                      var types = [
                        FileType.pdf,
                        FileType.docx,
                        FileType.txt,
                      ];

                  return DocumentBox(title: 'My Notes', fileSize: 3.4, uploadedTime: DateTime.now(), fileType: types[index],

                  ).marginOnly(bottom: 8.h);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}