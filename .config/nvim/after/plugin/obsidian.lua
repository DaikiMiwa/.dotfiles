require('obsidian').setup(
{
  dir='/Users/miwanodaiki/Library/Mobile Documents/iCloud~md~obsidian/Documents/note_obsidian',
  completion = {
    nvim_cmp = true,  -- if using nvim-cmp, otherwise set to false
  },
  templates = {
    subdir = "template",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },
}
)
