#r "C:\Program Files\workspacer\workspacer.Shared.dll"

#r "C:\Program Files\workspacer\plugins\workspacer.Bar\workspacer.Bar.dll"

#r "C:\Program Files\workspacer\plugins\workspacer.Gap\workspacer.Gap.dll"

#r "C:\Program Files\workspacer\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"

#r "C:\Program Files\workspacer\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"

#r "C:\Program Files\workspacer\plugins\workspacer.TitleBar\workspacer.TitleBar.dll"

using System;
using System.Collections.Generic;
using workspacer;
using workspacer.Bar;
using workspacer.Bar.Widgets;
using workspacer.Gap;
using workspacer.ActionMenu;
using workspacer.FocusIndicator;
using workspacer.TitleBar;

#region Gruvbox colors
private var gruvboxColors = new Dictionary<string, Color>()
{
  { "dark0_hard",     new Color(0x1d, 0x20, 0x21) },
  { "dark0",          new Color(0x28, 0x28, 0x28) },
  { "dark0_soft",     new Color(0x32, 0x30, 0x2f) },
  { "dark1",          new Color(0x3c, 0x38, 0x36) },
  { "dark2",          new Color(0x50, 0x49, 0x45) },
  { "dark3",          new Color(0x66, 0x5c, 0x54) },
  { "dark4",          new Color(0x7c, 0x6f, 0x64) },
  { "dark4_256",      new Color(0x7c, 0x6f, 0x64) },

  { "gray_245",       new Color(0x92, 0x83, 0x74) },
  { "gray_244",       new Color(0x92, 0x83, 0x74) },

  { "light0_hard",    new Color(0xf9, 0xf5, 0xd7) },
  { "light0",         new Color(0xfb, 0xf1, 0xc7) },
  { "light0_soft",    new Color(0xf2, 0xe5, 0xbc) },
  { "light1",         new Color(0xeb, 0xdb, 0xb2) },
  { "light2",         new Color(0xd5, 0xc4, 0xa1) },
  { "light3",         new Color(0xbd, 0xae, 0x93) },
  { "light4",         new Color(0xa8, 0x99, 0x84) },
  { "light4_256",     new Color(0xa8, 0x99, 0x84) },

  { "bright_red",     new Color(0xfb, 0x49, 0x34) },
  { "bright_green",   new Color(0xb8, 0xbb, 0x26) },
  { "bright_yellow",  new Color(0xfa, 0xbd, 0x2f) },
  { "bright_blue",    new Color(0x83, 0xa5, 0x98) },
  { "bright_purple",  new Color(0xd3, 0x86, 0x9b) },
  { "bright_aqua",    new Color(0x8e, 0xc0, 0x7c) },
  { "bright_orange",  new Color(0xfe, 0x80, 0x19) },

  { "neutral_red",    new Color(0xcc, 0x24, 0x1d) },
  { "neutral_green",  new Color(0x98, 0x97, 0x1a) },
  { "neutral_yellow", new Color(0xd7, 0x99, 0x21) },
  { "neutral_blue",   new Color(0x45, 0x85, 0x88) },
  { "neutral_purple", new Color(0xb1, 0x62, 0x86) },
  { "neutral_aqua",   new Color(0x68, 0x9d, 0x6a) },
  { "neutral_orange", new Color(0xd6, 0x5d, 0x0e) },

  { "faded_red",      new Color(0x9d, 0x00, 0x06) },
  { "faded_green",    new Color(0x79, 0x74, 0x0e) },
  { "faded_yellow",   new Color(0xb5, 0x76, 0x14) },
  { "faded_blue",     new Color(0x07, 0x66, 0x78) },
  { "faded_purple",   new Color(0x8f, 0x3f, 0x71) },
  { "faded_aqua",     new Color(0x42, 0x7b, 0x58) },
  { "faded_orange",   new Color(0xaf, 0x3a, 0x03) },
};
#endregion

#region ColorScheme
public struct ColorScheme
{
  private readonly Color bg0;
  private readonly Color bg1;
  private readonly Color bg2;
  private readonly Color bg3;
  private readonly Color bg4;
  private readonly Color gray;
  private readonly Color fg0;
  private readonly Color fg1;
  private readonly Color fg2;
  private readonly Color fg3;
  private readonly Color fg4;
  private readonly Color fg4_256;
  private readonly Color red;
  private readonly Color green;
  private readonly Color yellow;
  private readonly Color blue;
  private readonly Color purple;
  private readonly Color aqua;
  private readonly Color orange;

  public ColorScheme(
	  Color bg0,
	  Color bg1,
	  Color bg2,
	  Color bg3,
	  Color bg4,
	  Color gray,
	  Color fg0,
	  Color fg1,
	  Color fg2,
	  Color fg3,
	  Color fg4,
	  Color fg4_256,
	  Color red,
	  Color green,
	  Color yellow,
	  Color blue,
	  Color purple,
	  Color aqua,
	  Color orange
  )
  {
    this.bg0 = bg0;
    this.bg1 = bg1;
    this.bg2 = bg2;
    this.bg3 = bg3;
    this.bg4 = bg4;
    this.gray = gray;
    this.fg0 = fg0;
    this.fg1 = fg1;
    this.fg2 = fg2;
    this.fg3 = fg3;
    this.fg4 = fg4;
    this.fg4_256 = fg4_256;
    this.red = red;
    this.green = green;
    this.yellow = yellow;
    this.blue = blue;
    this.purple = purple;
    this.aqua = aqua;
    this.orange = orange;
  }

