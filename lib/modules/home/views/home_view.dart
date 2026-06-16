import '../../../constants/app_imports.dart';
import '../controllers/home_controller.dart';
import '../widgets/document_box.dart';
import '../widgets/file_uploader_box.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeCon = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeCon.fetchAllDocuments();
    });
  }

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
              ReuseText(
                title: 'Hello, User 👋', weight: FontWeight.w500, size: 19.sp,),
              ReuseText(
                title: 'Upload your documents to build\nyour Chat model',
                size: 12.sp,
                color: AppColors.textSecondary,),
              SizedBox(height: 20.h,),
              FileUploaderBox(),
              SizedBox(height: 20.h,),
              ReuseText(
                title: 'Your Documents', weight: FontWeight.w500, size: 13.sp,),
              SizedBox(height: 10.h,),
              Expanded(
                child: Obx(() {
                  if(homeCon.loadingDocs.value){
                    return Center(
                      child: Utils.apiLoader
                    );
                  } else if(homeCon.documents.isEmpty){
                    return Center(
                      child: ReuseText(title: 'No Documents Added',
                      size: 12.sp,
                        weight: FontWeight.w500,
                      ),
                    );
                  }
                  return ListView.builder(
                      itemCount: homeCon.documents.length,
                      itemBuilder: (context, index) {
                        var doc = homeCon.documents[index];
                        return DocumentBox(title: doc.filename ?? '',
                          fileSize: 3.4,
                          uploadedTime: doc.uploadedAt,
                          fileType: FileType.fromExtension(doc.fileType ?? 'pdf') ?? FileType.pdf,

                        ).marginOnly(bottom: 8.h);
                      });
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}