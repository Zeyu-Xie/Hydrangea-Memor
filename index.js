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

const hideEnglish = () => {
    _English.style.display = "none"
}
const hideChinese = () => {
    _Chinese.style.display = "none"
}
const hidePhonetic = () => {
    _Phonetic.style.display = "none"
}
const showEnglish = () => {
    _English.style.display = "block"
}
const showChinese = () => {
    _Chinese.style.display = "block"
}
const showPhonetic = () => {
    _Phonetic.style.display = "block"
}

fetch("./data/GRE_words.json").then(res => res.json()).then(res => {
    dic = res
    switchWord(wordIndex)
}).catch(err => {
    console.log("ERROR", err)
})

document.addEventListener("click", () => {
    wordIndex++
    switchWord(wordIndex)
})

document.addEventListener("keydown", evt => {
    if (evt.keyCode === 32) {
        wordIndex++
        switchWord(wordIndex)
    }
})