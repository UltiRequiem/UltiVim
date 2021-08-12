--[[
local alternatives = {
    html = {icon = '', color = colors.baby_pink, name = 'html'},
    css = {icon = '', color = colors.blue, name = 'css'},
    js = {icon = '', color = colors.sun, name = 'js'},
    ts = {icon = 'ﯤ', color = colors.teal, name = 'ts'},
    kt = {icon = '󱈙', color = colors.orange, name = 'kt'}
}
--]]

require('nvim-web-devicons').setup({
  override = {
    lock = { icon = '', color = '#428850', name = 'lock' },
    zip = { icon = '', color = '#428850', name = 'zip' },
    xz = { icon = '', color = '#428850', name = 'xz' },
    deb = { icon = '', color = '#428850', name = 'deb' },
    rpm = { icon = '', color = '#428850', name = 'rpm' },
    mp3 = { icon = '', color = '#428850', name = 'mp3' },
    mp4 = { icon = '', color = '#428850', name = 'mp4' },
  },
})
