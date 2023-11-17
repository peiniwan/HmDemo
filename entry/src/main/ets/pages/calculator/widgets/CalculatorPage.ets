// import { TitleBar } from '../../../common/widgets/TitleBar';
// @Entry
// @Component
// struct CalculatorPage {
//   @State arrowDown: boolean = true;
//   @State result: string = "0";
//   @State expressions: Array<string> = new Array<string>();
//   private inputScroller: Scroller = new Scroller();
//   private listScroller: Scroller = new Scroller();
//   private saveController: CustomDialogController = null;
//
//   build() {
//     Column() {
//
//       TitleBar({ titleBarAttribute: {
//         backShow: true,
//         backCallback: () => {
//           // Logger.log("left click")
//         },
//         title: "极简计算器",
//         menuShow: true,
//         menuCallback: () => {
//           // Logger.log("right click")
//         }
//       } })
//
//       Text()
//         .width('100%')
//         .height("2px")
//         .backgroundColor("#ffffff")
//
//       List({ scroller: this.listScroller }) {
//         // LazyForEach()
//         ForEach(this.expressions, (item: string, index?: number) => {
//           ListItem() {
//             Text(item)
//               .fontSize(30)
//               .fontColor(Color.White)
//               .textAlign(TextAlign.End)
//               .padding({ top: 5, bottom: 5, right: 5 })
//               .width("100%")
//           }
//           .width("100%")
//         }, (item: string, index?: number) => {
//           return item + index;
//         });
//       }
//       .divider({
//         strokeWidth: 0.5,
//         color: "#ffffff"
//       })
//       .layoutWeight(1)
//       .width('100%')
//
//       if (this.arrowDown) {
//         Scroll(this.inputScroller) {
//           Text(this.result)
//             .height(60)
//             .fontSize(40)
//             .fontColor(Color.White)
//             .maxLines(1)
//             .textAlign(TextAlign.End)
//             .textOverflow({ overflow: TextOverflow.None })
//             .padding({ left: 5, right: 5 })
//         }
//         .align(Alignment.End)
//         .scrollable(ScrollDirection.Horizontal)
//         .scrollBar(BarState.Off)
//         .width('100%')
//         .height(65)
//       }
//
//       Image(this.arrowDown ? $r("app.media.icon_arrow_down") : $r("app.media.icon_arrow_up"))
//         .width(20)
//         .height(30)
//         .onClick(() => {
//           this.arrowDown = !this.arrowDown;
//         })
//
//       if (this.arrowDown) {
//         CalculatorGrid({
//           callback: (result: string, expression: string) => {
//             this.result = result;
//             this.inputScroller.scrollEdge(Edge.End);
//             if (expression) {
//               this.expressions.push(expression + "=" + result);
//               this.listScroller.scrollToIndex(this.expressions.length - 1);
//               Logger.log(expression + "=" + result);
//             }
//           }
//         })
//       } else {
//         Row() {
//           Text("存档")
//             .height("100%")
//             .layoutWeight(1)
//             .fontSize(24)
//             .fontColor(Color.Black)
//             .textAlign(TextAlign.Center)
//             .backgroundColor("#aabbcc")
//             .onClick(() => {
//               this.saveController.open();
//             })
//           Text("清空")
//             .height("100%")
//             .layoutWeight(1)
//             .fontSize(24)
//             .fontColor(Color.White)
//             .textAlign(TextAlign.Center)
//             .backgroundColor($r("app.color.main_theme"))
//             .onClick(() => {
//               this.expressions.splice(0, this.expressions.length);
//               this.result = "0";
//             })
//         }
//         .width("100%")
//         .height(60)
//         .backgroundColor("#aabbcc")
//       }
//     }
//     .backgroundColor('#010101')
//     .width('100%')
//     .height('100%')
//   }
//
//   // aboutToAppear() {
//   //   this.saveController = new CustomDialogController({
//   //     builder: SaveExpressionDialog(),
//   //     autoCancel: true,
//   //     customStyle: true,
//   //     alignment: DialogAlignment.Bottom
//   //   });
//   // }
//
//   onBackPress() {
//     Logger.log("onBackPress")
//     return BackPressUtils.onBackPress();
//   }
// }