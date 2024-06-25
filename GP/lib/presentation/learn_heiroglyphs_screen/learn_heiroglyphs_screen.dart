import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/widgets/app_bar/appbar_leading_image.dart';
import 'package:hierosecret/widgets/app_bar/appbar_title.dart';
import 'package:hierosecret/widgets/app_bar/custom_app_bar.dart';

class Article {
  final String title;
  final List<List<Map<String, String>>> table;

  Article({required this.title, required this.table});
}

class LearnHeiroglyphsScreen extends StatefulWidget {
  const LearnHeiroglyphsScreen({Key? key}) : super(key: key);

  @override
  _LearnHeiroglyphsScreenState createState() => _LearnHeiroglyphsScreenState();
}

class _LearnHeiroglyphsScreenState extends State<LearnHeiroglyphsScreen> {
  List<Article> articles = [];
  bool isLoading = true;
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    fetchHieroglyphs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: GestureDetector(
        onScaleUpdate: (details) {
          setState(() {
            _scale = details.scale;
          });
        },
        child: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgOnboarding,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Scrollbar(
                          child: ListView.builder(
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              final article = articles[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      // Center the text horizontally
                                      child: Text(
                                        article
                                            .title, // Display the article title
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ), // Add some space between the title and table
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DataTable(
                                        columnSpacing: 20 * _scale,
                                        dataRowHeight: 50 * _scale,
                                        columns: [
                                          DataColumn(
                                              label: Text('Gardiner No.')),
                                          DataColumn(label: Text('Hieroglyph')),
                                          DataColumn(
                                              label: Text('Description')),
                                          DataColumn(label: Text('Details')),
                                        ],
                                        rows: <DataRow>[
                                          for (var tableRow in article.table)
                                            ...tableRow.map((rowData) =>
                                                DataRow(cells: [
                                                  DataCell(Text(
                                                      rowData['Gardiner No.'] ??
                                                          '')),
                                                  DataCell(
                                                    Transform.scale(
                                                      scale: 2.0 * _scale,
                                                      child: Text(rowData[
                                                              'Hieroglyph'] ??
                                                          ''),
                                                    ),
                                                  ),
                                                  DataCell(Text(
                                                      rowData['Description'] ??
                                                          '')),
                                                  DataCell(Text(
                                                      rowData['Details'] ??
                                                          '')),
                                                ])),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 53.h,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Get.back();
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Learn Hieroglyphics".tr,
        margin: EdgeInsets.only(top: 48.v),
      ),
      styleType: Style.bgFill,
    );
  }

  Future<void> fetchHieroglyphs() async {
    final url =
        Uri.parse('https://www.egyptianhieroglyphs.net/gardiners-sign-list/');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll('div > h3')
        .map((element) => element.innerHtml.trim())
        .toList();

    final urls = html
        .querySelectorAll('div > p:nth-child(1) > a')
        .map((element) => element.attributes['href'])
        .toList();

    final tables = html.querySelectorAll('.elementor-widget-container table');
    List<List<Map<String, String>>> tablesDataList = [];
    for (var table in tables) {
      List<Map<String, String>> data = [];
      final tableRows = table.querySelectorAll('tbody tr');

      for (var i = 1; i < tableRows.length; i++) {
        // Start iterating from index 1 to skip the first row
        var row = tableRows[i];
        var rowData = <String, String>{};
        final cells = row.children;
        rowData['Gardiner No.'] = cells[0].text.trim();
        rowData['Hieroglyph'] = cells[1].querySelector('h6')?.text.trim() ?? '';
        rowData['Description'] = cells[2].text.trim();
        rowData['Details'] = cells[3].text.trim();
        data.add(rowData);
      }
      tablesDataList.add(data);
    }

    setState(() {
      isLoading = false;
      articles = List.generate(
        titles.length - 4,
        (index) => Article(
          title: titles[index],
          table: [tablesDataList[index]],
        ),
      );
    });
  }
}
