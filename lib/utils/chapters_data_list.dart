import 'package:kids_story/models/chapter_page_details.dart';

class ChaptersDataList {
   static List<ChapterPageDetails> chapters = [
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
}