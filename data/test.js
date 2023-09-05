const test=require("./GRE_core.json")
const fs=require("fs")

let test1={
    title: "GRE Words",
    number: 6191,
    author: "Acan",
    date: "Tuesday, September 5, 2023 7:00:08 PM",
    index_num: 3,
    indexes: [
        "English", "Chinese", "Phonetic"
    ],
    items: []
}

test.content.forEach(item=>{
    test1.items.push({
        English: item.word,
        Chinese: item.description,
        Phonetic: item.phonetic
    })
})

fs.writeFileSync("test.json", JSON.stringify(test1))



console.log(test1.items.length)