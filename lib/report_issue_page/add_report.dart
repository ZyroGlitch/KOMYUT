import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:komyut/pages/report_page.dart';
import 'package:quickalert/quickalert.dart';

class AddReport extends StatefulWidget {
  const AddReport({super.key});

  @override
  State<AddReport> createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  bool upload = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Add Report Issue'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subject (max. 100 characters)*',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: subjectController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {},
                ),
                SizedBox(height: 26),
                Text(
                  'Message*',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {},
                  maxLines: 5, // This makes it a textarea
                ),
                SizedBox(height: 26),
                Text(
                  'Upload picture to support your report',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                upload
                    ? Row(
                        children: [
                          Card.outlined(
                            child: Image.asset(
                              'images/accident.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 50,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 50,
                          ),
                        ],
                      )
                    : Container(),
                upload ? SizedBox(height: 20) : SizedBox(height: 0),
                ElevatedButton.icon(
                  onPressed: () async {
                    //  Code to open a file picker
                    final result = await FilePicker.platform.pickFiles();
                    if (result != null) {
                      setState(() {
                        upload = true;
                      });
                    }
                  },
                  icon: Icon(Icons.upload),
                  label: Text('Upload'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    fixedSize: Size(500, 40),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  text: 'Successfully sent your concern.',
                  autoCloseDuration: Duration(seconds: 5),
                  onConfirmBtnTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ReportPage(),
                      ),
                    );
                  },
                ).then((value) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReportPage(),
                    ),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                fixedSize: Size(500, 40),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
