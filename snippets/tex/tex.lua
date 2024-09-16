local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local ai = require('luasnip.nodes.absolute_indexer')
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local tex = {}
tex.in_mathzone = function() -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex.in_text = function()
  return not tex.in_mathzone()
end
tex.in_comment = function() -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn['vimtex#env#is_inside'](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex.in_equation = function() -- equation environment detection
  return tex.in_env('equation')
end
tex.in_itemize = function() -- itemize environment detection
  return tex.in_env('itemize')
end
tex.in_tikz = function() -- TikZ picture environment detection
  return tex.in_env('tikzpicture')
end

-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.

local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

table_node = function(args)
  local tabs = {}
  local count
  table = args[1][1]:gsub('%s', ''):gsub('|', '')
  count = table:len()
  for j = 1, count do
    local iNode
    iNode = i(j)
    tabs[2 * j - 1] = iNode
    if j ~= count then
      tabs[2 * j] = t(' & ')
    end
  end
  return sn(nil, tabs)
end

rec_table = function()
  return sn(nil, {
    c(1, {
      t({ '' }),
      sn(nil, {
        t({ '\\\\', '' }),
        d(1, table_node, { ai[1] }),
        d(2, rec_table, { ai[1] }),
      }),
    }),
  })
end

return {

  s('table', {
    t('\\begin{tabular}{'),
    i(1, '0'),
    t({ '}', '' }),
    d(2, table_node, { 1 }, {}),
    d(3, rec_table, { 1 }),
    t({ '', '\\end{tabular}' }),
  }),

  s(
    { trig = 'preambule', dscr = 'preambule' },
    fmta( -- The snippet code actually looks like the equation environment it produces.
      [[
      %! suppress = Makeatletter
      %! suppress = TooLargeSection
      %! suppress = MissingLabel

      \documentclass[10pt,fleqn,a4paper]{article}
      \usepackage[utf8]{inputenc}
      \usepackage[T2A]{fontenc}
      \usepackage{fullpage}
      \usepackage[russian]{babel}
      \usepackage{amsthm,amsmath,amsfonts,amssymb,amstext}
      \usepackage{mathtools}
      \usepackage{listings}
      \usepackage{xcolor}
      \usepackage{tikz}
      \usepackage{graphicx}
      \usepackage{caption}
      \usepackage{float}
      \usepackage{subcaption} 
      \usepackage{hyperref}
      \usepackage[a4paper,left=15mm,right=15mm,top=30mm,bottom=20mm]{geometry}
      \usepackage{indentfirst}

      \DeclareGraphicsExtensions{.pdf,.png,.jpg}
      \graphicspath{{images/}}

      \newtheorem{problem}{Задача}

      \newenvironment{solution}
       {\renewcommand\qedsymbol{$\blacksquare$}\begin{proof}[Решение]}
       {\end{proof}}


      \newtheorem*{definition}{Определение}

      \newcommand{\F}{\mathbb{F}}
      \newcommand{\Z}{\mathbb{Z}}
      \newcommand{\N}{\mathbb{N}}
      \newcommand{\R}{\mathbb{R}}
      \renewcommand{\O}{\mathcal{O}}

      \newcommand{\Let}{%
        \mathord{\setbox0=\hbox{$\exists$}%
          \hbox{\kern 0.125\wd0%
             \vbox to \ht0{%
             \hrule width 0.75\wd0%
             \vfill%
             \hrule width 0.75\wd0}%
             \vrule height \ht0%
             \kern 0.125\wd0}%
        }%
      }

      \title{<>}
      \author{Сон Артём}
      \date{\today}

      \begin{document}
      \maketitle

      <>

      \end{document}
      ]],
      { i(1), i(0) }
    )
  ),
}
