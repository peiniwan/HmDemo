
@Component export struct CalculatorGrid {

  callback: (expression: string, result: string) => void;           // 对外的事件回调

  private screenWidth: number = px2vp(1080);                        // 屏幕宽度
  private rowSpace: number = 10;                                    // 行间距
  private rowCount: number = 5;                                     // 行数
  private columnSpace: number = 15;                                 // 列间距
  private columnCount: number = 4;                                  // 列数
  private itemSize: number = 0;                                     // Item尺寸
  private items: Array<ItemAttribute> = [];                         // 按键集合
  // private calculator: Calculator = null;                            // 负责计算表达式

  build() {
    Grid() {
      ForEach(this.items, (item: ItemAttribute, index: number) => { // ForEach语法
        GridItem() {
          Text(item.fontText)
            .fontSize(item.fontSize)
            .fontColor(item.fontColor)
            .id("index" + index)
        }
        .width('100%')
        .height('100%')
        .backgroundColor(item.bgColor)
        .borderRadius(this.itemSize)                                // 设置圆角
        .rowStart(index == 15 ? 3 : 0)                              // 第16个GridItem占用2行
        .rowEnd(index == 15 ? 4 : 0)                                // 第16个GridItem占用2行
        .columnStart(index == 16 ? 0 : 0)                           // 第17个GridItem占用2列
        .columnEnd((index == 16 ? 1 : 0))                           // 第17个GridItem占用2列
        .onClick(() => {
          // this.calculator.onItemClicked(item.fontText)
        })
      })
    }
    .padding({left: this.columnSpace, right: this.columnSpace})
    .columnsTemplate("1fr 1fr 1fr 1fr")                             // Grid宽度均分成4份
    .rowsTemplate("1fr 1fr 1fr 1fr 1fr")                            // Grid高度均分成5份
    .rowsGap(this.rowSpace)                                         // 设置行间距
    .columnsGap(this.columnSpace)                                   // 设置列间距
    .width('100%')
    .height(this.itemSize * this.rowCount + this.rowSpace * (this.rowCount - 1))
  }

  // aboutToAppear() {
  //   this.itemSize = (this.screenWidth - (this.columnSpace * (this.columnCount + 1))) / this.columnCount;               // Item尺寸
  //   this.items = ItemAttribute.mock();
  //   this.calculator = new Calculator((expression: string, result: string) => {
  //     this.callback?.call(this, expression, result);
  //   });
  // }
}

class ItemAttribute {

  constructor(public fontText: string, public fontSize: number = 26, public fontColor: string = "#ffffff", public bgColor: string = "#aabbcc") {}

  // public static mock(): Array<ItemAttribute> {
  //   let items = new Array<ItemAttribute>();
  //   items.push(new ItemAttribute(Symbols.SYMBOL_CLEAR, 26, "#010101", "#949494"));
  //   // ……
  //   items.push(new ItemAttribute(Symbols.SYMBOL_DOT, 26, "#ffffff", "#262626"));
  //   return items;
  // }
}
