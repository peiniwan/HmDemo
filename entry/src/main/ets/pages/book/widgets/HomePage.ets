import promptAction from '@ohos.promptAction'
import { GoodsListDialogPage } from './GoodsListDialogPage'

@Entry
@Component
export struct HomePage {
  protected columns = ["自定义弹窗", "优惠券", "其他功能"]
  dialogController: CustomDialogController = new CustomDialogController({
    builder: GoodsListDialogPage({}),
  })

  build() {
    Grid() {
      ForEach(this.columns, (item, index) => { // ForEach语法，循环创建GridItem
        GridItem() { // 子组件只能是GirdItem
          Text(item)
            .fontSize(20)
            .backgroundColor('#aabbcc')
            .width('100%')
            .height(70)
            .textAlign(TextAlign.Center)
            .onClick(() => {
              switch (index) {
                case 0:
                  this.dialogController.open()
                  break
                case 1:
                  promptAction.showToast({
                    message: "click 1 "
                  })
                  break
                case 2:
                  promptAction.showToast({
                    message: "click 2 "
                  })
                  break
                case 3:
                  promptAction.showToast({
                    message: "click 3 "
                  })
                  break
              }
            })
        }
      })
    }
    .columnsTemplate("1fr 1fr 1fr") // 设置Grid为3列，并且均分
    .columnsGap(10) // 设置列间距为10vp
    .rowsGap(10) // 设置行间距为10vp
    .width('100%')
    .height('80%')
    .backgroundColor(Color.Pink)
  }
}