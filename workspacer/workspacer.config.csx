#r "C:\Program Files\workspacer\workspacer.Shared.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Bar\workspacer.Bar.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Gap\workspacer.Gap.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.TitleBar\workspacer.TitleBar.dll"

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

using workspacer;
using workspacer.Bar;
using workspacer.Bar.Widgets;
using workspacer.Gap;
using workspacer.ActionMenu;
using workspacer.FocusIndicator;
using workspacer.TitleBar;

// Gruvbox colors {{{
private var gruvboxColors = new Dictionary<string, Color>()
{
    { "dark0_hard", new Color(0x1d, 0x20, 0x21) },
    { "dark0", new Color(0x28, 0x28, 0x28) },
    { "dark0_soft", new Color(0x32, 0x30, 0x2f) },
    { "dark1", new Color(0x3c, 0x38, 0x36) },
    { "dark2", new Color(0x50, 0x49, 0x45) },
    { "dark3", new Color(0x66, 0x5c, 0x54) },
    { "dark4", new Color(0x7c, 0x6f, 0x64) },
    { "dark4_256", new Color(0x7c, 0x6f, 0x64) },
    { "gray_245", new Color(0x92, 0x83, 0x74) },
    { "gray_244", new Color(0x92, 0x83, 0x74) },
    { "light0_hard", new Color(0xf9, 0xf5, 0xd7) },
    { "light0", new Color(0xfb, 0xf1, 0xc7) },
    { "light0_soft", new Color(0xf2, 0xe5, 0xbc) },
    { "light1", new Color(0xeb, 0xdb, 0xb2) },
    { "light2", new Color(0xd5, 0xc4, 0xa1) },
    { "light3", new Color(0xbd, 0xae, 0x93) },
    { "light4", new Color(0xa8, 0x99, 0x84) },
    { "light4_256", new Color(0xa8, 0x99, 0x84) },
    { "bright_red", new Color(0xfb, 0x49, 0x34) },
    { "bright_green", new Color(0xb8, 0xbb, 0x26) },
    { "bright_yellow", new Color(0xfa, 0xbd, 0x2f) },
    { "bright_blue", new Color(0x83, 0xa5, 0x98) },
    { "bright_purple", new Color(0xd3, 0x86, 0x9b) },
    { "bright_aqua", new Color(0x8e, 0xc0, 0x7c) },
    { "bright_orange", new Color(0xfe, 0x80, 0x19) },
    { "neutral_red", new Color(0xcc, 0x24, 0x1d) },
    { "neutral_green", new Color(0x98, 0x97, 0x1a) },
    { "neutral_yellow", new Color(0xd7, 0x99, 0x21) },
    { "neutral_blue", new Color(0x45, 0x85, 0x88) },
    { "neutral_purple", new Color(0xb1, 0x62, 0x86) },
    { "neutral_aqua", new Color(0x68, 0x9d, 0x6a) },
    { "neutral_orange", new Color(0xd6, 0x5d, 0x0e) },
    { "faded_red", new Color(0x9d, 0x00, 0x06) },
    { "faded_green", new Color(0x79, 0x74, 0x0e) },
    { "faded_yellow", new Color(0xb5, 0x76, 0x14) },
    { "faded_blue", new Color(0x07, 0x66, 0x78) },
    { "faded_purple", new Color(0x8f, 0x3f, 0x71) },
    { "faded_aqua", new Color(0x42, 0x7b, 0x58) },
    { "faded_orange", new Color(0xaf, 0x3a, 0x03) },
};
// }}}

// ColorScheme struct {{{
public struct ColorScheme
{
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
        Bg0 = bg0;
        Bg1 = bg1;
        Bg2 = bg2;
        Bg3 = bg3;
        Bg4 = bg4;
        Gray = gray;
        Fg0 = fg0;
        Fg1 = fg1;
        Fg2 = fg2;
        Fg3 = fg3;
        Fg4 = fg4;
        Fg4_256 = fg4_256;
        Red = red;
        Green = green;
        Yellow = yellow;
        Blue = blue;
        Purple = purple;
        Aqua = aqua;
        Orange = orange;
    }

    public Color Bg0 { get; }
    public Color Bg1 { get; }
    public Color Bg2 { get; }
    public Color Bg3 { get; }
    public Color Bg4 { get; }
    public Color Gray { get; }
    public Color Fg0 { get; }
    public Color Fg1 { get; }
    public Color Fg2 { get; }
    public Color Fg3 { get; }
    public Color Fg4 { get; }
    public Color Fg4_256 { get; }
    public Color Red { get; }
    public Color Green { get; }
    public Color Yellow { get; }
    public Color Blue { get; }
    public Color Purple { get; }
    public Color Aqua { get; }
    public Color Orange { get; }
}
// }}}

