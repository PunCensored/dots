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
  POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
fi

if [ "$POWERLINE_GIT_DELETED" = "" ]; then
  POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
fi

if [ "$POWERLINE_GIT_UNTRACKED" = "" ]; then
  POWERLINE_GIT_UNTRACKED="%F{yellow}✭%F{black}"
fi

if [ "$POWERLINE_GIT_RENAMED" = "" ]; then
  POWERLINE_GIT_RENAMED="➜"
fi

if [ "$POWERLINE_GIT_UNMERGED" = "" ]; then
  POWERLINE_GIT_UNMERGED="═"
fi

if [ "$POWERLINE_RIGHT_A_COLOR_FRONT" = "" ]; then
  POWERLINE_RIGHT_A_COLOR_FRONT="white"
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
            POWERLINE_GIT_INFO_LEFT=" %F{blue}%K{8}"$'\ue0b0'"%F{8}%F{7}%K{8}"$'$(git_prompt_info)$(git_prompt_status)%F{8}'
        else
            POWERLINE_GIT_INFO_LEFT=" %F{blue}%K{white}"$'\ue0b0'"%F{white}%F{black}%K{white}"$'$(git_prompt_info)%F{white}'
        fi
        POWERLINE_GIT_INFO_RIGHT=""
    else
        POWERLINE_GIT_INFO_LEFT=""
        if [ "$POWERLINE_HIDE_GIT_PROMPT_STATUS" = "" ]; then
            POWERLINE_GIT_INFO_RIGHT="%F{8}"$'\ue0b2'"%F{7}%K{8}"$'$(git_prompt_info)$(git_prompt_status)'" %K{8}"
        else
            POWERLINE_GIT_INFO_RIGHT="%F{white}"$'\ue0b2'"%F{black}%K{white}"$'$(git_prompt_info)'" %K{white}"
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

PROMPT="$POWERLINE_SEC1_BG$POWERLINE_SEC1_TXT $POWERLINE_USER_NAME $VENV_STATUS%k%f$POWERLINE_SEC1_FG%K{8}"$'\ue0b0'"%k%f%F{white}%K{8} "$POWERLINE_PATH"%F{8}"$POWERLINE_GIT_INFO_LEFT" %k"$'\ue0b0'"%f "

if [ "$POWERLINE_NO_BLANK_LINE" = "" ]; then
    PROMPT="
"$PROMPT
fi

if [ "$POWERLINE_DISABLE_RPROMPT" = "" ]; then
    if [ "$POWERLINE_RIGHT_A" = "" ]; then
        RPROMPT="$POWERLINE_GIT_INFO_RIGHT%F{8}"$'\ue0b2'""
    elif [ "$POWERLINE_RIGHT_B" = "" ]; then
        RPROMPT="$POWERLINE_GIT_INFO_RIGHT"
    else
        RPROMPT="$POWERLINE_GIT_INFO_RIGHT"
    fi
fi
