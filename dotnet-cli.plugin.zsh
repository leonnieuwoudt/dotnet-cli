# This scripts adapted from the bundled Oh-My-ZSH .NET CLI plugin.
# https://learn.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete

# zsh parameter completion for the dotnet CLI
#compdef dotnet
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet

# Aliases bellow are here for backwards compatibility
# added by Shaun Tabone (https://github.com/xontab)

alias dn='dotnet new'
alias dr='dotnet run'
alias dt='dotnet test'
alias dw='dotnet watch'
alias dwr='dotnet watch run'
alias dwt='dotnet watch test'
alias ds='dotnet sln'
alias da='dotnet add'
alias dp='dotnet pack'
alias dng='dotnet nuget'
alias db='dotnet build'
