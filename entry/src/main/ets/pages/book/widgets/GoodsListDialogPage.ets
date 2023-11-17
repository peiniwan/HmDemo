import prompt from '@ohos.prompt';
import promptAction from '@ohos.promptAction';
import { Style, MATCH_PARENT } from '../../../common/model/Constants';

@Entry
@CustomDialog
export struct GoodsListDialogPage {
  private myArray: number[] = [991, 992, 993];
  controller: CustomDialogController

  build() {
    Column() {
      Row() {
        Text() {
          Span('全部商品').fontColor('#0F141A').fontSize(17).fontWeight(FontWeight.Bold)
          Span('（3件）').fontColor('#909CAC').fontSize(12)
        }

        Image($r('app.media.ic_close'))
          .objectFit(ImageFit.Auto)
          .height(24).width(24).onClick(() => {
          this.controller.close()
        })

      }.justifyContent(FlexAlign.SpaceBetween).width(MATCH_PARENT).backgroundColor($r('app.color.white'))

      this.buildList()
    }
    .margin({ left: 16, top: 18, right: 16, bottom: 18 })
    .width('90%')
    // .backgroundColor($r('app.color.font_description'))

  }

  @Builder buildList() {
    List({ space: 10 }) {
      ForEach(this.myArray,
        (item: number, index?: number) => {
          ListItem() {
            RelativeContainer() {
              Image('')
                .id('ivCover')
                .backgroundColor($r('app.color.rank_third_gradient_end'))
                .width(80)
                .height(80)
                .alignRules({
                  left: { anchor: '__container__', align: HorizontalAlign.Start },
                  center: { anchor: '__container__', align: VerticalAlign.Center },
                })
              Text('基本功小学数学一年基本功小学数学一年')
                .id('tvName')
                .alignRules({
                  left: { anchor: 'ivCover', align: HorizontalAlign.End },
                  right: { anchor: '__container__', align: HorizontalAlign.End },
                  top: { anchor: '__container__', align: VerticalAlign.Top }
                })
                .margin({ top: 10, left: 10 })
                .maxLines(1)
                .fontSize(15)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Text(`$${item + 1}`).id('tvMoney').alignRules({
                left: { anchor: 'ivCover', align: HorizontalAlign.End },
                bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
              }).margin({ left: 10, bottom: 10 })
              Button('立即抢购', {
                type: ButtonType.Normal
              })
                .id('btBuy')
                .alignRules({
                  bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
                  right: { anchor: '__container__', align: HorizontalAlign.End }
                })
                .padding({ left: 14, right: 14, bottom: 6, top: 6 })
                .borderRadius(8)
                .fontColor($r('app.color.rank_first_gradient_start'))
                .backgroundColor($r('app.color.bt_background'))
                .margin({ right: 14, bottom: 6 })
                .onClick(() => {
                  promptAction.showToast({
                    message: "Button onClick"
                  })
                })
            }
            .width(MATCH_PARENT)
            .height(92)
            .backgroundColor($r('app.color.rank_first_gradient_start'))
            .borderRadius(12)
            .padding(6) //padding为什么不生效
          }
        }, item => item + 3)
    }
    .width(MATCH_PARENT)
    // .height(Style.LIST_HEIGHT)
    .divider({ strokeWidth: Style.STROKE_WIDTH }).margin({ top: 20 })
  }
}