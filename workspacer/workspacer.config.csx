#r "C:\Program Files\workspacer\workspacer.Shared.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Bar\workspacer.Bar.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Gap\workspacer.Gap.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"

using System;
using workspacer;
using workspacer.Bar;
using workspacer.Bar.Widgets;
using workspacer.Gap;
using workspacer.ActionMenu;
using workspacer.FocusIndicator;

return new Action<IConfigContext>((IConfigContext context) =>
{
  var fontSize = 9;
	var fontName = "CaskaydiaCove NF";

  var barHeight = 19;
  var gap = barHeight - 8;

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
    FontSize = fontSize,
    FontName = fontName,
    BarHeight = barHeight,
    LeftWidgets = () => new IBarWidget[]
    {
      new WorkspaceWidget(),
      new TextWidget(""),
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

	context.AddFocusIndicator();

	var actionMenu = context.AddActionMenu();

	context.WorkspaceContainer.CreateWorkspaces("1", "2", "3", "4", "5");
	context.CanMinimizeWindows = true; // false by default
});
