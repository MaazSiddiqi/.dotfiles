---@diagnostic disable: unused-local, unused-function
local lualine = require("lualine")
local colors = require("onedarkpro.helpers").get_colors()
local config = require("onedarkpro.config").config

local onedarkpro = {}

onedarkpro.normal = {
	a = { bg = colors.purple, fg = colors.bg },
	b = { bg = colors.fg_gutter, fg = colors.purple },
	c = { bg = colors.bg_statusline, fg = colors.fg },
}

onedarkpro.insert = {
	a = { bg = colors.blue, fg = colors.bg },
	b = { bg = colors.fg_gutter, fg = colors.blue },
}

onedarkpro.command = {
	a = { bg = colors.green, fg = colors.bg },
	b = { bg = colors.fg_gutter, fg = colors.green },
}

onedarkpro.visual = {
	a = { bg = colors.yellow, fg = colors.bg },
	b = { bg = colors.fg_gutter, fg = colors.yellow },
}

onedarkpro.replace = {
	a = { bg = colors.red, fg = colors.bg },
	b = { bg = colors.fg_gutter, fg = colors.red },
}

local inactive_bg = config.options.window_unfocused_color and colors.color_column or colors.bg
onedarkpro.inactive = {
	a = { bg = inactive_bg, fg = colors.blue },
	b = { bg = inactive_bg, fg = colors.fg_gutter_inactive, gui = "bold" },
	c = { bg = inactive_bg, fg = colors.fg_gutter_inactive },
}

local empty = require("lualine.component"):extend()
function empty:draw(default_highlight)
	self.status = ""
	self.applied_separator = ""
	self:apply_highlights(default_highlight)
	self:apply_section_separators()
	return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
	for name, section in pairs(sections) do
		local left = name:sub(9, 10) < "x"
		for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
			table.insert(section, pos * 2, { empty, color = { fg = colors.fg, bg = colors.bg } })
		end
		for id, comp in ipairs(section) do
			if type(comp) ~= "table" then
				comp = { comp }
				section[id] = comp
			end
			comp.separator = left and { right = "" } or { left = "" }
		end
	end
	return sections
end

local function search_result()
	if vim.v.hlsearch == 0 then
		return ""
	end
	local last_search = vim.fn.getreg("/")
	if not last_search or last_search == "" then
		return ""
	end
	local searchcount = vim.fn.searchcount({ maxcount = 9999 })
	return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

local function modified()
	if vim.bo.modified then
		return "+"
	elseif vim.bo.modifiable == false or vim.bo.readonly == true then
		return "-"
	end
	return ""
end

local function show_macro_recording()
	local recording_register = vim.fn.reg_recording()
	if recording_register == "" then
		return ""
	else
		return "Recording @" .. recording_register
	end
end

lualine.setup({
	options = {
		theme = onedarkpro,
		component_separators = "",
		section_separators = { left = "", right = "" },
	},
	sections = process_sections({
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{ "filename", file_status = false, path = 1, shorting_target = 1000 },
			{
				"%r",
				cond = function()
					return vim.bo.readonly
				end,
			},
			"diff",
			{ modified, color = { bg = colors.red, fg = colors.black } },
			{
				"%w",
				cond = function()
					return vim.wo.previewwindow
				end,
			},
			{
				"%q",
				cond = function()
					return vim.bo.buftype == "quickfix"
				end,
			},
		},
		lualine_c = {},
		lualine_x = { show_macro_recording },
		lualine_y = {
			{
				"diagnostics",
				source = { "nvim" },
				sections = { "hint" },
				diagnostics_color = { warn = { bg = colors.blue, fg = colors.black } },
			},
			{
				"diagnostics",
				source = { "nvim" },
				sections = { "warn" },
				diagnostics_color = { warn = { bg = colors.orange, fg = colors.black } },
			},
			{
				"diagnostics",
				source = { "nvim" },
				sections = { "error" },
				diagnostics_color = { error = { bg = colors.red, fg = colors.black } },
			},
			"filetype",
		},
		lualine_z = { "%l:%c", "%p%%/%L" },
	}),
	inactive_sections = {
		lualine_c = { "%f %y %m" },
		lualine_x = {},
	},
})

vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		lualine.refresh({
			place = { "statusline" },
		})
	end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		-- This is going to seem really weird!
		-- Instead of just calling refresh we need to wait a moment because of the nature of
		-- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
		-- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
		-- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
		-- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
		local timer = vim.loop.new_timer()
		timer:start(
			50,
			0,
			vim.schedule_wrap(function()
				lualine.refresh({
					place = { "statusline" },
				})
			end)
		)
	end,
})
