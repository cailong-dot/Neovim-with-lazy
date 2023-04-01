return {
  'gelguy/wilder.nvim',
  config = function()
    require('wilder').setup({modes = {':', '/', '?'}})
    require('wilder').set_option('pipeline', {
      require('wilder').branch(
        require('wilder').cmdline_pipeline(),
        require('wilder').search_pipeline()
      ),
    })
  end
}
