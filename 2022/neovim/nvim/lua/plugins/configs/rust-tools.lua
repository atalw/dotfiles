local ok, rusttools = pcall(require, "rust-tools")

if not ok then
	return
end

-- https://github.com/simrat39/rust-tools.nvim#configuration
rusttools.setup {

}

