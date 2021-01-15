
let itemName = document.querySelector('.item-name');
let menuItems = document.querySelectorAll(".cart-item");
let counter = 0;
let totalPrice = document.querySelector(".totalPrice");
const payBtn = document.querySelector("#pay-btn");
const backBtn = document.querySelector('#back-btn');

backBtn.addEventListener('click', () => {
	location.href = 'menu.jsp';
})

for(let item of menuItems){
	
	item.dataset.index = counter;
	let button = document.createElement("button");
	button.classList.add(".item-delete-btn");
	button.innerHTML = '<i class="material-icons delete">delete</i>';
	item.appendChild(button);
	
	button.addEventListener("click", () => {
		button.closest(".cart-item").remove();
		
		
		$.ajax({
    url: 'ProcessCart',
    type: 'POST',        
    data: {name: itemName.innerHTML, operation : "remove", index : item.dataset.index},
    success: function(data) {
        console.log('Success');
		location.reload();
    }
});
		checkIfEmptyList();

	});
	
	counter++;
}


function checkIfEmptyList(){

    if(isEmptyCart()){
        payBtn.disabled = true;
        bottomHr.remove();
		console.log('empty')
    }
}


function isEmptyCart(){
    return document.querySelectorAll(".cart-item").length === 0;
}



