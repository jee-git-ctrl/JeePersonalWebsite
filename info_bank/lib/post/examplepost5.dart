import 'package:info_bank/post/post.dart';
import 'package:info_bank/screens/QApage.dart';

Map<String, dynamic> mObj = {
  'title': '中正大學重要時程',
  'note': '',
  'equQAs': '',
  'tags': ['中正大學', 'CCU', '中正行事曆'],
  'equQAsTitle': '',
  'ans': [
    [
      {
        'userID': '1',
        'userName': 'Ethan Parker',
        'reputation': 1.5,
        'score': 1.6,
        'nFeedback': '1k',
        'content': '學校校慶會放烟花！',
        'time': '3天前更新'
      },
      {
        'userID': '2',
        'userName': 'Olivia Adams',
        'reputation': 3.2,
        'score': 2.8,
        'nFeedbac': '2.5k',
        'content': '學生宿舍進住開始日在8月25日',
        'time': '1天前更新'
      },
      {
        'userID': '3',
        'userName': 'Liam Wilson',
        'reputation': 4.5,
        'score': 4.6,
        'nFeedback': '1.7k',
        'content': '111學年度暑期班考試週在8月28號到9月3號',
        'time': '5小時前更新'
      },
      {
        'userID': '4',
        'userName': 'Ava Mitchell',
        'reputation': 4.2,
        'score': 4.5,
        'nFeedback': '4.8k',
        'content': '9月21是國家防災日演習！',
        'time': '6小時前更新'
      },
      {
        'userID': '11',
        'userName': 'Anonymous',
        'reputation': 4.0,
        'score': 3.9,
        'nFeedback': '5k',
        'content': '加退選課第二階段是4號到18號，大家記得不要錯過',
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
        'content': '12月可以申請第2學期學雜費減免申請',
        'time': '5小時前更新'
      },
      {
        'userID': '2',
        'userName': 'Sophia Davis',
        'reputation': 2.3,
        'score': 1.3,
        'nFeedback': '2.5k',
        'content': '12月25號召開第145次校務會議',
        'time': '1天前更新'
      },
      {
        'userID': '3',
        'userName': 'Mason Harris',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '3.0k',
        'content': '10月國慶有4天連假',
        'time': '2天前更新'
      },
      {
        'userID': '4',
        'userName': 'Isabella Bennett',
        'reputation': 3.7,
        'score': 4.5,
        'nFeedback': '4.8k',
        'content': '學生宿舍退宿截止日在1月12號',
        'time': '3天前更新'
      },
      {
        'userID': '5',
        'userName': 'Lucas Green',
        'reputation': 3.8,
        'score': 4.2,
        'nFeedback': '1.9k',
        'content': '寒假是1月9號開始',
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
        'content': '10月國慶有4天連假',
        'time': '1天前更新'
      },
      {
        'userID': '2',
        'userName': 'Benjamin Turner',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '學生宿舍退宿截止日在1月12號',
        'time': '5小時前更新'
      },
      {
        'userID': '3',
        'userName': 'Charlotte Hughes',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '1.7k',
        'content': '寒假是1月9號開始',
        'time': '3天前更新'
      },
      {
        'userID': '4',
        'userName': 'William Campbell',
        'reputation': 3.7,
        'score': 4.5,
        'nFeedback': '4.8k',
        'content': '12月可以申請第2學期學雜費減免申請',
        'time': '2天前更新'
      },
      {
        'userID': '5',
        'userName': 'Emily Gray',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '加退選課第二階段是4號到18號，大家記得不要錯過',
        'time': '6小時前更新'
      },
      {
        'userID': '6',
        'userName': 'James Foster',
        'reputation': 3.8,
        'score': 4.5,
        'nFeedback': '2.9k',
        'content': '學生宿舍進住開始日在8月25日',
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
        'content': '加退選課第二階段是4號到18號，大家記得不要錯過',
        'time': '1天前更新'
      },
      {
        'userID': '11',
        'userName': 'Anonymous',
        'reputation': 3.5,
        'score': 4.6,
        'nFeedback': '4.8k',
        'content': '10月國慶有4天連假',
        'time': '3天前更新'
      },
      {
        'userID': '3',
        'userName': 'Doug Stamper',
        'reputation': 4.8,
        'score': 4.1,
        'nFeedback': '1.7k',
        'content': '寒假住宿生注意，1月27號全校停電！',
        'time': '5小時前更新'
      },
      {
        'userID': '4',
        'userName': 'Remy Danton',
        'reputation': 3.7,
        'score': 4.5,
        'nFeedback': '4.8k',
        'content': '學生宿舍進住開始日在8月25日',
        'time': '2天前更新'
      },
      {
        'userID': '5',
        'userName': 'Gavin Orsay',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '1月9號寒假就開始了！',
        'time': '6小時前更新'
      },
      {
        'userID': '6',
        'userName': 'Jackie Sharp',
        'reputation': 1.8,
        'score': 0.9,
        'nFeedback': '564',
        'content': '12月可以申請第2學期學雜費減免申請',
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
        'content': '12月可以申請第2學期學雜費減免申請',
        'time': '4小時前更新'
      },
      {
        'userID': '2',
        'userName': 'Skyler White',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '寒假住宿生注意，1月27號全校停電！',
        'time': '5小時前更新'
      },
      {
        'userID': '11',
        'userName': 'Anonymous',
        'reputation': 1.3,
        'score': 2.9,
        'nFeedback': '3.8k',
        'content': '1月9號寒假就開始了！',
        'time': '5小時前更新'
      },
      {
        'userID': '5',
        'userName': 'Jesse',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '學生宿舍進住開始日在8月25日',
        'time': '6小時前更新'
      },
      {
        'userID': '1',
        'userName': 'Walter Black',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '10月國慶有4天連假',
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
        'content': '10月國慶有4天連假',
        'time': '2分鐘前更新'
      },
      {
        'userID': '2',
        'userName': 'Kat',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '加退選課第二階段是4號到18號，大家記得不要錯過',
        'time': '6分鐘前更新'
      },
      {
        'userID': '10',
        'userName': 'Cooper',
        'reputation': 1.3,
        'score': 2.9,
        'nFeedback': '3.8k',
        'content': '寒假住宿生注意，1月27號全校停電！',
        'time': '5小時前更新'
      },
      {
        'userID': '5',
        'userName': 'Officer K',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '學生宿舍進住開始日在8月25日',
        'time': '6小時前更新'
      },
      {
        'userID': '1',
        'userName': 'Murph Cooper',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '12月可以申請第2學期學雜費減免申請',
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
        'content': '加退選課第二階段是4號到18號，大家記得不要錯過',
        'time': '4小時前更新'
      },
      {
        'userID': '2',
        'userName': 'Neil',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '12月可以申請第2學期學雜費減免申請',
        'time': '5小時前更新'
      },
      {
        'userID': '10',
        'userName': 'Wallace',
        'reputation': 1.3,
        'score': 2.9,
        'nFeedback': '3.8k',
        'content': '1月9號寒假就開始了！',
        'time': '5小時前更新'
      },
      {
        'userID': '5',
        'userName': 'Deckard',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '10月國慶有4天連假',
        'time': '6小時前更新'
      },
      {
        'userID': '1',
        'userName': 'Cooper',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '12月25號召開第145次校務會議',
        'time': '1天前更新'
      },
      {
        'userID': '6',
        'userName': 'Kat',
        'reputation': 1.8,
        'score': 0.9,
        'nFeedback': '564',
        'content': '寒假住宿生注意，1月27號全校停電！',
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
        'content': '12月可以申請第2學期學雜費減免申請',
        'time': '4小時前更新'
      },
      {
        'userID': '2',
        'userName': 'Claire',
        'reputation': 3.1,
        'score': 1.9,
        'nFeedback': '2.5k',
        'content': '10月國慶有4天連假',
        'time': '5小時前更新'
      },
      {
        'userID': '11',
        'userName': 'Anonymous',
        'reputation': 1.3,
        'score': 2.9,
        'nFeedback': '3.8k',
        'content': '寒假住宿生注意，1月27號全校停電！',
        'time': '5小時前更新'
      },
      {
        'userID': '5',
        'userName': 'Gavin Orsay',
        'reputation': 2.5,
        'score': 3.3,
        'nFeedback': '1.9k',
        'content': '1月9號寒假就開始了！',
        'time': '6小時前更新'
      },
      {
        'userID': '1',
        'userName': 'Frank',
        'reputation': 4.2,
        'score': 2.8,
        'nFeedback': '3.6k',
        'content': '加退選課第二階段是4號到18號，大家記得不要錯過',
        'time': '1天前更新'
      },
      {
        'userID': '6',
        'userName': 'Jackie Sharp',
        'reputation': 1.8,
        'score': 0.9,
        'nFeedback': '564',
        'content': '學生宿舍進住開始日在8月25日',
        'time': '1天前更新'
      },
    ]
  ],
};