// GruboxDarkSoft colorscheme {{{
public ColorScheme GruvboxDarkSoft =
    new(
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
// }}}

private const int FONT_SIZE = 10;
private const string FONT_NAME = "FixedsysExcelsiorIIIb NF";

// private const string FONT_NAME = "CaskaydiaCove NF";

private const int BAR_HEIGHT = 15;

// Workspace names {{{
private const string WORKSPACE_DEV = "💻dev";
private const string WORKSPACE_WEB = "🌎web";
private const string WORKSPACE_MAIL = "📨mail";
private const string WORKSPACE_COMM = "✍🏻comm";
private const string WORKSPACE_VIBES = "🎶vibes";
private const string WORKSPACE_STREAM = "🎙️stream";
private const string WORKSPACE_GAME = "🕹️game";
// }}}

// Window titles {{{
private const string WIN_TITLE_INSTALLER = "Windows Installer";
private const string WIN_TITLE_DISCORD = "Discord";
private const string WIN_TITLE_TEAMS = "Microsoft Teams";
private const string WIN_TITLE_SLACK = "Slack";
private const string WIN_TITLE_ZOOM = "Zoom";
private const string WIN_TITLE_OUTLOOK = "Outlook";
private const string WIN_TITLE_OBS = "OBS";
private const string WIN_TITLE_SNAPCHAT = "Snapchat";
private const string WIN_TITLE_STEAM = "Steam";
private const string WIN_TITLE_EVALDRAW = "Evaldraw by Ken Silverman";
private const string WIN_TITLE_EAC = "EAC Launcher Progress Bar Window";
private const string WIN_TITLE_FALLOUT = "Fallout";
private const string WIN_TITLE_MORROWIND = "Morrowind";
private const string WIN_TITLE_OPENMW = "OpenMW";
private const string WIN_TITLE_HUNT = "Hunt: Showdown";
private const string WIN_TITLE_QUAKE = "Quake";
private const string WIN_TITLE_MINECRAFT = "Minecraft";
private const string WIN_TITLE_NEOVIDE = "Neovide";
private const string WIN_TITLE_VLC = "VLC media player";
// }}}

// Load filters from file {{{
private IEnumerable<string> LoadFiltersFromFile()
{
    // var path = Path.Combine(Environment.GetEnvironmentVariable("USERPROFILE"), @"\.workspacer\filters.txt");
    var path = Environment.ExpandEnvironmentVariables(@"%USERPROFILE%\.workspacer\filters.txt");

    try
    {
        var lines = File.ReadAllLines(path);
        return lines.Select(line => line.Trim());
    }
    catch(FileNotFoundException)
    {
        File.Create(path);
    }
    catch (DirectoryNotFoundException)
    {
        Directory.CreateDirectory(path);
    }

    return Enumerable.Empty<string>();
}
// }}}

private Action<IConfigContext> doConfig = (context) =>
{
    var gap = BAR_HEIGHT - 8;

    var backgroundColor = GruvboxDarkSoft.Bg0;
    var foregroundColor = GruvboxDarkSoft.Fg1;
    var focusIndicatorColor = GruvboxDarkSoft.Red;
    var emptyColor = GruvboxDarkSoft.Gray;
    var backColor = GruvboxDarkSoft.Aqua;

    // Uncomment to switch update branch (or to disable updates)
    //context.Branch = Branch.None;

    var gapPlugin = context.AddGap(
        new GapPluginConfig()
        {
            InnerGap = gap,
            OuterGap = gap / 2,
            Delta = gap / 2
        }
    );

    context.AddBar(
        new BarPluginConfig()
        {
            BarTitle = "workspacer.Bar",
            BarHeight = BAR_HEIGHT,
            FontSize = FONT_SIZE,
            FontName = FONT_NAME,
            DefaultWidgetForeground = foregroundColor,
            DefaultWidgetBackground = backgroundColor,
            Background = backgroundColor,
            LeftWidgets = () =>
                new IBarWidget[]
                {
                    new WorkspaceWidget()
                    {
                        WorkspaceHasFocusColor = focusIndicatorColor,
                        WorkspaceEmptyColor = emptyColor,
                        WorkspaceIndicatingBackColor = backColor,
                    },
                    // new TextWidget("\uf178"),
                    new TextWidget("\uf555"),
                    new TitleWidget() { IsShortTitle = true }
                },
            RightWidgets = () =>
                new IBarWidget[]
                {
                    new BatteryWidget(),
                    new TimeWidget(1000, "[h:mm:ss tt MMMM dd, yyyy]"),
                    new ActiveLayoutWidget()
                }
        }
    );

    context.AddFocusIndicator(
        new FocusIndicatorPluginConfig()
        {
            BorderColor = focusIndicatorColor,
            BorderSize = 10,
            TimeToShow = 200,
        }
    );

    // I want to hide the title bar on ALL windows
    // var titleBarPluginConfig = new TitleBarPluginConfig(new TitleBarStyle(showTitleBar: false, showSizingBorder: false));
    var titleBarPluginConfig = new TitleBarPluginConfig(new TitleBarStyle(false, false));
    titleBarPluginConfig.SetWindowTitleMAtch("Neovide", new TitleBarStyle(false, false));
    context.AddTitleBar(titleBarPluginConfig);

    // var actionMenu = context.AddActionMenu();

    var actionMenu = context.AddActionMenu(
        new ActionMenuPluginConfig()
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
        }
    );

    context.WorkspaceContainer.CreateWorkspaces(
        WORKSPACE_DEV,
        WORKSPACE_WEB,
        WORKSPACE_MAIL,
        WORKSPACE_COMM,
        WORKSPACE_VIBES,
        WORKSPACE_STREAM,
        WORKSPACE_GAME
    );

    var filters = LoadFiltersFromFile().ToList()
      .Append(WIN_TITLE_INSTALLER);

    // I want to filter certain applications from being controlled by Workspacer
    context.WindowRouter.AddFilter(
        (window) => filters.Aggregate(true, (acc, filter) => acc && !window.Title.Contains(filter))
    );

    var routes = new Dictionary<string, IWorkspace> {
        { WIN_TITLE_NEOVIDE, context.WorkspaceContainer[WORKSPACE_DEV] },
        { WIN_TITLE_DISCORD, context.WorkspaceContainer[WORKSPACE_COMM] },
        { WIN_TITLE_TEAMS, context.WorkspaceContainer[WORKSPACE_COMM] },
        { WIN_TITLE_SLACK, context.WorkspaceContainer[WORKSPACE_COMM] },
        { WIN_TITLE_SNAPCHAT, context.WorkspaceContainer[WORKSPACE_COMM] },
        { WIN_TITLE_ZOOM, context.WorkspaceContainer[WORKSPACE_COMM] },
        { WIN_TITLE_OUTLOOK, context.WorkspaceContainer[WORKSPACE_MAIL] },
        { WIN_TITLE_OBS, context.WorkspaceContainer[WORKSPACE_STREAM] },
        { WIN_TITLE_VLC, context.WorkspaceContainer[WORKSPACE_VIBES] },
        { WIN_TITLE_STEAM, context.WorkspaceContainer[WORKSPACE_GAME] },
        { WIN_TITLE_HUNT, context.WorkspaceContainer[WORKSPACE_GAME] },
        { WIN_TITLE_QUAKE, context.WorkspaceContainer[WORKSPACE_GAME] },
    };

    // I want to route certain applications to a specific workspace
    context.WindowRouter.AddRoute(
        (window) => // routes.Keys.Aggregate<string, IWorkspace>(null, (acc, windowTitle) => acc = window.Title.Contains(windowTitle) ? routes[windowTitle] : null)
        {
            foreach (var key in routes.Keys) {
                if (window.Title.Contains(key)) return routes[key];
            }

            return null;
        }
    );

    // Deal with unicode codepoints

    context.CanMinimizeWindows = true; // false by default
};

return doConfig;
