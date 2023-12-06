const input = document.querySelector('#fruit');
const suggestions = document.querySelector('.suggestions ul');
const suggLi = document.querySelectorAll('.suggestions ul li');

const fruit = ['Apple', 'Apricot', 'Avocado 🥑', 'Banana', 'Bilberry', 'Blackberry', 'Blackcurrant', 'Blueberry', 'Boysenberry', 'Currant', 'Cherry', 'Coconut', 'Cranberry', 'Cucumber', 'Custard apple', 'Damson', 'Date', 'Dragonfruit', 'Durian', 'Elderberry', 'Feijoa', 'Fig', 'Gooseberry', 'Grape', 'Raisin', 'Grapefruit', 'Guava', 'Honeyberry', 'Huckleberry', 'Jabuticaba', 'Jackfruit', 'Jambul', 'Juniper berry', 'Kiwifruit', 'Kumquat', 'Lemon', 'Lime', 'Loquat', 'Longan', 'Lychee', 'Mango', 'Mangosteen', 'Marionberry', 'Melon', 'Cantaloupe', 'Honeydew', 'Watermelon', 'Miracle fruit', 'Mulberry', 'Nectarine', 'Nance', 'Olive', 'Orange', 'Clementine', 'Mandarine', 'Tangerine', 'Papaya', 'Passionfruit', 'Peach', 'Pear', 'Persimmon', 'Plantain', 'Plum', 'Pineapple', 'Pomegranate', 'Pomelo', 'Quince', 'Raspberry', 'Salmonberry', 'Rambutan', 'Redcurrant', 'Salak', 'Satsuma', 'Soursop', 'Star fruit', 'Strawberry', 'Tamarillo', 'Tamarind', 'Yuzu'];


function search(str) {
    let results = [];
    results.push(searchHandler)
    return results;
}

const searchHandler = function (e) {
    let handlerArr = input.value;
    const results = [];
    fruit.filter((fruits) => {
        if (fruits.includes(handlerArr)) {
            results.push(fruits)
            if (results.length < 10) {
                return showSuggestions(results)
            }
        }
    })
}

function showSuggestions(results) {

    if (input.value == '') {
        suggestions.innerHTML = '';
        suggestions.classList.add("no-suggestions")
    } else {
        suggestions.innerHTML = '';
        suggestions.classList.remove("no-suggestions")
        results.forEach(fruit => {
            const aSugg = document.createElement("li");
            aSugg.textContent = fruit;
            suggestions.appendChild(aSugg);
        })
        console.log(suggestions.classList)
    }

}

function useSuggestion(e) {
    if (e.target.tagName == "LI") {
        input.value = e.target.innerHTML
        suggestions.innerHTML = '';
        suggestions.classList.add("no-suggestions")
    }
}

input.addEventListener('keyup', searchHandler);
suggestions.addEventListener('click', useSuggestion);

