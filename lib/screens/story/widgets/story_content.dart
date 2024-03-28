part of '../story_page.dart';

class StoryContent extends StatelessWidget {
  const StoryContent({
    Key? key,
    required this.index,
    this.chapterTitle,
    this.chapterPageTitle,
    required this.chapterPageContentPart1,
    required this.chapterPageContentPart2,
    required this.chapterPageImage,
    required this.chapterPageAudio,
  }) : super(key: key);
  final int index;
  final String? chapterTitle;
  final String? chapterPageTitle;
  final String chapterPageContentPart1;
  final String chapterPageContentPart2;
  final String chapterPageImage;
  final String chapterPageAudio;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height / 24),
          if (index == 1) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chapterTitle!,
                  style: const TextStyle(
                    wordSpacing: 2.0,
                    fontFamily: 'Stellar',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  chapterPageTitle!,
                  style: const TextStyle(
                    wordSpacing: 2.0,
                    fontFamily: 'Stellar',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 30.0),
          Text(
            chapterPageContentPart1,
            style: const TextStyle(
                wordSpacing: 2.0,
                height: 1.4,
                fontFamily: 'Stellar',
                color: Colors.black,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 20.0),
          Image.asset(
            chapterPageImage,
            width: MediaQuery.of(context).size.width / 1.5,
          ),
          const SizedBox(height: 20.0),
          Text(
            chapterPageContentPart2,
            style: const TextStyle(
                wordSpacing: 2.0,
                height: 1.4,
                fontFamily: 'Stellar',
                color: Colors.black,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