  public Color Bg0 => bg0;
  public Color Bg1 => bg1;
  public Color Bg2 => bg2;
  public Color Bg3 => bg3;
  public Color Bg4 => bg4;
  public Color Gray => gray;
  public Color Fg0 => fg0;
  public Color Fg1 => fg1;
  public Color Fg2 => fg2;
  public Color Fg3 => fg3;
  public Color Fg4 => fg4;
  public Color Fg4_256 => fg4_256;
  public Color Red => red;
  public Color Green => green;
  public Color Yellow => yellow;
  public Color Blue => blue;
  public Color Purple => purple;
  public Color Aqua => aqua;
  public Color Orange => orange;
}
#endregion

public ColorScheme GruvboxDarkSoft = new(
  bg0: gruvboxColors["dark0_soft"],
  bg1: gruvboxColors["dark1"],
  bg2: gruvboxColors["dark2"],
  bg3: gruvboxColors["dark3"],
  bg4: gruvboxColors["dark4"],
  gray: gruvboxColors["gray_245"],
  fg0: gruvboxColors["light0"],
  fg1: gruvboxColors["light1"],
  fg2: gruvboxColors["light2"],
  fg3: gruvboxColors["light3"],
  fg4: gruvboxColors["light4"],
  fg4_256: gruvboxColors["light4_256"],
  red: gruvboxColors["bright_red"],
  green: gruvboxColors["bright_green"],
  yellow: gruvboxColors["bright_yellow"],
  blue: gruvboxColors["bright_blue"],
  purple: gruvboxColors["bright_purple"],
  aqua: gruvboxColors["bright_aqua"],
  orange: gruvboxColors["bright_orange"]
);

private const int FONT_SIZE = 16;
private const string FONT_NAME = "FixedsysExcelsiorIIIb NF";
// private const string FONT_NAME = "CaskaydiaCove NF";

private const int BAR_HEIGHT = 30;

Action<IConfigContext> doConfig = (context) =>
{
  var gap = BAR_HEIGHT - 8;

  var backgroundColor = GruvboxDarkSoft.Bg0;
  var foregroundColor = GruvboxDarkSoft.Fg1;
  var focusIndicatorColor = GruvboxDarkSoft.Red;
  var emptyColor = GruvboxDarkSoft.Gray;
  var backColor = GruvboxDarkSoft.Aqua;

  // Uncomment to switch update branch (or to disable updates)
  //context.Branch = Branch.None;

  var gapPlugin = context.AddGap(new GapPluginConfig()
  {
    InnerGap = gap,
    OuterGap = gap / 2,
    Delta = gap / 2
  });

  context.AddBar(new BarPluginConfig()
  {
    BarTitle = "workspacer.Bar",
    BarHeight = BAR_HEIGHT,
    FontSize = FONT_SIZE,
    FontName = FONT_NAME,
    DefaultWidgetForeground = foregroundColor,
    DefaultWidgetBackground = backgroundColor,
    Background = backgroundColor,
    LeftWidgets = () => new IBarWidget[]
    {
      new WorkspaceWidget()
      {
        WorkspaceHasFocusColor = focusIndicatorColor,
        WorkspaceEmptyColor = emptyColor,
        WorkspaceIndicatingBackColor = backColor,
      },
      // new TextWidget("\uf178"),
      new TextWidget("\uf555"),
      new TitleWidget()
      {
        IsShortTitle = true
      }
    },
    RightWidgets = () => new IBarWidget[]
    {
      new BatteryWidget(),
      new TimeWidget(1000, "HH:mm:ss dd-MMM-yyyy"),
      new ActiveLayoutWidget()
    }
  });

  context.AddFocusIndicator(new FocusIndicatorPluginConfig()
  {
    BorderColor = focusIndicatorColor,
    BorderSize = 10,
    TimeToShow = 200,
  });

  // I want to hide the title bar on ALL windows
  // var titleBarPluginConfig = new TitleBarPluginConfig(new TitleBarStyle(showTitleBar: false, showSizingBorder: false));
  var titleBarPluginConfig = new TitleBarPluginConfig(new TitleBarStyle(false, false));
  // titleBarPluginConfig.SetWindowTitleMAtch("Notepad", new TitleBarStyle(false, false));
  context.AddTitleBar(titleBarPluginConfig);

  // var actionMenu = context.AddActionMenu();

  var actionMenu = context.AddActionMenu(new ActionMenuPluginConfig()
  {
    RegisterKeybind = true,
    KeybindMod = KeyModifiers.LAlt,
    KeybindKey = Keys.P,
    MenuTitle = "workspacer.ActionMenu",
    MenuHeight = 50,
    MenuWidth = 500,
    FontName = FONT_NAME,
    FontSize = 16,
    Matcher = new OrMatcher(new PrefixMatcher(), new ContiguousMatcher()),
    Background = backgroundColor,
    Foreground = foregroundColor,
  });

  // var subMenu = actionMenu.Create();
  // subMenu.Add("do a thing", () => Console.WriteLine("do a thing"));
  // subMenu.AddMenu("sub-sub menu", () => Console.WriteLine("sub-sub menu"));
  // subMenu.AddFreeForm("Console WriteLine", (s) => Console.WriteLine(s));

  // actionMenu.DefaultMenu.AddMenu("make sub menu", subMenu);

  // var newMenu = actionMenu.Create();
  // newMenu.Add("fun!", () => Console.WriteLine("fun!"));

  // context.Keybinds.Subscribe(KeyModifiers.LAlt, Keys.Y, () => actionMenu.ShowMenu(newMenu));

  // Deal with unicode codepoints

  context.WorkspaceContainer.CreateWorkspaces("💻dev", "🌎web", "📨mail", "✍🏻comm", "🎶vibes");
  context.CanMinimizeWindows = true; // false by default
};

return doConfig;
