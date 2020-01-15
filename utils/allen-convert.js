const parse = require("csv-parse/lib/sync");
const fs = require('fs');
const math = require('mathjs')

let f = fs.readFileSync('./columns_metadata.csv', 'utf-8')
const records = parse(f, {columns: true})

let s = {}
records.map(e => s[e.structure_name]=[])

let a = {}
for(ss of Object.keys(s)) {
    records.map((e,i) => {if(e.structure_name == ss) {if(!a[e.structure_name]) a[e.structure_name] = []; a[e.structure_name].push(i+1)}})
}

let f2 = fs.readFileSync('./expression_matrix.csv', 'utf-8')
const records2 = parse(f2)

let f3 = fs.readFileSync('./rows_metadata.csv', 'utf-8')
const records3 = parse(f3)

let json = []
const calcMedian = i => {
    let o = {}
    let line = records2[i]
    Object.keys(a).map(e => {
        let c = []
        a[e].map(i => {
            c.push(line[i])
        })
        o[e]=math.median(...c)
    })
    o.name = records3[i+1][3]
    json.push(o)
}

records2.map((e,i) => {
    calcMedian(i)
})

fs.writeFileSync('allen.json', JSON.stringify(json))

