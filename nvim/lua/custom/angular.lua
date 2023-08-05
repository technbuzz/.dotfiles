local path = require("plenary.path")
local scan = require("plenary.scandir")

local M = {}

local function load_file_into_buffer(file)
	local uri = vim.uri_from_fname(file)
	local new_buff = vim.uri_to_bufnr(uri)
	vim.api.nvim_win_set_buf(0, new_buff)
	vim.fn.execute("edit")
end

-- find the nearest angular module file by walking up the directory tree
-- looking for a file that matches the pattern *.module.ts
local function find_nearest_angular_module(starting_dir)
	local current_dir = path:new(starting_dir)
	local scan_result
	local count = 1
	-- keep going up directories until you find a `.module.ts` (or stop at max_depth as then something went wrong)
	repeat
		current_dir = current_dir:parent()
		scan_result = scan.scan_dir(current_dir:normalize(), { search_pattern = ".module.ts" })
		count = count + 1
	until #scan_result > 0 or count >= max_depth

	return scan_result[1]
end


function M.jump_to_nearest_module()
	local current_buffer = vim.api.nvim_buf_get_name(0)
	local module_relative_path = find_nearest_angular_module(current_buffer)

	if module_relative_path ~= nil then
		local module_absolute_path = path:new(module_relative_path):absolute()
		load_file_into_buffer(module_absolute_path)
	end
end

function M.jump_to_angular_component_part(extension)
	local buf_name = vim.api.nvim_buf_get_name(0)
  print(vim.inspect('buf_name', buf_name))
  print(vim.inspect(buf_name))

	local buf_path = path:new(buf_name)
  
	local relative_path = buf_path:make_relative()
  print(vim.inspect('relative_path', relative_path))
  print(vim.inspect( relative_path))
	-- extract just the filename
	local filename = string.match(relative_path, "([^/]+)$")

  print(vim.inspect('filename'))
  print(vim.inspect(filename))

	-- find the name before .component
	local component_name = string.match(filename, "(.-)%.component")

  print(vim.inspect("component_name"))
  print(vim.inspect(component_name))
	-- assemble the destination based on the extension
	local full_destination = buf_path:parent() .. "/" .. component_name .. ".component" .. "." .. extension

  print(vim.inspect("full_destination"))
  print(vim.inspect(full_destination))
	local exists = vim.fn.filereadable(full_destination)
  print(vim.inspect("exists"))
  print(vim.inspect(exists))
	-- don't open a buffer if the file doesn't exist since you may end up creating a file without knowing it
	if exists == 0 then
		vim.notify("File doesn't exist: " .. full_destination, vim.log.levels.WARN)
		return
	end

	load_file_into_buffer(full_destination)
end


return M
