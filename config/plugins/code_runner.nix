{ pkgs, ... }:

{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "code_runner";
      src = pkgs.fetchFromGitHub {
        owner = "CRAG666";
        repo = "code_runner.nvim";
        rev = "dcedccbf969a0f3bc00db446172b4966e83101dd";
        hash = "sha256-xxW0ymsPmxLE45Z/TPTiah8K7SOYti78UyVTza3Z21g=";
      };
    })
  ];

  keymaps = [{
    mode = "n";
    key = "`<cr>";
    action = "<cmd>RunCode<cr>";
  }];

  extraConfigLua = ''
    require('code_runner').setup({
      -- mode = 'toggleterm',
      mode = 'tab',
      float = {
        border = 'rounded',
        height = 1,
        width = 1,
      },
      startinsert = true,
      -- put here the commands by filetype
      filetype = {
        java = 'cd $dir && javac $fileName && java $fileNameWithoutExt',
        python = 'python3 $dir/$fileName',
        r = 'Rscript $dir/$fileName',
        typescript = 'deno run',
        julia = 'julia $dir/$fileName',
        rust = 'cd $dir && rustc $fileName && $dir/$fileNameWithoutExt',
        cpp = 'cd $dir && mkdir -p build && g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -O2 -o ./build/$fileNameWithoutExt $fileName && ./build/$fileNameWithoutExt',
        c = 'cd $dir && mkdir -p build && gcc -fsanitize=address -Wall -Wextra -Wshadow -O2 -o ./build/$fileNameWithoutExt $fileName && ./build/$fileNameWithoutExt',
        swift = 'swift $dir/$fileName',
      },
    })
  '';

}
