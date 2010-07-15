/* dwm/config.h
 * Andrew Antle - http://antlechrist.org/
 * See LICENSE file for copyright and license details. */

/* Appearance */
static const char font[]            = "-*-terminus-medium-*-*-*-12-*-*-*-*-*-*-*";
static const char normbordercolor[] = "#1a1a1a";
static const char normbgcolor[]     = "#101010";
static const char normfgcolor[]     = "#757575";
static const char selbordercolor[]  = "#222222";
static const char selbgcolor[]      = "#222222";
static const char selfgcolor[]      = "#999999";
static const unsigned int borderpx  = 2;     /* Border pixel of windows */
static const unsigned int snap      = 32;    /* Snap pixel */
static const Bool showbar           = True;  /* False means no bar */
static const Bool topbar            = True;  /* False means bottom bar */

/* Tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* Class      Instance  Title  Tags mask  Is floating?  Monitor */
	{ "Gimp",     NULL,     NULL,  0,         True,         -1 },
	{ "Firefox",  NULL,     NULL,  1 << 8,    False,        -1 },
};

/* Layout */
static const float mfact      = 0.5;    /* Factor of master area size [0.05..0.95] */
static const Bool resizehints = False;  /* True means respect size hints in tiled resizals */

#include "bstack.c"

static const Layout layouts[] = {
	/* Symbol  Arrange function */
	{ "[]=",   tile },     /* First entry is the default */
	{ "TTT",   bstack },   /* Bottom stack */
	{ "><>",   NULL },     /* No layout function means floating behavior */
	{ "[M]",   monocle },  /* One full screen window at a time */
};

/* Key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                        KEY,  view,        {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,            KEY,  toggleview,  {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,              KEY,  tag,         {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask,  KEY,  toggletag,   {.ui = 1 << TAG} },

/* Helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* Commands */
static const char *dmenucmd[] = { "dmenu_run", NULL };
static const char *termcmd[]  = { "xterm",     NULL };

static Key keys[] = {
	/* Modifier          Key         Function         Argument */
	{ MODKEY,            XK_p,       spawn,           {.v = dmenucmd } },
	{ MODKEY,            XK_Return,  spawn,           {.v = termcmd } },
	{ MODKEY|ShiftMask,  XK_b,       togglebar,       {0} },
	{ MODKEY,            XK_j,       focusstack,      {.i = +1 } },
	{ MODKEY,            XK_k,       focusstack,      {.i = -1 } },
	{ MODKEY,            XK_h,       setmfact,        {.f = -0.05} },
	{ MODKEY,            XK_l,       setmfact,        {.f = +0.05} },
	{ MODKEY|ShiftMask,  XK_Return,  zoom,            {0} },
	{ MODKEY,            XK_Tab,     view,            {0} },
	{ MODKEY|ShiftMask,  XK_c,       killclient,      {0} },
	{ MODKEY,            XK_t,       setlayout,       {.v = &layouts[0]} },
	{ MODKEY,            XK_b,       setlayout,       {.v = &layouts[1]} },
	{ MODKEY,            XK_f,       setlayout,       {.v = &layouts[2]} },
	{ MODKEY,            XK_m,       setlayout,       {.v = &layouts[3]} },
	{ MODKEY,            XK_space,   setlayout,       {0} },
	{ MODKEY|ShiftMask,  XK_space,   togglefloating,  {0} },
	{ MODKEY,            XK_0,       view,            {.ui = ~0 } },
	{ MODKEY|ShiftMask,  XK_0,       tag,             {.ui = ~0 } },
	{ MODKEY,            XK_comma,   focusmon,        {.i = -1 } },
	{ MODKEY,            XK_period,  focusmon,        {.i = +1 } },
	{ MODKEY|ShiftMask,  XK_comma,   tagmon,          {.i = -1 } },
	{ MODKEY|ShiftMask,  XK_period,  tagmon,          {.i = +1 } },
	TAGKEYS(             XK_1,                        0)
	TAGKEYS(             XK_2,                        1)
	TAGKEYS(             XK_3,                        2)
	TAGKEYS(             XK_4,                        3)
	TAGKEYS(             XK_5,                        4)
	TAGKEYS(             XK_6,                        5)
	TAGKEYS(             XK_7,                        6)
	TAGKEYS(             XK_8,                        7)
	TAGKEYS(             XK_9,                        8)
	{ MODKEY|ShiftMask,  XK_q,       quit,            {0} },
};

/* Button definitions.
 * Click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* Click          Event mask  Button    Function         Argument */
	{ ClkLtSymbol,    0,          Button1,  setlayout,       {0} },
	{ ClkLtSymbol,    0,          Button3,  setlayout,       {.v = &layouts[2]} },
	{ ClkWinTitle,    0,          Button2,  zoom,            {0} },
	{ ClkStatusText,  0,          Button2,  spawn,           {.v = termcmd } },
	{ ClkClientWin,   MODKEY,     Button1,  movemouse,       {0} },
	{ ClkClientWin,   MODKEY,     Button2,  togglefloating,  {0} },
	{ ClkClientWin,   MODKEY,     Button3,  resizemouse,     {0} },
	{ ClkTagBar,      0,          Button1,  view,            {0} },
	{ ClkTagBar,      0,          Button3,  toggleview,      {0} },
	{ ClkTagBar,      MODKEY,     Button1,  tag,             {0} },
	{ ClkTagBar,      MODKEY,     Button3,  toggletag,       {0} },
};
