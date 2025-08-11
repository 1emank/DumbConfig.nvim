M = {}

function M.setup (opts)
    M.opts = opts
    if type(opts) == "function" then
        opts()
        return
    end

    for _k, func in pairs(opts) do
        func()
    end
end

function M.reload ()
    M.setup(M.opts)
end

return M
