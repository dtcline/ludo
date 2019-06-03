local Input = {}
Input.__index = Input


Input.entities = {}


function Input:consider(e)
    if true then
        table.insert(self.entities, e)
    end
end


function Input:process()
    for _,e in ipairs(self.entities) do
        print(e)
    end
end


return Input