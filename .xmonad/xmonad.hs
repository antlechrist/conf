--
-- ~/.xmonad/xmonad.hs
--
-- Andrew Antle - http://antlechrist.org/
--

import XMonad
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

terminal'           = "urxvt"
focusFollowsMouse' :: Bool
focusFollowsMouse'  = True
borderWidth'        = 2
modMask'            = mod4Mask
workspaces'         = ["1","2","3","4","5","6","7","8","9"]
normalBorderColor'  = "#2f2f2f"
focusedBorderColor' = "#d0d0d0"

keys' conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_p     ), spawn "dmenu_run")
--  , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")
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
--  , ((modm              , xK_b     ), sendMessage ToggleStruts)
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

mouseBindings' (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

layoutHook' = tiled ||| Mirror tiled ||| Full
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100

manageHook' = composeAll
    [ className =? "Gimp" --> doFloat ]

handleEventHook' = mempty
logHook'         = return ()
startupHook'     = return ()

main = xmonad defaults
defaults = defaultConfig { terminal           = terminal'
                         , focusFollowsMouse  = focusFollowsMouse'
                         , borderWidth        = borderWidth'
                         , modMask            = modMask'
                         , workspaces         = workspaces'
                         , normalBorderColor  = normalBorderColor'
                         , focusedBorderColor = focusedBorderColor'
                         , keys               = keys'
                         , mouseBindings      = mouseBindings'
                         , layoutHook         = layoutHook'
                         , manageHook         = manageHook'
                         , handleEventHook    = handleEventHook'
                         , logHook            = logHook'
                         , startupHook        = startupHook'
                         }
