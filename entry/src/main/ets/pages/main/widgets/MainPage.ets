import promptAction from '@ohos.promptAction';
import hilog from '@ohos.hilog';
import { APP_EXIT_INTERVAL, MATCH_PARENT, TIME } from '../../../common/model/Constants';
import { RankPage } from '../../rank/widgets/RankPage';
import { NavList, TabId } from '../model/NavDataModel';
import { HomePage } from '../../book/widgets/HomePage';

@Entry
@Component
struct MainPage {
  private tabsController: TabsController = new TabsController();
  @State currentIndex: number = 0
  //上一次点击退出的时间戳
  private lastPressedBack: number = 0

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        HomePage()
          .size({ width: MATCH_PARENT, height: MATCH_PARENT })
      }.tabBar(this.TabBuilder(TabId.HOME))

      TabContent() {
        RankPage()
          .size({ width: MATCH_PARENT, height: MATCH_PARENT })
      }.tabBar(this.TabBuilder(TabId.ACHIEVEMENT))

      TabContent() {

      }.tabBar(this.TabBuilder(TabId.MINE))
    }
    //禁止滑动切换
    .scrollable(true)
    //Tabs的属性barMode是控制导航栏是否可以滚动，默认值为Fixed。
    .barMode(BarMode.Fixed)
    .onChange((index) => {
      this.currentIndex = index
    })
  }

  @Builder TabBuilder(index: number) {
    Column() {
      Image(this.currentIndex === index ? NavList[index].icon_selected : NavList[index].icon)
        .size({ width: 20, height: 20 })

      Text(NavList[index].text)
        .fontColor(this.currentIndex === NavList[index].id ? '#1698CE' : '#6B6B6B')
        .fontSize(10)
        .margin({ top: 3 })
    }
    .onClick((event) => {
      this.currentIndex = index;
      this.tabsController.changeIndex(this.currentIndex)
    })
  }

  onBackPress() {
    let currentMil = new Date().getTime()
    if (currentMil - this.lastPressedBack > APP_EXIT_INTERVAL) {
      promptAction.showToast({
        message: $r('app.string.prompt_text'),
        duration: TIME
      });
      this.lastPressedBack = currentMil;
      return true;
    }
    return false;
  }

  onPageShow() {
    console.log('onPageShow执行了');


  }
}