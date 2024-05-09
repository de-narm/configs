import XMonad
-- EWMH compliance
import XMonad.Hooks.EwmhDesktops
-- Keybindings
import XMonad.Util.EZConfig
-- Layout functions
import XMonad.Layout.Spacing
import XMonad.Layout.LayoutModifier (ModifiedLayout)
import XMonad.Layout.Renamed
import XMonad.Layout.NoBorders
-- Predefined layouts
import XMonad.Layout.ThreeColumns
-- Magnify windows
import XMonad.Layout.Magnifier hiding (Toggle)
-- Toggle fullscreen
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
-- Xmobar
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
-- Xmobar window title log
import XMonad.Util.Loggers
-- Same on every monitor
import XMonad.Hooks.ManageDocks
-- Settings for specific windows
import XMonad.Hooks.ManageHelpers
-- Confirmation
import XMonad.Prompt
import XMonad.Prompt.ConfirmPrompt
import System.Exit (exitSuccess)

--Variables--------------------------------------------------------------------

windowGap   = 5         ::Int      -- Around windows and edge, will be doubled

baseBGColor = "#1D1F21" ::[Char]   -- Header BG, normal windows
baseHColor  = "#FFFFFF" ::[Char]   -- Highlight, Focus
baseWColor  = "#F1C40F" ::[Char]   -- Warning, Prompt

baseWhite   = "#FFFFFF" ::[Char]   -- xmobar text

baseLPurple = "#A569BD" ::[Char]   -- xmobar current title
basePurple  = "#6C3483" ::[Char]   -- xmobar current title
baseDPurple = "#5B2C6F" ::[Char]   -- xmobar current title

baseLRed    = "#EC7063" ::[Char]   -- xmobar workspaces current
baseRed     = "#B03A2E" ::[Char]   -- xmobar workspaces current
baseDRed    = "#943126" ::[Char]   -- xmobar workspaces current

baseLBlue   = "#5499C7" ::[Char]   -- xmobar workspaces used
baseBlue    = "#1F618D" ::[Char]   -- xmobar workspaces used
baseDBlue   = "#1A5276" ::[Char]   -- xmobar workspaces used

baseLGrey   = "#99A3A4" ::[Char]   -- xmobar workspaces empty
baseGrey    = "#616A6B" ::[Char]   -- xmobar workspaces empty
baseDGrey   = "#515A5A" ::[Char]   -- xmobar workspaces empty

--Main-------------------------------------------------------------------------

main :: IO ()
main = xmonad 
     . ewmhFullscreen 
     . ewmh 
     . withEasySB 
       (statusBarProp "xmobar .config/xmobar/config" (pure xmobarConfigs)) 
       defToggleStrutsKey -- Toggle with M-b
     $ configs

--General Configs--------------------------------------------------------------

configs = def
    { layoutHook         = layouts
    , manageHook         = manageWindows
    , terminal           = "alacritty"
    , normalBorderColor  = baseBGColor
    , focusedBorderColor = baseHColor
    }
  `additionalKeysP`
    [ -- Fullscreen
      ("M-f", sendMessage $ Toggle NBFULL)
      -- Volume
    , ("M-<F1>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    , ("M-<F2>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
    , ("M-<F3>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
      -- Backlight
    , ("M-<F5>", spawn "xbacklight -dec 10")
    , ("M-<F6>", spawn "xbacklight -inc 10")
      -- Exit
    , ("M-S-q", confirmPrompt xPromptConfig "exit" (io exitSuccess))
    ]

manageWindows :: ManageHook
manageWindows = composeAll
  [ className =? "Point Info" --> doFloat
  , className =? "(DEBUG)"    --> doFloat
  , className =? "Pomatez"    --> doFloat
  , isDialog                  --> doFloat
  , manageDocks
  ]

--Prompts----------------------------------------------------------------------

xPromptConfig :: XPConfig
xPromptConfig = def
    { bgColor         = baseWColor
    , fgColor         = baseBGColor
    , position        = Top
    , alwaysHighlight = True
    , height          = 20
    }

--Layouts----------------------------------------------------------------------

layouts = mkToggle (NBFULL ?? EOT)
        $ two ||| three ||| full
  where
    -- Master | Stack
    two     = smartBorders
            . renamed [Replace "Tall"]
            . smartSpacingWithEdge windowGap
            $ Tall nmaster delta ratio
    nmaster = 1     -- Default number of windows in the master pane
    delta   = 3/100 -- Percentage of screen to increment by when resizing panes
    ratio   = 1/2   -- Default proportion of screen occupied by master pane
    -- Stack | Master | Stack
    three   = smartBorders
            . renamed [Replace "Three"]
            . smartSpacingWithEdge windowGap
            . magnifiercz' 1.3 
            $ ThreeColMid threem threed threer
    threem  = 1
    threed  = 3/100
    threer  = 1/2
    -- Master
    full = noBorders
         $ Full

--XMobar-----------------------------------------------------------------------

xmobarConfigs :: PP -- PP only, also see .config/xmobar/config
xmobarConfigs = def
    { ppSep             = xmobarColor baseGrey "" " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = xmobarColor  baseWhite baseDPurple 
                        . xmobarBorder "Bottom"  baseLPurple 2
                        . xmobarBorder "Top"     baseLPurple 1
                        . xmobarBorder "HBoth"   baseLPurple 1
                        . wrap " " " " 
    , ppHidden          = xmobarColor  baseWhite baseDBlue 
                        . xmobarBorder "Bottom"  baseLBlue   2
                        . xmobarBorder "Top"     baseLBlue   1
                        . xmobarBorder "HBoth"   baseLBlue   1
                        . wrap " " " "
    , ppHiddenNoWindows = xmobarColor  baseWhite baseDGrey 
                        . xmobarBorder "Bottom"  baseLGrey   2
                        . xmobarBorder "Top"     baseLGrey   1
                        . xmobarBorder "HBoth"   baseLGrey   1
                        . wrap " " " "
    , ppUrgent          = xmobarColor  baseWhite baseDRed 
                        . xmobarBorder "Bottom"  baseLRed    2
                        . xmobarBorder "Top"     baseLRed    1
                        . xmobarBorder "HBoth"   baseLRed    1
                        . wrap " " " "
    , ppOrder           = \[ws, layout, _master, wins] 
                        -> [" " ++ ws, layout, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white "[") (white "]") . purple . ppWindow
    formatUnfocused = wrap (grey  "[") (grey  "]") . blue . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw 
             . (\w -> if null w then "untitled" else w) 
             . shorten 20

    blue, grey, purple, white :: String -> String
    white    = xmobarColor baseWhite   ""
    blue     = xmobarColor baseLBlue   ""
    purple   = xmobarColor baseLPurple ""
    grey     = xmobarColor baseLGrey   ""
