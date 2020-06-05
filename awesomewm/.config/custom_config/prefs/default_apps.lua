-- Default apps

editor = os.getenv("EDITOR") or "editor"
terminal = "xfce4-terminal"

return {
    editor = editor,
    editor_cmd = terminal .. " -e " .. editor,
    terminal = terminal
}

