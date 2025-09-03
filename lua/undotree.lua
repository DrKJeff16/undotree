---@class UndoTreeMod
local Undotree = {}

---@param opt? UndoTreeCollector.Opts
function Undotree.setup(opt)
  vim.validate("opt", opt, "table", true, "UndoTreeCollector.Opts")

  local Coll = require("undotree.collector")
  Undotree.coll = Coll.new(opt or {})
end

function Undotree.open()
  Undotree.coll:run()
end

function Undotree.close()
  Undotree.coll:close()
end

function Undotree.toggle()
  if Undotree.coll.src_bufnr then
    Undotree.coll:close()
    return
  end

  Undotree.coll:run()
end

return Undotree

-- vim:ts=2:sts=2:sw=2:et:ai:si:sta:
