#!/usr/bin/env julia
"""
    ge_compilation(directory,outputfile)

This function merges all txt files in a directory into a single file. 
It was written to combine files generated by the function gedata_reformat into a single bathymetry.txt file for use in Delft3D

"""
function ge_compilation(directory,outputfile)
    open(outputfile,"w") do otp
        for filename in map(x->joinpath(directory, x), readdir(directory))
            if contains(filename,"/.")
            else
                open(filename,"r") do inp
                    for ln in readlines(inp)
                        write(otp,ln)
                    end
                    write(otp,"\n")
                end
            end
        end
    end
end

!isinteractive() && ge_compilation("files","bathymetry.txt")
