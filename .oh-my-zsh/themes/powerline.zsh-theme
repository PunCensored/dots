# FreeAgent puts the powerline style in zsh !

if [ "$POWERLINE_DATE_FORMAT" = "" ]; then
  POWERLINE_DATE_FORMAT=%D{%Y-%m-%d}
fi

if [ "$POWERLINE_RIGHT_B" = "" ]; then
  POWERLINE_RIGHT_B=%D{%H:%M:%S}
elif [ "$POWERLINE_RIGHT_B" = "none" ]; then
  POWERLINE_RIGHT_B=""
fi

if [ "$POWERLINE_RIGHT_A" = "mixed" ]; then
  POWERLINE_RIGHT_A=%(?."$POWERLINE_DATE_FORMAT".%F{red}✘ %?)
elif [ "$POWERLINE_RIGHT_A" = "exit-status" ]; then
  POWERLINE_RIGHT_A=%(?.%F{green}✔ %?.%F{red}✘ %?)
elif [ "$POWERLINE_RIGHT_A" = "exit-status-on-fail" ]; then
  POWERLINE_RIGHT_A=%(?..%F{red}✘ %?)
elif [ "$POWERLINE_RIGHT_A" = "date" ]; then
  POWERLINE_RIGHT_A="$POWERLINE_DATE_FORMAT"
elif [ "$POWERLINE_RIGHT_A" = "none" ]; then
  POWERLINE_RIGHT_A=""
fi

if [ "$POWERLINE_SHORT_HOST_NAME" = "" ]; then
    POWERLINE_HOST_NAME="%M"
else
    POWERLINE_HOST_NAME="%m"
fi

if [ "$POWERLINE_HIDE_USER_NAME" = "" ] && [ "$POWERLINE_HIDE_HOST_NAME" = "" ]; then
    POWERLINE_USER_NAME="%n@$POWERLINE_HOST_NAME"
elif [ "$POWERLINE_HIDE_USER_NAME" != "" ] && [ "$POWERLINE_HIDE_HOST_NAME" = "" ]; then
    POWERLINE_USER_NAME="@$POWERLINE_HOST_NAME"
elif [ "$POWERLINE_HIDE_USER_NAME" = "" ] && [ "$POWERLINE_HIDE_HOST_NAME" != "" ]; then
    POWERLINE_USER_NAME="%n"
else
    POWERLINE_USER_NAME=""
fi

if [ "$POWERLINE_PATH" = "full" ]; then
  POWERLINE_PATH="%1~"
elif [ "$POWERLINE_PATH" = "short" ]; then
  POWERLINE_PATH="%~"
else
  POWERLINE_PATH="%d"
fi

if [ "$POWERLINE_CUSTOM_CURRENT_PATH" != "" ]; then
  POWERLINE_CURRENT_PATH="$POWERLINE_CUSTOM_CURRENT_PATH"
fi

if [ "$POWERLINE_GIT_CLEAN" = "" ]; then
  POWERLINE_GIT_CLEAN="%F{10}✔"
fi

if [ "$POWERLINE_GIT_DIRTY" = "" ]; then
  POWERLINE_GIT_DIRTY="%F{9}✘"
fi

if [ "$POWERLINE_GIT_ADDED" = "" ]; then
  POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
fi

if [ "$POWERLINE_GIT_MODIFIED" = "" ]; then
  POWERLINE_GIT_MODIFIED="%F{13}✹%F{black}"
fi

if [ "$POWERLINE_GIT_DELETED" = "" ]; then
  POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
fi

if [ "$POWERLINE_GIT_UNTRACKED" = "" ]; then
  POWERLINE_GIT_UNTRACKED="%F{11}✭%F{black}"
fi

if [ "$POWERLINE_GIT_RENAMED" = "" ]; then
  POWERLINE_GIT_RENAMED="➜"
fi

if [ "$POWERLINE_GIT_UNMERGED" = "" ]; then
  POWERLINE_GIT_UNMERGED="═"
fi

if [ "$POWERLINE_RIGHT_A_COLOR_FRONT" = "" ]; then
  POWERLINE_RIGHT_A_COLOR_FRONT="red"
fi

if [ "$POWERLINE_RIGHT_A_COLOR_BACK" = "" ]; then
  POWERLINE_RIGHT_A_COLOR_BACK="black"
fi

ZSH_THEME_GIT_PROMPT_PREFIX=" \ue0a0 "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" $POWERLINE_GIT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN=" $POWERLINE_GIT_CLEAN"

