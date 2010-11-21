-- ~/.xmonad/xmonad.hs
-- Andrew Antle - http://antlechrist.org/

import XMonad
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Hooks.DynamicLog
import XMonad.Layout.SimplestFloat

workspaces' = ["1","2","3","4","5","6","7","8","9"]
modMask' = mod4Mask
borderWidth' = 1
normalBorderColor'  = "#1a1a1a"
focusedBorderColor' = "#303030"

layout' = tiled ||| Mirror tiled ||| Full ||| simplestFloat
    where
        tiled   = Tall nmaster delta ratio
        nmaster = 1
        ratio   = 1/2
        delta   = 3/100

manage' = composeAll
    [ className =? "Chromium" --> doShift "9" ]

terminal' = "uxterm"
focusFollowsMouse' = True

keys' conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_p     ), spawn "dmenu.sh")
    , ((modm .|. shiftMask, xK_c     ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm,               xK_n     ), refresh)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp)
    , ((modm,               xK_m     ), windows W.focusMaster)
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown)
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp)
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

mouseBindings' (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

bar' = "xmobar"
xmobarPP' = xmobarPP
    { ppCurrent = xmobarColor "#cdcdc1" "#222222" . pad
    , ppHidden  = xmobarColor "#999999" "" . pad
    , ppHiddenNoWindows = showNamedWorkspaces
    , ppUrgent  = id
    , ppSep     = " : "
    , ppWsSep   = " "
    , ppTitle   = shorten 80
    , ppLayout  = id
    , ppOrder   = id
    , ppOutput  = putStrLn
    , ppExtras  = []
    }
    where showNamedWorkspaces wsId = if any (`elem` wsId) ['1'..'9']
                                     then pad wsId
                                     else ""

toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

main = xmonad =<< statusBar bar' xmobarPP' toggleStrutsKey config'

config' = defaultConfig
    { terminal           = terminal'
    , focusFollowsMouse  = focusFollowsMouse'
    , borderWidth        = borderWidth'
    , modMask            = modMask'
    , workspaces         = workspaces'
    , normalBorderColor  = normalBorderColor'
    , focusedBorderColor = focusedBorderColor'
    , keys               = keys'
    , mouseBindings      = mouseBindings'
    , layoutHook         = layout'
    , manageHook         = manage'
    }
