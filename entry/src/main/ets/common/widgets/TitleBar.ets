import { TitleBarAttribute } from '../model/TitleBarAttribute';
@Component export struct TitleBar {

  public titleBarAttribute: TitleBarAttribute; // 定义标题栏属性

  build() {
    Flex() {
      Stack({alignContent: Alignment.Start}) {
        if (this.titleBarAttribute && this.titleBarAttribute.backShow) { // 符合条件则显示
          Image($r("app.media.ic_public_back"))
            .width(30)
            .height(50)
            .objectFit(ImageFit.Contain)
            .margin({left: 10})
            .onClick(() => {
              this.titleBarAttribute.backCallback?.call(this) // 返回键点击事件回调
            })
        }
      }
      .layoutWeight(1)

      Stack({alignContent: Alignment.Center}) {
        if (this.titleBarAttribute && this.titleBarAttribute.title) { // 符合条件则显示
          Text(this.titleBarAttribute.title)
            .fontSize(25)
            .fontColor(Color.White)
        }
      }
      .layoutWeight(1)

      Stack({alignContent: Alignment.End}) {
        if (this.titleBarAttribute && this.titleBarAttribute.menuShow) { // 符合条件则显示
          Image($r("app.media.ic_public_back"))
            .width(35)
            .height(55)
            .objectFit(ImageFit.Contain)
            .margin({right: 10})
            .onClick(() => {
              this.titleBarAttribute.menuCallback?.call(this); // 事件回调
            })
        }
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height(55)
    .backgroundColor('#19c8ff')
  }
}