ZSH_THEME_GIT_PROMPT_ADDED=" $POWERLINE_GIT_ADDED"
ZSH_THEME_GIT_PROMPT_MODIFIED=" $POWERLINE_GIT_MODIFIED"
ZSH_THEME_GIT_PROMPT_DELETED=" $POWERLINE_GIT_DELETED"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" $POWERLINE_GIT_UNTRACKED"
ZSH_THEME_GIT_PROMPT_RENAMED=" $POWERLINE_GIT_RENAMED"
ZSH_THEME_GIT_PROMPT_UNMERGED=" $POWERLINE_GIT_UNMERGED"
ZSH_THEME_GIT_PROMPT_AHEAD=" ⬆"
ZSH_THEME_GIT_PROMPT_BEHIND=" ⬇"
ZSH_THEME_GIT_PROMPT_DIVERGED=" ⬍"

# if [ "$(git_prompt_info)" = "" ]; then
   # POWERLINE_GIT_INFO_LEFT=""
   # POWERLINE_GIT_INFO_RIGHT=""
# else
    if [ "$POWERLINE_SHOW_GIT_ON_RIGHT" = "" ]; then
        if [ "$POWERLINE_HIDE_GIT_PROMPT_STATUS" = "" ]; then
            POWERLINE_GIT_INFO_LEFT=" %F{8}%K{24}"$'\ue0b0'"%F{24}%F{12}%K{24}"$'$(git_prompt_info)$(git_prompt_status)%F{24}'
        else
            POWERLINE_GIT_INFO_LEFT=" %F{white}%K{15}"$'\ue0b0'"%F{8}%F{black}%K{0}"$'$(git_prompt_info)%F{white}'
        fi
        POWERLINE_GIT_INFO_RIGHT=""
    else
        POWERLINE_GIT_INFO_LEFT=""
        if [ "$POWERLINE_HIDE_GIT_PROMPT_STATUS" = "" ]; then
            POWERLINE_GIT_INFO_RIGHT="%F{8}"$'\ue0b2'"%F{7}%K{8}"$'$(git_prompt_info)$(git_prompt_status)'" %K{8}"
        else
            POWERLINE_GIT_INFO_RIGHT="%F{7}"$'\ue0b2'"%F{black}%K{7}"$'$(git_prompt_info)'" %K{7}"
        fi
    fi
# fi

if [ $(id -u) -eq 0 ]; then
    POWERLINE_SEC1_BG=%K{red}
    POWERLINE_SEC1_FG=%F{red}
else
    POWERLINE_SEC1_BG=%K{27}
    POWERLINE_SEC1_FG=%F{27}
fi
POWERLINE_SEC1_TXT=%F{23}
if [ "$POWERLINE_DETECT_SSH" != "" ]; then
  if [ -n "$SSH_CLIENT" ]; then
    POWERLINE_SEC1_BG=%K{red}
    POWERLINE_SEC1_FG=%F{red}
    POWERLINE_SEC1_TXT=%F{white}
  fi
fi

if [ "$VIRTUAL_ENV" != "" ] && [ "$POWERLINE_HIDE_VIRTUAL_ENV" = "" ]; then
    VENV_NAME=$(basename "$VIRTUAL_ENV")
    VENV_STATUS="($POWERLINE_SEC1_TXT$VENV_NAME)"
else
    VENV_STATUS=""
fi

PROMPT="$POWERLINE_SEC1_BG$POWERLINE_SEC1_TXT $POWERLINE_USER_NAME $VENV_STATUS%k%f$POWERLINE_SEC1_FG%K{8}"$'\ue0b0'"%k%f%F{15}%K{8} "$POWERLINE_PATH"%F{8}"$POWERLINE_GIT_INFO_LEFT" %k"$'\ue0b0'"%f "

if [ "$POWERLINE_NO_BLANK_LINE" = "" ]; then
    PROMPT="
"$PROMPT
fi

if [ "$POWERLINE_DISABLE_RPROMPT" = "" ]; then
    if [ "$POWERLINE_RIGHT_A" = "" ]; then
        RPROMPT="$POWERLINE_GIT_INFO_RIGHT%F{8}"$'\ue0b2'
    elif [ "$POWERLINE_RIGHT_B" = "" ]; then
        RPROMPT="$POWERLINE_GIT_INFO_RIGHT%F{blue}"$'\ue0b2'"%k%F{$POWERLINE_RIGHT_A_COLOR_FRONT}%K{$POWERLINE_RIGHT_A_COLOR_BACK} $POWERLINE_RIGHT_A %f%k"
    else
        RPROMPT="$POWERLINE_GIT_INFO_RIGHT%F{green}"$'\ue0b2'"%k%F{black}%K{green} $POWERLINE_RIGHT_B %f%F{$POWERLINE_RIGHT_A_COLOR_BACK}"$'\ue0b2'"%f%k%K{$POWERLINE_RIGHT_A_COLOR_BACK}%F{$POWERLINE_RIGHT_A_COLOR_FRONT} $POWERLINE_RIGHT_A %f%k"
    fi
fi
