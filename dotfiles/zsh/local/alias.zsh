# alias
## git
alias g="git"
alias a="git add"
alias ap="git add -p"
alias co="git checkout"
alias d="git diff"
alias dc="git diff --cached"
alias gc="git cherry-pick"
alias s="git status"
## emacs
alias e="emacs -nw"

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
