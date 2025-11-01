import 'package:flutter/material.dart';

class TariflarScreen extends StatefulWidget {
  @override
  _TariflarScreenState createState() => _TariflarScreenState();
}

class _TariflarScreenState extends State<TariflarScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _maxScrollWidth = 0;

  List<Map<String, dynamic>> tariflar = [
    {
      'nomi': 'Ekonom',
      'narxi': '1200\$',
      'afzalliklar': ['Transport Xizmati', 'Nonushta', '6+']
    },
    {
      'nomi': 'Standart',
      'narxi': '1400\$',
      'afzalliklar': ['Transport Xizmati', 'Nonushta', '6+']
    },
    {
      'nomi': 'Premium',
      'narxi': '1800\$',
      'afzalliklar': ['Transport Xizmati', 'Nonushta', 'WiFi']
    },
    {
      'nomi': 'Biznes',
      'narxi': '2200\$',
      'afzalliklar': ['Transport Xizmati', 'Nonushta', 'Konferens']
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _maxScrollWidth = _scrollController.position.maxScrollExtent;
      });
    });
  }

  void _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Umra Safari')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tariflar', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            // 1. Horizontal Scroll Tariflar
            Container(
              height: 300,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: tariflar.length,
                itemBuilder: (context, index) {
                  return Container(

                    margin: EdgeInsets.only(right: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tariflar[index]['nomi'],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          tariflar[index]['narxi'],
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                        SizedBox(height: 12),
                        Text('Afzalliklari:', style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 8),
                        ...tariflar[index]['afzalliklar'].map((afzallik) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            child: Row(
                              children: [
                                Icon(Icons.check, size: 16, color: Colors.green),
                                SizedBox(width: 4),
                                Text(afzallik),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 30),

            // 2. Pastdagi Scroll Indicator
            Container(
              height: 4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
              child: Stack(
                children: [
                  // Background
                  Container(),

                  // Scroll indicator
                  AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    margin: EdgeInsets.only(
                        left: _maxScrollWidth > 0
                            ? (_scrollPosition / _maxScrollWidth) * (MediaQuery.of(context).size.width - 40)
                            : 0
                    ),
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}