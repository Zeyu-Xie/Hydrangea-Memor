const _English = document.getElementById("English")
const _Chinese = document.getElementById("Chinese")
const _Phonetic = document.getElementById("Phonetic")

fetch("./data/GRE_words.json").then(res => res.json()).then(res => {
    console.log(res)

    _English.innerText = res.items[0]["English"]
    _Chinese.innerText = res.items[0]["Chinese"]
    _Phonetic.innerText = res.items[0]["Phonetic"]


}).catch(err => {
    console.log("ERROR", err)
})