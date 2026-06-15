import '../../../constants/app_imports.dart';

class FileUploaderBox extends StatelessWidget {
  const FileUploaderBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 30,
                color: Colors.black12,
                spreadRadius: 1
            )
          ]
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(18.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: AppColors.grey,
            )
        ),
        child: Column(
          children: [
            Image.asset(AppAssets.upload, height: 50.h, color: AppColors.primary,),
            ReuseText(title: 'Upload Files', weight: FontWeight.w500,size: 14.sp,),
            SizedBox(height: 4.h,),
            ReuseText(title: 'Drag & drop files here or browse', size: 12.sp, color: AppColors.textSecondary,),
            SizedBox(height: 10.h,),
            ReuseText(title: 'Supported formats: PDF, DOCX, TXT\nMax file size: 50MB', size: 10.sp, color: AppColors.textSecondary, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}