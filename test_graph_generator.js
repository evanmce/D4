var fs = require('fs')

buffer = ""
possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

for (var i = 1; i < 500; i++){
    buffer += i
    buffer += ';'
    buffer += possible.charAt(Math.floor(Math.random() * possible.length))
    buffer += ';'
    used = []
    for (var j = Math.floor(Math.random() * 7); j>0; j--){  
        var next = Math.floor(Math.random() * (500 - i) + i)
        if(!used.includes(next) && next != i){
            used.push(next)
            buffer += next
            buffer += ','
        }
    }
    buffer += "\n"
}


fs.writeFileSync('pretty_ultra_big_graph.txt', buffer)
