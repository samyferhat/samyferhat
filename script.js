let root = document.getElementById('root');

const URL_R00T = "https://samyferhat.github.io/";

const urls = [
    "tic-tac-toe",
    "meteo-du-jour-api",
    "quote-generator-api",

];

const list= urls.reduce((acc, url) => acc + `<li><a href="${URL_R00T + url}" target="_blank">${url}</a></li>`,"");

let ul = document.createElement("ul");

ul.insertAdjacentHTML("afterBegin",list);


root.appendChild(ul);


