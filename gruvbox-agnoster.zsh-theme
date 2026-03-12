# vim:ft=zsh ts=2 sw=2 sts=2
#
# gruvbox-agnoster - A Powerline-inspired theme using Gruvbox Material colors
# Based on agnoster's theme, with time-of-day light/dark switching
#
# Requires a Powerline-patched font (e.g. JetBrainsMono Nerd Font)

### Gruvbox color palette (using 256-color approximations and hex)
# Dark variant
# bg: #1D2021  fg: #D4BE98
# red: #EA6962  green: #A9B665  yellow: #D8A657
# blue: #7DAEA3  magenta: #D3869B  cyan: #89B482  orange: #E78A4E
#
# Light variant
# bg: #F9F5D7  fg: #654735
# red: #C14A4A  green: #6C782E  yellow: #B47109
# blue: #45707A  magenta: #945E80  cyan: #4C7A5D  orange: #C35E0A

### Time-of-day detection (7am-7pm = light)
_gruvbox_hour=$(date +%H)
if [[ $_gruvbox_hour -ge 7 && $_gruvbox_hour -lt 19 ]]; then
  GRUVBOX_VARIANT="light"
else
  GRUVBOX_VARIANT="dark"
fi

if [[ $GRUVBOX_VARIANT == "light" ]]; then
  GBX_FG='#654735'
  GBX_BG='#F9F5D7'
  GBX_RED='#C14A4A'
  GBX_GREEN='#6C782E'
  GBX_YELLOW='#B47109'
  GBX_BLUE='#45707A'
  GBX_MAGENTA='#945E80'
  GBX_CYAN='#4C7A5D'
  GBX_ORANGE='#C35E0A'
  GBX_GRAY='#A89984'

  CURRENT_FG='#654735'
  CURRENT_DEFAULT_FG='#654735'
else
  GBX_FG='#D4BE98'
  GBX_BG='#1D2021'
  GBX_RED='#EA6962'
  GBX_GREEN='#A9B665'
  GBX_YELLOW='#D8A657'
  GBX_BLUE='#7DAEA3'
  GBX_MAGENTA='#D3869B'
  GBX_CYAN='#89B482'
  GBX_ORANGE='#E78A4E'
  GBX_GRAY='#928374'

  CURRENT_FG='#D4BE98'
  CURRENT_DEFAULT_FG='#D4BE98'
fi

### Segment drawing

CURRENT_BG='NONE'

() {
  local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  SEGMENT_SEPARATOR=$'\ue0b0'
}

prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

### Prompt components

# Status: error, root, background jobs
prompt_status() {
  local -a symbols
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{$GBX_RED}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{$GBX_YELLOW}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{$GBX_CYAN}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment "$GBX_BG" "$GBX_FG" "$symbols"
}

# Context: user@hostname
prompt_context() {
  if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment "$GBX_GRAY" "$GBX_BG" "%(!.%{%F{$GBX_YELLOW}%}.)%n@%m"
  fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment "$GBX_BLUE" "$GBX_BG" '%~'
}

# Git: branch/detached head, dirty status
prompt_git() {
  (( $+commands[git] )) || return
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
    return
  fi
  local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    PL_BRANCH_CHAR=$'\ue0a0'
  }
  local ref dirty mode repo_path

  if [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then
    repo_path=$(command git rev-parse --git-dir 2>/dev/null)
    dirty=$(parse_git_dirty)
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref="◈ $(command git describe --exact-match --tags HEAD 2> /dev/null)" || \
    ref="➦ $(command git rev-parse --short HEAD 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment "$GBX_YELLOW" "$GBX_BG"
    else
      prompt_segment "$GBX_GREEN" "$GBX_BG"
    fi

    local ahead behind
    ahead=$(command git log --oneline @{upstream}.. 2>/dev/null)
    behind=$(command git log --oneline ..@{upstream} 2>/dev/null)
    if [[ -n "$ahead" ]] && [[ -n "$behind" ]]; then
      PL_BRANCH_CHAR=$'\u21c5'
    elif [[ -n "$ahead" ]]; then
      PL_BRANCH_CHAR=$'\u21b1'
    elif [[ -n "$behind" ]]; then
      PL_BRANCH_CHAR=$'\u21b0'
    fi

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:*' unstagedstr '±'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info
    echo -n "${${ref:gs/%/%%}/refs\/heads\//$PL_BRANCH_CHAR }${vcs_info_msg_0_%% }${mode}"
  fi
}

# Virtualenv
prompt_virtualenv() {
  if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    prompt_segment "$GBX_MAGENTA" "$GBX_BG" "🐍 $CONDA_DEFAULT_ENV"
  fi
  if [[ -n "$VIRTUAL_ENV" && -n "$VIRTUAL_ENV_DISABLE_PROMPT" ]]; then
    prompt_segment "$GBX_MAGENTA" "$GBX_BG" "(${VIRTUAL_ENV:t:gs/%/%%})"
  fi
}

# AWS Profile
prompt_aws() {
  [[ -z "$AWS_PROFILE" || "$SHOW_AWS_PROMPT" = false ]] && return
  case "$AWS_PROFILE" in
    *-prod|*production*) prompt_segment "$GBX_RED" "$GBX_YELLOW" "AWS: ${AWS_PROFILE:gs/%/%%}" ;;
    *) prompt_segment "$GBX_GREEN" "$GBX_BG" "AWS: ${AWS_PROFILE:gs/%/%%}" ;;
  esac
}

# Terraform
prompt_terraform() {
  local terraform_info=$(tf_prompt_info)
  [[ -z "$terraform_info" ]] && return
  prompt_segment "$GBX_MAGENTA" "$GBX_YELLOW" "TF: $terraform_info"
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_aws
  prompt_terraform
  prompt_context
  prompt_dir
  prompt_git
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '
