let itemName = document.querySelector('#itemName');
let menuItem = document.querySelectorAll('.menuItem');
let modalBg =  document.querySelector('.modal-bg');
let closeButton = document.querySelector('.closeButton');
let cartButton = document.querySelector('.cartButton');
let cartItems = 0;


for(const item of menuItem){
	item.addEventListener('click', function(event){
		modalBg.classList.add('bg-active');
		document.querySelector('#itemName').innerHTML = item.id + ' ' + item.querySelector('.itemPrice').innerHTML;
		document.querySelector('#modalImage').src = item.querySelector('.itemPicture').src;

	});
}

closeButton.addEventListener('click', function(){
	modalBg.classList.remove('bg-active');	
});

cartButton.addEventListener('click', function(event){
	document.querySelector('#itemName').innerHTML = 'Clicked';
});