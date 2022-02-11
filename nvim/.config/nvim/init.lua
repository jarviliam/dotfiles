----------------------------------------------------
--        _                  _ ___
--       (_)___ _______   __(_) (_)___ _____ ___
--      / / __ `/ ___/ | / / / / / __ `/ __ `__ \  Nvim 0.7 Config
--     / / /_/ / /   | |/ / / / / /_/ / / / / / /
--  __/ /\__,_/_/    |___/_/_/_/\__,_/_/ /_/ /_/
-- /___/
--
----------------------------------------------------

local ok, reload = pcall(require, "plenary.reload")
RELOAD = ok and reload.reload_module or function(...)
	return ...
end

function R(name)
	RELOAD(name)
	return require(name)
end

R("core.global")
R("core.auto")
R("core.settings")
R("plugins")
R("core.mappings")
