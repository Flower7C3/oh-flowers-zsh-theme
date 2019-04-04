################################################################
# generate prompt using config
################################################################

PROMPT=""
for command in "${ZSH_THEME_FLOWER7C3_PROMPT_LEFT[@]}"; do
  PROMPT="${PROMPT}$(_theme_section ${command})"
done
RPROMPT=""
for command in "${ZSH_THEME_FLOWER7C3_PROMPT_RIGHT[@]}"; do
  RPROMPT="${RPROMPT}$(_theme_section ${command})"
done
