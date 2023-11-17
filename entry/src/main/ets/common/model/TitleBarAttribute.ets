export  class TitleBarAttribute {
  // 返回键属性设置
  public backShow: boolean = false; // 是否显示返回键
  public backCallback: () => void;  // 点击返回键的事件回调

  // 标题属性设置
  public title: string = "";        // 设置标题文本

  // 菜单属性设置
  public menuShow: boolean = false; // 时候显示菜单
  public menuCallback: () => void;  // 点击菜单键的事件回调
}