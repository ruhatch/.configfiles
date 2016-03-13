-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    font = "xft:SFNS Display:size=11",
    additionalFonts = ["xft:FontAwesome:size=11"],
    alpha = 236,
    bgColor = "#222824",
    fgColor = "#989FAC",
    position = TopSize C 100 24,
    lowerOnStart = True,
    commands = [
        Run Weather "KPAO" ["-t","<tempF>F <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
        -- cpu activity monitor
        Run MultiCpu [
        "--template" , "Cpu: <total0>% | <total1>%",
        "--Low", "50",        -- units: %
        "--High", "85",       -- units: %
        "--normal", "darkorange",
        "--high", "darkred"] 10, 
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        -- battery monitor
        Run Battery [ 
            "--template" , "Batt: <acstatus>",
            "--Low"      , "10",       -- units: %
            "--High"     , "80",       -- units: %
            "--low"      , "darkred",
            "--normal"   , "darkorange",
            "--high"     , "darkgreen",
            "--", -- battery specific options
            -- discharging status
            "-o"	, "<left>% (<timeleft>)",
            -- AC "on" status
            "-O"	, "<fc=#dAA520>Charging</fc>",
            -- charged status
            "-i"	, "<fn=1>\xf240</fn>"
            ] 50,
        Run Date "%a %_d %b %H:%M" "date" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "  %StdinReader% } %date% { %multicpu%   %memory%  %battery%  <action=`oblogout` button=1><fn=1><raw=1:/></fn></action>  "
}
