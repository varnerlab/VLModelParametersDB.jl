# setup paths -
function _include_my_codes(path_to_src::String, fileNameArray::Array{String,1})

    try

        for file_name in fileNameArray
            
            path_to_load = joinpath(path_to_src, file_name)
            include(path_to_load)
        end

    catch error
        rethrow(error)
    end

end

# get files from dir -
searchdir(path,key) = filter(x -> contains(x, key), readdir(path))

# setup project paths -
const _PATH_TO_ROOT = dirname(pathof(@__MODULE__))
const _PATH_TO_BASE = joinpath(_PATH_TO_ROOT, "base")
const _PATH_TO_DATABASE = joinpath(_PATH_TO_ROOT, "database")

# load packages -
using DataFrames
using CSV
using SQLite
using UUIDs
using JSON

# load my codes -
my_code_array = searchdir(_PATH_TO_BASE, ".jl")
_include_my_codes(_PATH_TO_BASE, my_code_array)

# create a database connection -
const path_to_database_file = joinpath(_PATH_TO_DATABASE, "Parameters.db")