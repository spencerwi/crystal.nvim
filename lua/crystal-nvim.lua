local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.crystal = {
	install_info = {
		url = "https://github.com/keidax/tree-sitter-crystal", -- local path or git repo
		files = {"src/scanner.c", "src/parser.c"}
	}
}
