# alias
## git
alias g="git"
alias ap="git add -p"
alias au="git add -u"
alias cm="git commit"
alias co="git checkout"
alias d="git diff"
alias dc="git diff --cached"
alias gc="git cherry-pick"
alias s="git status"
## emacs
alias e="ef"

# function
## function: select_working
## select working dir with fzf
select_working() {
  local base_dir="${1:-$HOME}/Working"
  local dir

  dir=$(
      find "$base_dir" -mindepth 1 -maxdepth 1 -type d 2>/dev/null |
      fzf \
	  --prompt="Input: " \
	  --preview="ls -l {}" \
          --preview-window=up:10:wrap
  )
  if [[ -n $dir ]]; then
      cd "$dir" || echo "Failed to cd into $dir"
  fi
  zle reset-prompt
}

zle -N select_working_w select_working
bindkey '^j' select_working_w

## function: select_branch
## select working dir with fzf
select_branch() {
  local branch
  branch=$(
      git branch --sort=-committerdate --color=always |
      sed -E "s/^[ *]+//" |
      fzf \
	  --ansi \
          --preview="git log --pretty=format:'%C(bold)%h%C(reset) %C(bold green)%s%C(reset) %ad %an' --date=short --decorate --color=always {}" \
          --preview-window=up:50%:wrap \
          --height=80% \
          --border=sharp \
          --prompt="Input: "
   )

  if [[ -n "$branch" ]]; then
    git checkout "$branch"
  else
    echo "No branch selected"
  fi
}
alias b="select_branch"

## function: cd_with_fzf
## cd dir under current dir with fzf
cd_with_fzf() {
  local current_dir=$(pwd)
  local dir
  dir=$(find "$current_dir" -mindepth 1 -maxdepth 1 -type d ! -path "*/.*" | fzf --height 30% --prompt="Input: ")

  if [ -n "$dir" ]; then
    cd "$dir" || echo "Failed to change directory to $dir"
  fi
}
alias c="cd_with_fzf"

## function: ad_with_fzf
## git add with fzf
add_with_fzf() {
    # confirm target is git repo
    if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
	echo "Not inside a git repository."
	return 1
    fi

    local files
    files=$(git status --short | fzf --multi --preview "git diff --color=always -- {-1}" --preview-window=right:70%)

    if [[ -z "$files" ]]; then
        echo "No files selected."
        return 0
    fi

    local paths
    paths=($(echo "$files" | awk '{print $2}'))
    git add -- "${paths[@]}"

    echo "Added the following files:"
    echo "$files"
}
alias a="add_with_fzf"

## function: f
## use with other command
f() {
    # select a single file
    local file
    file=$(fzf --preview "cat {-1}" --preview-window=right:70% --select-1 --exit-0)

    # if no file was selected, exit
    if [[ -z "$file" ]]; then
	echo "No file selected." >&2
	return 1
    fi

    # output the selected file for the next command
    echo "$file"
}

## function: ef
## open by emacs with fzf
ef() {
    local file=$(f)
    if [[ -z "$file" ]]; then
    else
	emacs -nw "$file"
    fi
}
