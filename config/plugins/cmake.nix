{
  plugins.cmake-tools = {
    enable = true;
    settings = {
      cmake_build_directory = "build/\${variant:buildType}";
      cmake_runner = {
        name = "terminal";
        terminal = {
          split_direction = "horizontal";
          split_size = 20;
          focus = true;
        };
      };
    };
  };

  autoCmd = [{
    event = [ "FileType" ];
    pattern = [ "cpp" "cmake" ];
    callback.__raw = ''
      function()
        vim.keymap.set('n', '<leader>cg', '<CMD>CMakeGenerate<CR>')
        vim.keymap.set('n', '<leader>cb', '<CMD>CMakeBuild<CR>')
        vim.keymap.set('n', '<leader>cr', '<CMD>CMakeRun<CR>')
        vim.keymap.set('n', '<leader>ct', '<CMD>CMakeSelectLaunchTarget<CR>')
      end
    '';
  }];

}
