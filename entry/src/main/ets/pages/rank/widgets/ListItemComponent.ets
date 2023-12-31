/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';
import common from '@ohos.app.ability.common';

import hilog from '@ohos.hilog';
import { FontSize, ItemStyle, MATCH_PARENT } from '../../../common/model/Constants';


@Component
export struct ListItemComponent {
  index?: number;
  private name?: Resource;
  //@Prop与@State有相同的语义，但初始化方式不同。@Prop装饰的变量必须使用其父组件提供的@State变量进行初始化
  //@Prop属于单向数据绑定
  vote: string;
  @Prop isSwitchDataSource: boolean;
  // The state is related to the font color of ListItemComponent.
  @State isChange: boolean = false;

  build() {
    Row() {
      Column() {
        if (this.isRenderCircleText()) {
          if (this.index !== undefined) {
            this.CircleText(this.index);
          }
        } else {
          Text(this.index?.toString())
            .lineHeight(ItemStyle.TEXT_LAYOUT_SIZE)
            .textAlign(TextAlign.Center)
            .width(ItemStyle.TEXT_LAYOUT_SIZE)
            .fontWeight(FontWeight.Bold)
            .fontSize(FontSize.SMALL)
        }
      }
      .width(ItemStyle.LAYOUT_WEIGHT_LEFT)
      .alignItems(HorizontalAlign.Start)

      Text(this.name)
        .width(ItemStyle.LAYOUT_WEIGHT_CENTER)
        .fontWeight(FontWeight.Bold)
        .fontSize(FontSize.MIDDLE)
        .fontColor(this.isChange ? ItemStyle.COLOR_BLUE : ItemStyle.COLOR_BLACK)
      Text(this.vote)
        .width(ItemStyle.LAYOUT_WEIGHT_RIGHT)
        .fontWeight(FontWeight.Bold)
        .fontSize(FontSize.SMALL)
        .fontColor(this.isChange ? ItemStyle.COLOR_BLUE : ItemStyle.COLOR_BLACK)
    }
    .height(ItemStyle.BAR_HEIGHT)
    .width(MATCH_PARENT)
    .onClick((event?: ClickEvent) => {
      this.isSwitchDataSource = !this.isSwitchDataSource;
      this.isChange = !this.isChange;

      //调用 router.push () 方法，跳转到 Ability 内的指定页面
      // router.pushUrl({
      //   url: 'pages/TestPage',
      //   params: {
      //     src: 'From Rank List'
      //   }
      // }, router.RouterMode.Single)

      //触发指定事件
      (getContext(this) as common.UIAbilityContext).eventHub.emit('myEvent');
    })
  }

  @Builder CircleText(index: number) {
    Row() {
      Text(this.index?.toString())
        .fontWeight(FontWeight.Bold)
        .fontSize(FontSize.SMALL)
        .fontColor(Color.White);
    }
    .justifyContent(FlexAlign.Center)
    .borderRadius(ItemStyle.CIRCLE_TEXT_BORDER_RADIUS)
    .size({ width: ItemStyle.CIRCLE_TEXT_SIZE,
      height: ItemStyle.CIRCLE_TEXT_SIZE })
    .backgroundColor($r('app.color.circle_text_background'))
  }

  isRenderCircleText(): boolean {


    // Just render the element before the fourth in the list.
    return this.index === 1 || this.index === 2 || this.index === 3;
  }
}