let menuItem = document.querySelectorAll('.menuItem');
let modalBg =  document.querySelector('.modal-bg');
let closeButton = document.querySelector('.closeButton');
let cartButton = document.querySelector('.cartButton');
let cartItems = 0;


for(const item of menuItem){
	item.addEventListener('click', function(){
		modalBg.classList.add('bg-active');
	});
}

closeButton.addEventListener('click', function(){
	modalBg.classList.remove('bg-active');	
});

cartButton.addEventListener('click', function(){
	document.querySelector('#itemName').innerHTML = "Items in the cart: " + ++cartItems;
});