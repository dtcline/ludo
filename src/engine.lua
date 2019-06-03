local config = require("config")

local systems = {}

-- load systems
for _,s in ipairs(config.systems) do
    table.insert(systems, require(s))
end
print("loaded ", #systems, " systems")

-- load entities
entities = {"tester"}

-- present entities to each system
for _,e in ipairs(entities) do
    for _,s in ipairs(systems) do
        s:consider(e)
    end
end

-- allow each system to process their entities
for _,s in ipairs(systems) do
    s:process()
end