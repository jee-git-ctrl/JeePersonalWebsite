import 'package:info_bank/post/post.dart';
import 'package:info_bank/screens/QApage.dart';

Map<String, dynamic> mObj = {
  'title': '大士爺攤販評價',
  'note': '',
  'equQAs': '',
  'tags': ['大士爺廟', '民雄'],
  'equQAsTitle': '',
  'ans': [
    [
      {
        'userID': '1',
        'userName': 'Olivia Adams',
        'reputation': 1.5,
        'score': 1.6,
        'nFeedback': '1k',
        'content': '洵香芋圓每次大排長龍',
        'time': '3天前更新'
      },
      {
        'userID': '2',
        'userName': 'Ethan Parker',
        'reputation': 3.2,
        'score': 2.8,
        'nFeedbac': '2.5k',
        'content': '宅豆花超好吃的！大推',
        'time': '1天前更新'
      },
      {
        'userID': '3',
        'userName': 'Liam Wilson',
        'reputation': 4.5,
        'score': 4.6,
        'nFeedback': '1.7k',
        'content': '附近的滷味不推',
        'time': '5小時前更新'
      },
      {
        'userID': '4',
        'userName': 'Ava Mitchell',
        'reputation': 2.6,
        'score': 1.3,
        'nFeedback': '4.8k',
        'content': '名叫黃媽媽的小吃店家蠻好吃的',
        'time': '6小時前更新'
      },
      {
        'userID': '11',
        'userName': 'Anonymous',
        'reputation': 4.0,
        'score': 3.9,
        'nFeedback': '5k',
        'content': '農曆七月二十一到二十三會有大士爺文化祭',
        'time': '2天前更新'
      },
    ],
    [
      {
        'userID': '1',
        'userName': 'Noah Thompson',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '宅豆花超好吃的！大推',
        'time': '5小時前更新'
      },
      {
        'userID': '2',
        'userName': 'Sophia Davis',
        'reputation': 2.3,
        'score': 1.3,
        'nFeedback': '2.5k',
        'content': '附近的滷味都不推',
        'time': '1天前更新'
      },
      {
        'userID': '3',
        'userName': 'Mason Harris',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '3.0k',
        'content': '農曆七月二十一到二十三會有大士爺文化祭',
        'time': '2天前更新'
      },
      {
        'userID': '4',
        'userName': 'Isabella Bennett',
        'reputation': 3.7,
        'score': 4.5,
        'nFeedback': '4.8k',
        'content': '洵香芋圓每次大排長龍',
        'time': '3天前更新'
      },
      {
        'userID': '5',
        'userName': 'Lucas Green',
        'reputation': 3.8,
        'score': 4.2,
        'nFeedback': '1.9k',
        'content': '名叫黃媽媽的小吃店家蠻好吃的',
        'time': '6小時前更新'
      },
    ],
    [
      {
        'userID': '1',
        'userName': 'Mia Anderson',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '農曆七月二十一到二十三會有大士爺文化祭',
        'time': '1天前更新'
      },
      {
        'userID': '2',
        'userName': 'Benjamin Turner',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '有家章魚燒超好吃的！',
        'time': '5小時前更新'
      },
      {
        'userID': '3',
        'userName': 'Charlotte Hughes',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '1.7k',
        'content': '宅豆花超好吃的！大推',
        'time': '3天前更新'
      },
      {
        'userID': '4',
        'userName': 'William Campbell',
        'reputation': 3.7,
        'score': 4.5,
        'nFeedback': '4.8k',
        'content': '名叫黃媽媽的小吃店家蠻好吃的',
        'time': '2天前更新'
      },
      {
        'userID': '5',
        'userName': 'Emily Gray',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '洵香芋圓每次大排長龍',
        'time': '6小時前更新'
      },
      {
        'userID': '6',
        'userName': 'James Foster',
        'reputation': 3.8,
        'score': 4.5,
        'nFeedback': '2.9k',
        'content': '附近的滷味都不推',
        'time': '1天前更新'
      },
    ],
    [
      {
        'userID': '1',
        'userName': 'Frank',
        'reputation': 4.2,
        'score': 2.9,
        'nFeedback': '3.2k',
        'content': '名叫黃媽媽的小吃店家蠻好吃的',
        'time': '1天前更新'
      },
      {
        'userID': '11',
        'userName': 'Anonymous',
        'reputation': 3.5,
        'score': 4.6,
        'nFeedback': '4.8k',
        'content': '宅豆花超好吃的！大推',
        'time': '3天前更新'
      },
      {
        'userID': '3',
        'userName': 'Doug Stamper',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '1.7k',
        'content': '附近的滷味都不推',
        'time': '5小時前更新'
      },
      {
        'userID': '4',
        'userName': 'Remy Danton',
        'reputation': 3.7,
        'score': 4.5,
        'nFeedback': '4.8k',
        'content': '農曆七月二十一到二十三會有大士爺文化祭',
        'time': '2天前更新'
      },
      {
        'userID': '5',
        'userName': 'Gavin Orsay',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '有家章魚燒超好吃的！',
        'time': '6小時前更新'
      },
      {
        'userID': '6',
        'userName': 'Jackie Sharp',
        'reputation': 1.8,
        'score': 0.9,
        'nFeedback': '564',
        'content': '洵香芋圓每次大排長龍',
        'time': '1天前更新'
      },
    ]
  ],
  'sorted_ans': [
    [
      {
        'userID': '7',
        'userName': 'Tuco',
        'reputation': 0.7,
        'score': 2.2,
        'nFeedback': '1.2k',
        'content': '宅豆花超好吃的！大推',
        'time': '4小時前更新'
      },
      {
        'userID': '2',
        'userName': 'Skyler White',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '洵香芋圓每次大排長龍',
        'time': '5小時前更新'
      },
      {
        'userID': '11',
        'userName': 'Anonymous',
        'reputation': 1.3,
        'score': 2.9,
        'nFeedback': '3.8k',
        'content': '附近的滷味都不推',
        'time': '5小時前更新'
      },
      {
        'userID': '5',
        'userName': 'Jesse',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '名叫黃媽媽的小吃店家蠻好吃的',
        'time': '6小時前更新'
      },
      {
        'userID': '1',
        'userName': 'Walter Black',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '農曆七月二十一到二十三會有大士爺文化祭',
        'time': '1天前更新'
      },
    ],
    [
      {
        'userID': '11',
        'userName': 'Anonymous',
        'reputation': 0.7,
        'score': 2.2,
        'nFeedback': '1.2k',
        'content': '洵香芋圓每次大排長龍',
        'time': '2分鐘前更新'
      },
      {
        'userID': '2',
        'userName': 'Kat',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '附近的滷味都不推',
        'time': '6分鐘前更新'
      },
      {
        'userID': '10',
        'userName': 'Cooper',
        'reputation': 1.3,
        'score': 2.9,
        'nFeedback': '3.8k',
        'content': '宅豆花超好吃的！大推',
        'time': '5小時前更新'
      },
      {
        'userID': '5',
        'userName': 'Officer K',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '農曆七月二十一到二十三會有大士爺文化祭',
        'time': '6小時前更新'
      },
      {
        'userID': '1',
        'userName': 'Murph Cooper',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '有家章魚燒超好吃的！',
        'time': '1天前更新'
      },
    ],
    [
      {
        'userID': '7',
        'userName': 'Tenet',
        'reputation': 0.7,
        'score': 2.2,
        'nFeedback': '1.2k',
        'content': '洵香芋圓每次大排長龍',
        'time': '4小時前更新'
      },
      {
        'userID': '2',
        'userName': 'Neil',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '農曆七月二十一到二十三會有大士爺文化祭',
        'time': '5小時前更新'
      },
      {
        'userID': '10',
        'userName': 'Wallace',
        'reputation': 1.3,
        'score': 2.9,
        'nFeedback': '3.8k',
        'content': '宅豆花超好吃的！大推',
        'time': '5小時前更新'
      },
      {
        'userID': '5',
        'userName': 'Deckard',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '附近的滷味都不推',
        'time': '6小時前更新'
      },
      {
        'userID': '1',
        'userName': 'Cooper',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '名叫黃媽媽的小吃店家蠻好吃的',
        'time': '1天前更新'
      },
      {
        'userID': '6',
        'userName': 'Kat',
        'reputation': 1.8,
        'score': 0.9,
        'nFeedback': '564',
        'content': '有家章魚燒超好吃的！',
        'time': '1天前更新'
      },
    ],
    [
      {
        'userID': '7',
        'userName': 'Seth Grayson',
        'reputation': 0.7,
        'score': 2.2,
        'nFeedback': '1.2k',
        'content': '農曆七月二十一到二十三會有大士爺文化祭',
        'time': '4小時前更新'
      },
      {
        'userID': '2',
        'userName': 'Claire',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '附近的滷味都不推',
        'time': '5小時前更新'
      },
      {
        'userID': '11',
        'userName': 'Anonymous',
        'reputation': 1.3,
        'score': 2.9,
        'nFeedback': '3.8k',
        'content': '宅豆花超好吃的！大推',
        'time': '5小時前更新'
      },
      {
        'userID': '5',
        'userName': 'Gavin Orsay',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '有家章魚燒超好吃的！',
        'time': '6小時前更新'
      },
      {
        'userID': '1',
        'userName': 'Frank',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '洵香芋圓每次大排長龍',
        'time': '1天前更新'
      },
      {
        'userID': '6',
        'userName': 'Jackie Sharp',
        'reputation': 1.8,
        'score': 0.9,
        'nFeedback': '564',
        'content': '名叫黃媽媽的小吃店家蠻好吃的',
        'time': '1天前更新'
      },
    ]
  ],
};
