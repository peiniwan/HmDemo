import { MATCH_PARENT } from '../../../common/model/Constants'

@Entry
@Component
export struct SearchBookPage {
  build() {
    Column() {
      Row() {
        Image($r('app.media.ic_public_back'))
          .objectFit(ImageFit.Auto)
          .height(24)
          .width(24)
          .onClick(() => {

          })
          .margin({ right: 10 })
        TextInput({ placeholder: "搜索书籍" })
          .backgroundColor(Color.Pink)
          .width("75%")
          .placeholderColor($r('app.color.rank_third_text'))
          .onSubmit((EnterKeyType) => {
            console.info(EnterKeyType + '输入法回车键的类型值')
          })
        Button('搜索').fontColor($r("app.color.item_color_black")).backgroundColor(Color.White).onClick(() => {

        })

      }.justifyContent(FlexAlign.SpaceBetween).width(MATCH_PARENT).height(50).alignItems(VerticalAlign.Center)

    }.padding({ left: 16, top: 24, right: 16, bottom: 10 })



  }
}