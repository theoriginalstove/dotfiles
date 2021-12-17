local Color, colors, Group, groups, styles = require('colorbuddy').setup()

Color.new('background', '#1C1F25')
Color.new('foreground', '#988D7C')

Color.new('red', '#EF1E4C')
Color.new('green', '#92E046')
Color.new('yellow', '#BB9C45')
Color.new('white', '#988D7C')
Color.new('black', '#1F222A')
Color.new('blue', '#2C5D6F')
Color.new('purple', '#423262')
Color.new('violet', '#1f172F')
Color.new('orange', '#6E3D1C')
Color.new('cyan', '#8EC4DC')


v.colors_name = 'theogstove'

-------------------------------------------------------
-- Syntax Groups
-------------------------------------------------------

Group.new('Comment', c.green, c.none, i) -- any comment
Group.new('Constant', c.cyan, c.none, no) -- any constant
Group.new('String', c.cyan, c.none, i)
Group.new('Character', c.orange, c.none, no)
Group.new('Boolean', c.purple, c.none, no)

