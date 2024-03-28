import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kids_story/models/chapter_page_details.dart';
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
  List<ChapterPageDetails> chapters = [
    ChapterPageDetails(
      chapterTitle: "Chapter 12",
      chapterPageTitle: "Timmy the Turtle's Quick Dash",
      chapterPageContentPart1:
          "In a cozy corner of the forest, Timmy the Turtle dreamed of racing. He may have been the slowest, but his spirit was the mightiest.",
      chapterPageContentPart2:
          "The animals gathered for a forest race, and Timmy joined in. Off they went, and though Timmy lagged behind, he never stopped.",
      chapterPageImage: "assets/images/image1.png",
      chapterPageAudio: "audio/page1.mp3",
    ),
    ChapterPageDetails(
      chapterPageContentPart1:
          "Benny the Rabbit, quick and spry, stopped for a snack, sure of his win. But while Benny munched, Timmy inched past, determined and unwavering. As the finish line approached, the animals cheered. Timmy, step by tiny step, made it there first",
      chapterPageContentPart2:
          "The forest learned that day, from Timmy's tiny triumph, that it's not just speed but heart that wins the race.",
      chapterPageImage: "assets/images/image2.png",
      chapterPageAudio: "audio/page2.mp3",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _playAudio(_currentPage);
    audioPlayer.onPlayerComplete.listen((event) {
      if ((_currentPage + 1) != chapters.length) {
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
        chapters[pageIndex].chapterPageAudio,
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
                  itemCount: chapters.length, // The count of chapters
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
                itemCount: chapters.length, // The count of chapters/pages
                itemBuilder: (context, index) {
                  return StoryContent(
                    index: index + 1,
                    chapterTitle: chapters[index].chapterTitle,
                    chapterPageTitle: chapters[index].chapterPageTitle,
                    chapterPageContentPart1:
                        chapters[index].chapterPageContentPart1,
                    chapterPageContentPart2:
                        chapters[index].chapterPageContentPart2,
                    chapterPageImage: chapters[index].chapterPageImage,
                    chapterPageAudio: chapters[index].chapterPageAudio,
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
