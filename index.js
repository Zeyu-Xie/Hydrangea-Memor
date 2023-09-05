const _English = document.getElementById("English")
const _Chinese = document.getElementById("Chinese")
const _Phonetic = document.getElementById("Phonetic")
let dic = {}
let wordIndex = 0

const switchWord = _index => {
    _English.innerText = dic.items[_index]["English"]
    _Chinese.innerText = dic.items[_index]["Chinese"]
    _Phonetic.innerText = dic.items[_index]["Phonetic"]
}

fetch("./data/GRE_words.json").then(res => res.json()).then(res => {
    dic = res
    switchWord(1537)
}).catch(err => {
    console.log("ERROR", err)
})