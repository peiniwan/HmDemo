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

import AppContext from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import { FontSize, TitleBarStyle, MATCH_PARENT } from '../../../common/model/Constants';

@Component
export struct TitleComponent {
  //@Link装饰的变量可以和父组件的@State变量建立双向数据绑定，需要注意的是：@Link变量不能在组件内部进行初始化。
  @Link isRefreshData: boolean; // User click the button to decide whether to switch data.
  @State title: Resource = $r('app.string.title_default');

  // dialogController: CustomDialogController = new CustomDialogController({
  //   builder: GoodsListDialogPage({}),
  // })

  onPageShow() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TitleComponent onPageShow');
  }

  build() {
    Row() {
      Row() {
        Image($r('app.media.ic_public_back'))
          .height(TitleBarStyle.IMAGE_BACK_SIZE)
          .width(TitleBarStyle.IMAGE_BACK_SIZE)
          .margin({ right: TitleBarStyle.IMAGE_BACK_MARGIN_RIGHT })
          .onClick(() => {
            // let handler = getContext(this) as AppContext.UIAbilityContext;
            // handler.terminateSelf();
          })
        Text(this.title)
          .fontSize(FontSize.LARGE)
      }
      .width(TitleBarStyle.WEIGHT)
      .height(MATCH_PARENT)
      .justifyContent(FlexAlign.Start)

      Row() {
        Image($r('app.media.loading'))
          .height(TitleBarStyle.IMAGE_LOADING_SIZE)
          .width(TitleBarStyle.IMAGE_LOADING_SIZE)
          .onClick(() => {
            // this.dialogController.open()
            this.isRefreshData = !this.isRefreshData;
          })
      }
      .width(TitleBarStyle.WEIGHT)
      .height(MATCH_PARENT)
      .justifyContent(FlexAlign.End)
    }
    .width(MATCH_PARENT)
    .padding({ left: TitleBarStyle.BAR_MARGIN_HORIZONTAL,
      right: TitleBarStyle.BAR_MARGIN_HORIZONTAL })
    .margin({ top: TitleBarStyle.BAR_MARGIN_TOP })
    .height(TitleBarStyle.BAR_HEIGHT)
    .justifyContent(FlexAlign.SpaceAround)
  }
}