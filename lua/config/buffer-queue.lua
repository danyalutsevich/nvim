-- limit number of listed buffers (FIFO style)
local MAX_BUFFERS = 3

local function enforce_buffer_limit()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  if #buffers > MAX_BUFFERS then
    -- sort by last used (older first)
    table.sort(buffers, function(a, b)
      return a.lastused < b.lastused
    end)
    -- delete oldest ones
    for i = 1, #buffers - MAX_BUFFERS do
      vim.api.nvim_buf_delete(buffers[i].bufnr, { force = true })
    end
  end
end

-- run every time you open a new buffer
vim.api.nvim_create_autocmd({ "BufAdd" }, {
  callback = enforce_buffer_limit,
})
