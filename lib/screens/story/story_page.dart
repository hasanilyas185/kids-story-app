import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kids_story/utils/chapters_data_list.dart';
import 'package:kids_story/utils/utils.dart';

part './widgets/story_content.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  AudioPlayer audioPlayer = AudioPlayer();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _playAudio(_currentPage);
    audioPlayer.onPlayerComplete.listen((event) {
      if ((_currentPage + 1) != ChaptersDataList.chapters.length) {
        _pageController.animateToPage(
          _currentPage + 1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutQuint,
        );
      }
    });
  }

  void _playAudio(int pageIndex) async {
    await audioPlayer.stop();
    await audioPlayer.play(
      AssetSource(
        ChaptersDataList.chapters[pageIndex].chapterPageAudio,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFf1f0eb),
              Color(0xFFf1f0eb),
            ],
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.5),
              child: SizedBox(
                width: 30,
                child: ListView.builder(
                  itemCount:
                      ChaptersDataList.chapters.length, // The count of chapters
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOutQuint,
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            '-',
                            style: TextStyle(
                              color: _currentPage == index
                                  ? Colors.black
                                  : Colors.grey,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          if (_currentPage == index)
                            Text(
                              Utils.toRoman(index + 1),
                              style: TextStyle(
                                color: _currentPage == index
                                    ? Colors.black
                                    : Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                  _playAudio(page);
                },
                itemCount: ChaptersDataList
                    .chapters.length, // The count of chapters/pages
                itemBuilder: (context, index) {
                  final chapter = ChaptersDataList.chapters[index];
                  return StoryContent(
                    index: index + 1,
                    chapterTitle: chapter.chapterTitle,
                    chapterPageTitle: chapter.chapterPageTitle,
                    chapterPageContentPart1: chapter.chapterPageContentPart1,
                    chapterPageContentPart2: chapter.chapterPageContentPart2,
                    chapterPageImage: chapter.chapterPageImage,
                    chapterPageAudio: chapter.chapterPageAudio,
                  );
                },
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
