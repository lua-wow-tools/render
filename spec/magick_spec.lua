describe('wowrender/magick', function()
  local t = require('wowrender.magick')
  it('loads', function()
    assert.same('table', type(t))
  end)
  it('works', function()
    local wand = t:new_magick_wand()
    assert.True(wand:read_image('magick:logo'))
    assert.same('GIF', wand:get_image_format())
    assert.same(480, wand:get_image_height())
    assert.same(640, wand:get_image_width())
    assert.same(1, wand:get_number_images())
    assert.same('', wand:get_option('foo'))
    assert.same({}, { wand:get_options('') })
    assert.True(wand:set_option('foo', 'bar'))
    assert.same('bar', wand:get_option('foo'))
    assert.same({ 'foo' }, { wand:get_options('') })
  end)
  it('fonts', function()
    local wand = t:new_magick_wand()
    local draw = t:new_drawing_wand()
    draw:annotation(0, 0, 'rofl')
    wand:draw_image(draw)
  end)
end)
