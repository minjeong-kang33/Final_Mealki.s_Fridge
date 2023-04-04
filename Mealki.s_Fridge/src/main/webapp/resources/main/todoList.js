$(document).ready(function(){

const toDoForm = document.querySelector(".toDoForm");
const toDoInput = toDoForm.querySelector("input");
const toDoList = document.querySelector(".toDoList");

const TODOS_LS = 'toDos';
let toDos = [];

function saveToDos(empNum) { 
    localStorage.setItem(`TODOS_LS_${empNum}`, JSON.stringify(toDos));
}

function deleteToDo(event) {
  const btn = event.target;
  const li = btn.parentNode;
  toDoList.removeChild(li); 
  const cleanToDos = toDos.filter(function (toDo) { 
    return toDo.id !== parseInt(li.id);
  });
  toDos = cleanToDos; // 추출된 내용을 toDos에 넣음
  saveToDos(empNum);
}

function paintToDo(text) {
    const li = document.createElement("li"); 
    const delBtn = document.createElement("button"); 
    const span = document.createElement("span");
    const newId = toDos.length + 1;
    
    delBtn.className = "remove ti-close";
    delBtn.style.border="none";
    delBtn.style.backgroundColor ="transparent";
    delBtn.addEventListener("click", deleteToDo); 
    span.innerText = text;

    li.appendChild(span); 
    li.appendChild(delBtn);
    
    
    toDoList.appendChild(li);
    li.id = newId; 

    const toDoObj = { 
        text: text,
        id: newId
    };
    toDos.push(toDoObj); 
    saveToDos(empNum);
}

function handleSubmit(event) {
    event.preventDefault();
    const currentValue = toDoInput.value;
    paintToDo(currentValue);
    toDoInput.value = "";
}

function loadToDos(empNum) {
    const loadedToDos = localStorage.getItem(`TODOS_LS_${empNum}`);
    if (loadedToDos !== null) {
        const parsedToDos = JSON.parse(loadedToDos);
        parsedToDos.forEach(function (toDo) {
            paintToDo(toDo.text);
            
        });
    }
}

function init(empNum) {
    loadToDos(empNum);
    toDoForm.addEventListener("submit", handleSubmit);
}

init(empNum);
});