import 'package:info_bank/post/post.dart';
import 'package:info_bank/screens/QApage.dart';

Map<String, dynamic> mObj = {
  'title': '大吃還有機車停車位嗎',
  'note': '大吃農閒時刻旁的機車停車場',
  'equQAs': [],
  'tags': ['停車位', 'CCU', '大吃'],
  'equQAsTitle': [],
  'ans': [
    [
      {
        'userID': '1',
        'userName': 'Walter Black',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '沒有了',
        'time': '1天前更新'
      },
      {
        'userID': '2',
        'userName': 'Skyler White',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '還有一些',
        'time': '5小時前更新'
      },
      {
        'userID': '3',
        'userName': 'Hank Schrader',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '1.7k',
        'content': '剩下不多',
        'time': '3天前更新'
      },
      {
        'userID': '4',
        'userName': 'Gus Fring',
        'reputation': 3.7,
        'score': 4.5,
        'nFeedback': '4.8k',
        'content': '沒了',
        'time': '2天前更新'
      },
      {
        'userID': '5',
        'userName': 'Jesse',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '現在還有很多',
        'time': '6小時前更新'
      },
    ],
    [
      {
        'userID': '1',
        'userName': 'Murph Cooper',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '現在還有一些停車格',
        'time': '1天前更新'
      },
      {
        'userID': '2',
        'userName': 'Kat',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '現在的停車格都很上面',
        'time': '5小時前更新'
      },
      {
        'userID': '3',
        'userName': 'Neil',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '1.7k',
        'content': '連大吃路邊都有停車格',
        'time': '3天前更新'
      },
    ],
    [
      {
        'userID': '1',
        'userName': 'Cooper',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '目前應該沒了，但之後應該會有一些',
        'time': '1天前更新'
      },
      {
        'userID': '2',
        'userName': 'Neil',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '現在有一些停車格',
        'time': '5小時前更新'
      },
      {
        'userID': '3',
        'userName': 'Gotham',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '1.7k',
        'content': '快沒了大概剩幾個而已',
        'time': '3天前更新'
      },
      {
        'userID': '4',
        'userName': 'K',
        'reputation': 3.7,
        'score': 4.5,
        'nFeedback': '4.8k',
        'content': '現在沒了',
        'time': '2天前更新'
      },
      {
        'userID': '5',
        'userName': 'Deckard',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '還有一點停車位',
        'time': '6小時前更新'
      },
    ],
    [
      {
        'userID': '1',
        'userName': 'Frank',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '沒有了',
        'time': '1天前更新'
      },
      {
        'userID': '11',
        'userName': 'Anonymous',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '還有很多停車位',
        'time': '5小時前更新'
      },
      {
        'userID': '3',
        'userName': 'Doug Stamper',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '1.7k',
        'content': '快沒了',
        'time': '3天前更新'
      },
      {
        'userID': '4',
        'userName': 'Remy Danton',
        'reputation': 3.7,
        'score': 4.5,
        'nFeedback': '4.8k',
        'content': '剩一些',
        'time': '2天前更新'
      },
    ]
  ],
  'sorted_ans': [
    [
      {
        'userID': '2',
        'userName': 'Skyler White',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '還有一些',
        'time': '5小時前更新'
      },
      {
        'userID': '5',
        'userName': 'Jesse',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '現在還有很多',
        'time': '6小時前更新'
      },
      {
        'userID': '1',
        'userName': 'Walter Black',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '沒有了',
        'time': '1天前更新'
      },
      {
        'userID': '4',
        'userName': 'Gus Fring',
        'reputation': 3.7,
        'score': 4.5,
        'nFeedback': '4.8k',
        'content': '沒了',
        'time': '2天前更新'
      },
      {
        'userID': '3',
        'userName': 'Hank Schrader',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '1.7k',
        'content': '剩下不多',
        'time': '3天前更新'
      },
    ],
    [
      {
        'userID': '2',
        'userName': 'Kat',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '現在的停車格都很上面',
        'time': '5小時前更新'
      },
      {
        'userID': '1',
        'userName': 'Murph Cooper',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '現在還有一些停車格',
        'time': '1天前更新'
      },
      {
        'userID': '3',
        'userName': 'Neil',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '1.7k',
        'content': '連大吃路邊都有停車格',
        'time': '3天前更新'
      },
    ],
    [
      {
        'userID': '2',
        'userName': 'Neil',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '現在有一些停車格',
        'time': '5小時前更新'
      },
      {
        'userID': '5',
        'userName': 'Deckard',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '還有一點停車位',
        'time': '6小時前更新'
      },
      {
        'userID': '1',
        'userName': 'Cooper',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '目前應該沒了，但之後應該會有一些',
        'time': '1天前更新'
      },
      {
        'userID': '4',
        'userName': 'K',
        'reputation': 3.7,
        'score': 4.5,
        'nFeedback': '4.8k',
        'content': '現在沒了',
        'time': '2天前更新'
      },
      {
        'userID': '3',
        'userName': 'Gotham',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '1.7k',
        'content': '快沒了大概剩幾個而已',
        'time': '3天前更新'
      },
    ],
    [
      {
        'userID': '11',
        'userName': 'Anonymous',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '還有很多停車位',
        'time': '5小時前更新'
      },
      {
        'userID': '1',
        'userName': 'Frank',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '沒有了',
        'time': '1天前更新'
      },
      {
        'userID': '4',
        'userName': 'Remy Danton',
        'reputation': 3.7,
        'score': 4.5,
        'nFeedback': '4.8k',
        'content': '剩一些',
        'time': '2天前更新'
      },
      {
        'userID': '3',
        'userName': 'Doug Stamper',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '1.7k',
        'content': '快沒了',
        'time': '3天前更新'
      },
    ]
  ],
};
