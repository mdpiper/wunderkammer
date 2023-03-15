# An example of passing a arguments into a Julia script.
#
# $ julia script-with-arguments.jl config.yaml output.txt 

println("File:")
println(PROGRAM_FILE)
println()

println("Arguments:")
for x in ARGS
    println(x)
end
