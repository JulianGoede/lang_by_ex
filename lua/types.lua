NIL = nil
BOOLEAN = true
NUMBER = 42
STRING = "foo"
USERDATA = nil -- needs a c/c++ struct to work
FUNCITON = function () end
-- lua is single threaded, but a COROUTINE is almost a thread
-- with the exception that global vars are shared
COROUTINE =  coroutine.create(FUNCITON)
TABLE = {}

-- NOTE: in lua nil means absence of a value
-- and thus iterating over this table will ignore
-- all nil entries..
BASIC_TYPES = {
    ["nil"] = NIL, -- will be ignored
    ["boolean"] = BOOLEAN,
    ["number"] = NUMBER,
    ["string"] = STRING,
    ["userdata"] = USERDATA,
    ["function"] = FUNCITON,
    ["thread"] = COROUTINE,
    ["table"] = TABLE
}


for type_name, element in pairs(BASIC_TYPES) do
    assert(type_name == type(element), "Type missmatch")
    print(type_name .. ": " .. tostring(element))
end
