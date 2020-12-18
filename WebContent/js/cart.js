/**
 * 
 */
let itemName = document.querySelector('.itemName');
let menuItems = document.querySelectorAll(".menuItem");
let counter = 0;
let totalPrice = document.querySelector(".totalPrice");

for(let item of menuItems){
	
	item.dataset.index = counter;
	let button = document.createElement("button");
	button.classList.add(".deleteButton");
	button.innerHTML = "DELETE";
	
	button.addEventListener("click", function(){
		button.closest(".menuItem").remove();
		
		
		$.ajax({
    url: 'ProcessCart',
    type: 'POST',        
    data: {name: itemName.innerHTML, operation : "remove", index : item.dataset.index},
    success: function(data) {
        console.log('Success');
		location.reload();
    }
});
	});
	
	item.appendChild(button);
	counter++;

}



