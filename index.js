const __index = document.getElementById("Index")
const _English = document.getElementById("English")
const _Chinese = document.getElementById("Chinese")
const _Phonetic = document.getElementById("Phonetic")
const _previous = document.getElementById("previous")
const _next = document.getElementById("next")
const _switch = document.getElementById("switch")
const _EnglishButton = document.getElementById("EnglishButton")
const _ChineseButton = document.getElementById("ChineseButton")
const _PhoneticButton = document.getElementById("PhoneticButton")
const _AllButton = document.getElementById("AllButton")
const _RangeButton = document.getElementById("RangeButton")

let dic = {}
let wordIndex = 0

const switchWord = _index => {
    __index.innerText = (_index + 1) + " / " + (dic.items.length)
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
    _RangeButton.max = dic.items.length - 1
}).catch(err => {
    console.log("ERROR", err)
})

_previous.onclick = () => {
    wordIndex = Math.max(wordIndex - 1, 0)
    switchWord(wordIndex)
}

_next.onclick = () => {
    wordIndex = Math.min(wordIndex + 1, dic.items.length - 1)
    switchWord(wordIndex)
}

_switch.onclick = () => {
    wordIndex = Number(window.prompt("Input your destination index")) - 1
    wordIndex = Math.max(wordIndex, 0)
    wordIndex = Math.min(wordIndex, dic.items.length - 1)
    switchWord(wordIndex)
}

_EnglishButton.onclick = () => {
    showEnglish()
    hideChinese()
    hidePhonetic()
}

_ChineseButton.onclick = () => {
    hideEnglish()
    showChinese()
    hidePhonetic()
}

_PhoneticButton.onclick = () => {
    hideEnglish()
    hideChinese()
    showPhonetic()
}

_AllButton.onclick = () => {
    showEnglish()
    showChinese()
    showPhonetic()
}

_RangeButton.onchange = () => {
    wordIndex = Number(_RangeButton.value)
    switchWord(wordIndex)
}

document.addEventListener("keydown", evt => {
    switch (evt.keyCode) {
        //leftArrow
        case 37: {
            wordIndex = Math.max(wordIndex - 1, 0)
            switchWord(wordIndex)
            break
        }
        //upArrow
        case 38: {
            wordIndex = Math.max(wordIndex - 1, 0)
            switchWord(wordIndex)
            break
        }
        //downArrow
        case 39: {
            wordIndex = Math.min(wordIndex + 1, dic.items.length - 1)
            switchWord(wordIndex)
            break
        }
        //rightArrow
        case 40: {
            wordIndex = Math.min(wordIndex + 1, dic.items.length - 1)
            switchWord(wordIndex)
            break
        }
        //A(all)
        case 65: {
            showEnglish()
            showChinese()
            showPhonetic()
            break
        }
        //C(Chinese)
        case 67: {
            hideEnglish()
            showChinese()
            hidePhonetic()
            break
        }
        //E(English)
        case 69: {
            showEnglish()
            hideChinese()
            hidePhonetic()
            break
        }
        //P(Phonetic)
        case 80: {
            hideEnglish()
            hideChinese()
            showPhonetic()
            break
        }
        //S(Switch)
        case 83: {
            wordIndex = Number(window.prompt("Input your destination index")) - 1
            wordIndex = Math.max(wordIndex, 0)
            wordIndex = Math.min(wordIndex, dic.items.length - 1)
            switchWord(wordIndex)
            break
        }
    }
})