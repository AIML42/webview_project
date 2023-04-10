import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_project/controllers/web_view_url_controller.dart';
import 'package:webview_project/pages/simple_web_view.dart';

class HomeScreen extends StatelessWidget {

  final Map<String, List<Map<String, String>>> topicUrls = {
    'Image': [
      {'title': 'TattoosAI', 'sub-title' : ' - for creating tattoos', 'url': 'https://www.tattoosai.com/'},
      {'title': 'Leonardo.AI','sub-title' : ' - for creating high quality images', 'url': 'https://app.leonardo.ai/'},
      {'title': 'Midjourney', 'sub-title' : ' - for creating high quality images', 'url': 'https://www.midjourney.com/'},
    ],
    'Sound': [
      {'title': 'Altered', 'sub-title' : ' - augment your voice', 'url': 'https://www.altered.ai/'},
      {'title': 'Podcastle','sub-title' : ' - for broadcast storytelling', 'url': 'https://podcastle.ai/'},
      {'title': 'beatoven.ai', 'sub-title' : ' - custom music', 'url': 'https://www.beatoven.ai/'},
    ],
    'Video': [
      {'title': 'Maverick', 'sub-title' : ' - ltv with personal videos', 'url': 'https://www.trymaverick.com/'},
      {'title': 'Tavus','sub-title' : ' - for video personlization', 'url': 'https://www.tavus.io/'},
      {'title': 'Colossyan', 'sub-title' : ' - create videos with ai actors', 'url': 'https://www.colossyan.com/'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final WebViewUrlController webViewUrlController = Get.put(WebViewUrlController());

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'AI tools, just a click away.',
            style: GoogleFonts.getFont('Open Sans', fontSize: 20),
          ),
        ),
      ),
      body: Column(
        
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: topicUrls.length,
              itemBuilder: (context, index) {
                String topic = topicUrls.keys.elementAt(index);
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    child: ExpansionTile(
                      title: Text(
                        topic,
                        style: GoogleFonts.getFont('Open Sans', fontSize: 18)                ),
                      children: topicUrls[topic]!.map<Widget>((buttonInfo) {
                        return ListTile(
                          title : RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: buttonInfo['title'],
                                        style: GoogleFonts.getFont('Open Sans', fontSize: 16, 
                                                    decoration: TextDecoration.underline, color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: buttonInfo['sub-title']!,
                                        style: GoogleFonts.getFont('Open Sans', fontSize: 16, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                          onTap: () {
                            webViewUrlController.setUrl(buttonInfo['url']!);
                            Get.to(() => SimpleWebView(url: webViewUrlController.url.value, 
                                                        title: buttonInfo['title']!,));
                          },
                        );
                      }).toList(),
                      
                    ),
                    
                  ),
                  
                );
              },
            ),
          ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 70),
                        child: ElevatedButton(
                                    onPressed: () {
                                      webViewUrlController.setUrl("https://chat.openai.com/chat");
                                      Get.to(() => SimpleWebView(url: webViewUrlController.url.value, 
                                                        title: "chatGPT",));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Text(
                                      "chatGPT",
                                        style: GoogleFonts.getFont('Open Sans', fontSize: 18)
                                    ),
                                  ),
                      ),

        ],
      ),
    );
  }
}
