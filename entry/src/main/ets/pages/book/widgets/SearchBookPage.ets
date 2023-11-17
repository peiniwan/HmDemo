import { MATCH_PARENT } from '../../../common/model/Constants'

@Entry
@Component
export struct SearchBookPage {
  protected columns: number[] = new Array(10).fill(0);

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


      Grid() {
        ForEach(this.columns, (item, index) => {
          GridItem() { // 子组件只能是GirdItem
            Column() {
              Image('https://gd-hbimg.huaban.com/56b73c8daf9905de7df34343f91a2dc8706eafb92ccc4-kTbbEK_fw480webp')
                .objectFit(ImageFit.Auto)
                .height('20%').width(MATCH_PARENT).borderRadius({ topLeft: 12, topRight: 12 })

              Text(`适合${index.toString()}岁宝宝的英语绘本`)
                .fontSize(15).fontWeight(FontWeight.Bold)
                .textAlign(TextAlign.Start).margin(10)

              Text(`$ ${index.toString()}`)
                .fontSize(16).fontWeight(FontWeight.Bold).fontColor(Color.Red)
                .margin({top:3,left:10,right:10,bottom:10})

            }.backgroundColor(Color.White).borderRadius(12).alignItems(HorizontalAlign.Start)

          }
        })
      }
      .columnsTemplate("1fr 1fr")
      .columnsGap(10)
      .rowsGap(10)
      .width('100%')

    }.padding({ left: 16, top: 24, right: 16, bottom: 10 }).backgroundColor($r('app.color.background_page'))

  }
}