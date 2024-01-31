let root = document.getElementById('root');

const URL_R00T = "https://samyferhat.github.io/";

const urls = [
    "tic-tac-toe",
];

const list= urls.reduce((acc, url) => `<li><a href="${URL_R00T + url}">${url}</a></li>`,"");

let ul = document.createElement("ul");

ul.insertAdjacentHTML("afterBegin",list);

root.appendChild(ul);


